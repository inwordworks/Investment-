<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\SupportTicket;
use App\Models\SupportTicketAttachment;
use App\Models\SupportTicketMessage;
use App\Traits\Notify;
use App\Traits\Upload;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class SupportTicketController extends Controller
{

    use Upload, Notify;

    public function __construct()
    {
        $this->theme = template();
        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();
            return $next($request);
        });
    }

    public function index()
    {
        $user = Auth::user();
        if ($user->id == null) {
            abort(404);
        }
        $tickets = SupportTicket::where('user_id', $user->id)->latest()->paginate(config('basic.paginate'));
        return view($this->theme. 'user.support_ticket.index', compact('tickets'));

    }

    public function create()
    {
        $user = $this->user;
        return view($this->theme.'user.support_ticket.create', compact( 'user'));
    }

    public function store(Request $request)
    {
        $this->newTicketValidation($request);
        $random = rand(100000, 999999);
        $ticket = $this->saveTicket($request, $random);

        $message = $this->saveMsgTicket($request, $ticket);

        if (!empty($request->images)) {
            $numberOfAttachments = count($request->images);
            for ($i = 0; $i < $numberOfAttachments; $i++) {
                if ($request->hasFile('images.' . $i)) {
                    $file = $request->file('images.' . $i);
                    $supportFile = $this->fileUpload($file, config('filelocation.ticket.path'), null,null, 'webp',60);
                    if (empty($supportFile['path'])) {
                        throw new \Exception('File could not be uploaded.');
                    }
                    $this->saveAttachment($message, $supportFile['path'], $supportFile['driver']);
                }
            }
        }

        $msg = [
            'username' => optional($ticket->user)->username,
            'ticket_id' => $ticket->ticket
        ];
        $action = [
            "name" => optional($ticket->user)->firstname . ' ' . optional($ticket->user)->lastname,
            "image" => getFile(optional($ticket->user)->image_driver, optional($ticket->user)->image),
            "link" => route('admin.ticket.view',$ticket->id),
            "icon" => "fas fa-ticket-alt text-white"
        ];
        $this->adminPushNotification('SUPPORT_TICKET_CREATE', $msg, $action);
        $this->adminMail('SUPPORT_TICKET_CREATE', $msg);

        return redirect()->route('user.ticket.list')->with('success', 'Your Ticket has been pending');
    }

    public function ticketView($ticketId)
    {
        $ticket = SupportTicket::where('ticket', $ticketId)->latest()->with('messages')->firstOrFail();
        $user = Auth::user();
        $admin = Admin::first();
        return view($this->theme.'user.support_ticket.view', compact('ticket',  'user','admin'));
    }

    public function reply(Request $request, $id)
    {

        try {
            $ticket = SupportTicket::findOrFail($id);
            $message = new SupportTicketMessage();

            if ($request->replayTicket == 1) {
                $images = $request->file('attachments');
                $allowedExtensions = array('jpg', 'png', 'jpeg', 'pdf');
                $this->validate($request, [
                    'attachments' => [
                        'max:4096',
                        function ($fail) use ($images, $allowedExtensions) {
                            foreach ($images as $img) {
                                $ext = strtolower($img->getClientOriginalExtension());
                                if (($img->getSize() / 1000000) > 2) {
                                    throw ValidationException::withMessages(['attachments'=>"Images MAX  2MB ALLOW!"]);
                                }
                                if (!in_array($ext, $allowedExtensions)) {
                                    throw ValidationException::withMessages(['attachments'=>"Only png, jpg, jpeg, pdf images are allowed"]);
                                }
                            }
                            if (count($images) > 5) {
                                throw ValidationException::withMessages(['attachments'=>"Maximum 5 images can be uploaded"]);
                            }
                        },
                    ],
                    'message' => 'required',
                ]);

                $ticket->status = 2;
                $ticket->last_reply = Carbon::now();
                $ticket->save();

                $message->support_ticket_id = $ticket->id;
                $message->message = $request->message;
                $message->save();

                if (!empty($request->attachments)) {
                    $numberOfAttachments = count($request->attachments);
                    for ($i = 0; $i < $numberOfAttachments; $i++) {
                        if ($request->hasFile('attachments.' . $i)) {
                            $file = $request->file('attachments.' . $i);
                            $supportFile = $this->fileUpload($file, config('filelocation.ticket.path'), null,null,'webp',60);
                            if (empty($supportFile['path'])) {
                                throw new \Exception('File could not be uploaded.');
                            }
                            $this->saveAttachment($message, $supportFile['path'], $supportFile['driver']);
                        }
                    }
                }

                $msg = [
                    'username' => optional($ticket->user)->username,
                    'ticket_id' => $ticket->ticket
                ];
                $action = [
                    "name" => optional($ticket->user)->firstname . ' ' . optional($ticket->user)->lastname,
                    "image" => getFile(optional($ticket->user)->image_driver, optional($ticket->user)->image),
                    "link" => route('admin.ticket.view',$ticket->id),
                    "icon" => "fas fa-ticket-alt text-white"
                ];
                $this->adminPushNotification('SUPPORT_TICKET_CREATE', $msg, $action);

                return back()->with('success', 'Ticket has been replied');
            } elseif ($request->replayTicket == 2) {
                $ticket->status = 3;
                $ticket->last_reply = Carbon::now();
                $ticket->save();

                return back()->with('success', 'Ticket has been closed');
            }
        }catch (\Exception $exception){
            return back()->with('error', $exception->getMessage());
        }

    }


    public function download($ticket_id)
    {
        $attachment = SupportTicketAttachment::with('supportMessage', 'supportMessage.ticket')->findOrFail(decrypt($ticket_id));
        $file = $attachment->file;
        $full_path = getFile($attachment->driver, $file);
        $title = slug($attachment->supportMessage->ticket->subject) . '-' . $file;
        header('Content-Disposition: attachment; filename="' . $title);
        header("Content-Type: " . $full_path);
        return readfile($full_path);
    }





    public function close(SupportTicket $ticket)
    {
       $ticket->status = 3;
       $ticket->save();
       return back()->with('success', 'Ticket has been closed');
    }

    public function newTicketValidation(Request $request): void
    {
        $images = $request->file('attachments');
        $allowedExtension = array('jpg', 'png', 'jpeg', 'pdf');

        $this->validate($request, [
            'attachments' => [
                'max:4096',
                function ($attribute, $value, $fail) use ($images, $allowedExtension) {
                    foreach ($images as $img) {
                        $ext = strtolower($img->getClientOriginalExtension());
                        if (($img->getSize() / 1000000) > 2) {
                            throw ValidationException::withMessages(['attachments'=>"Images MAX  2MB ALLOW!"]);
                        }
                        if (!in_array($ext, $allowedExtension)) {
                            throw ValidationException::withMessages(['attachments'=>"Only png, jpg, jpeg, pdf images are allowed"]);
                        }
                    }
                    if (count($images) > 5) {
                        throw ValidationException::withMessages(['attachments'=>"Maximum 5 images can be uploaded"]);
                    }
                },
            ],
            'subject' => 'required|max:100',
            'message' => 'required'
        ]);
    }


    public function saveTicket(Request $request, $random): SupportTicket
    {
        $ticket = new SupportTicket();
        $ticket->user_id = $this->user->id;
        $ticket->ticket = $random;
        $ticket->subject = $request->subject;
        $ticket->status = 0;
        $ticket->last_reply = Carbon::now();
        $ticket->save();
        return $ticket;
    }


    public function saveMsgTicket(Request $request, $ticket): SupportTicketMessage
    {
        $message = new SupportTicketMessage();
        $message->support_ticket_id = $ticket->id;
        $message->message = $request->message;
        $message->save();
        return $message;
    }

    /**
     * @param $message
     * @param $image
     * @param $path
     * @throws \Exception
     */
    public function saveAttachment($message, $path, $driver): void
    {
        $attachment = SupportTicketAttachment::create([
            'support_ticket_message_id' => $message->id,
            'file' => $path ?? null,
            'driver' => $driver ?? 'local',
        ]);

        if (!$attachment){
            throw new \Exception('Something went wrong');
        }
    }




}
