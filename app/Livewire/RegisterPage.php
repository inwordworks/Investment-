<?php

namespace App\Livewire;

use App\Models\User;
use Livewire\Component;
use Illuminate\Http\Request;

class RegisterPage extends Component
{
    public function render(Request $request)
    {
        $referUser = null;
        if ($request->ref) {
            $referUser =  User::where('id', $request->ref)->first();
        }

        return view('livewire.register-page', [
            'referUser' => $referUser
        ]);
    }
}
