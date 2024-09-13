<?php

namespace App\Http\Controllers;

use App\Models\Deposit;
use App\Models\Gateway;
use Facades\App\Services\BasicService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use PhonePe\Env as PhonePeEnv;
use PhonePe\payments\v1\PhonePePaymentClient;

class PhonepeController extends Controller
{
    public Gateway $gateway;
    public function __construct()
    {
        $this->gateway = Gateway::where('code', 'phonepe')->first();
    }
    public function initiatePayment(Request $request) {}
    public function paymentStatus($transactionId, Request $request)
    {
        // Log::debug('phonepe-paymentStatus', $request->all());
        // [2024-09-12 19:25:50] local.DEBUG: phonepe-paymentStatus {"code":"PAYMENT_SUCCESS","merchantId":"PGTESTPAYUAT105","transactionId":"TRANSACTION1726149274","amount":"100","providerReferenceId":"T2409121924346219777166","param1":"na","param2":"na","param3":"na","param4":"na","param5":"na","param6":"na","param7":"na","param8":"na","param9":"na","param10":"na","param11":"na","param12":"na","param13":"na","param14":"na","param15":"na","param16":"na","param17":"na","param18":"na","param19":"na","param20":"na","checksum":"2ec420101ce340d500564d384adb5625accf5354bedcfa4588a9a4d915c2dbd0###1"}

        // http://127.0.0.1:8000/phonepe_status/D700273445747

        if ($request->isMethod('POST')) {
            $response = $request->all();

            if (isset($response['code']) && $response['code'] == 'PAYMENT_SUCCESS') {
                $transactionId = $request->input('transactionId');

                $deposit = Deposit::where('trx_id', $transactionId)->first();
                $deposit->payment_id = $request->input('providerReferenceId') ?? null;
                // $deposit->status = 1;
                $deposit->save();

                BasicService::preparePaymentUpgradation($deposit);

                return redirect()->route('success');
            }
            return redirect()->route('failed');
        } else {
            try {
                $MERCHANTID =  $this->gateway->parameters->merchant_id;
                $SALTKEY = $this->gateway->parameters->salt_key;
                $SALTINDEX = intval($this->gateway->parameters->salt_index ?? '1');
                $SHOULDPUBLISHEVENTS = boolval($this->gateway->parameters->publish_events ?? false);
                $phonepeEnv = PhonePeEnv::UAT;

                $phonePePaymentsClient = new PhonePePaymentClient($MERCHANTID, $SALTKEY, $SALTINDEX, $phonepeEnv, $SHOULDPUBLISHEVENTS);

                $checkStatus = $phonePePaymentsClient->statusCheck($transactionId);
                $response = [
                    'merchantId' => $checkStatus->getMerchantId(),
                    'merchantTransactionId' => $checkStatus->getMerchantTransactionId(),
                    'transactionId' => $checkStatus->getTransactionId(),
                    'amount' => $checkStatus->getAmount(),
                    'state' => $checkStatus->getState(),
                    'responseCode' => $checkStatus->getResponseCode(),
                ];

                if (isset($response['responseCode']) && $response['responseCode'] == "SUCCESS" && isset($response['state']) && $response['state'] == "COMPLETED") {
                    try {
                        $deposit = Deposit::where('trx_id', $transactionId)->first();
                        $deposit->payment_id = $response['transactionId'] ?? null;
                        // $deposit->status = 1;
                        $deposit->save();

                        BasicService::preparePaymentUpgradation($deposit);

                        return redirect()->route('success');
                    } catch (\Throwable $th) {
                        return print_r($th->getMessage());
                    }
                }
                return redirect()->route('failed');

                // Log::debug('phonepe-get-payment-status', [$response]);
                // return print_r($response);

            } catch (\Throwable $th) {
                return redirect()->route('failed');
                return print_r($th->getMessage());
                //throw $th;
            }
            return redirect()->route('failed');
        }
        return redirect()->route('failed');
    }
}
