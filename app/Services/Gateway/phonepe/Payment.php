<?php

namespace App\Services\Gateway\phonepe;

use Facades\App\Services\BasicCurl;
use PhonePe\Env as PhonePeEnv;
use PhonePe\payments\v1\models\request\builders\InstrumentBuilder;
use PhonePe\payments\v1\models\request\builders\PgPayRequestBuilder;
use PhonePe\payments\v1\PhonePePaymentClient;

class Payment
{
    public static function prepareData($deposit, $gateway)
    {

        try {
            $MERCHANTID =  $gateway->parameters->merchant_id;
            $SALTKEY = $gateway->parameters->salt_key;
            $SALTINDEX = intval($gateway->parameters->salt_index ?? '1');
            $phonepeEnv = PhonePeEnv::UAT;
            $SHOULDPUBLISHEVENTS = boolval($gateway->parameters->publish_events ?? false);

            $merchantUserId = optional($deposit->user)->username;

            $merchantTransactionId = $deposit->trx_id;

            $callbackUrl = route('phonepe.callback', ['transactionId' => $merchantTransactionId]);
            // $redirectUrl = route('user.transaction.list');

            if (empty($MERCHANTID) || empty($SALTKEY)) {
                $send['error'] = true;
                $send['message'] = 'Merchant un-available.';
                return json_encode($send);
            }

            $phonePePaymentsClient = new PhonePePaymentClient($MERCHANTID, $SALTKEY, $SALTINDEX, $phonepeEnv, $SHOULDPUBLISHEVENTS);

            $request = PgPayRequestBuilder::builder()
                ->mobileNumber($deposit->user->phone ?? 9873350509)
                ->callbackUrl(url($callbackUrl))
                ->merchantId($MERCHANTID)
                ->merchantUserId($merchantUserId)
                ->amount($gateway->environment == 'live' ? ($deposit->payable_amount * 100) : 400)
                ->merchantTransactionId($merchantTransactionId)
                ->redirectUrl(url($callbackUrl))
                ->redirectMode("REDIRECT")
                ->paymentInstrument(InstrumentBuilder::buildPayPageInstrument())
                ->build();

            // $send['error'] = true;
            // $send['message'] = 'Unexpected Error! Please Try Again';
            // $send['error_data'] = $request;
            // return json_encode($send);

            $response = $phonePePaymentsClient->pay($request);

            if (!isset($response->error)) {
                $url = $response->getInstrumentResponse()?->getRedirectInfo()->getUrl();
                $send['redirect'] = true;
                $send['redirect_external'] = true;
                $send['redirect_url'] = $url;
            } else {
                $send['error'] = true;
                $send['message'] = 'Unexpected Error! Please Try Again';
                $send['error_data'] = $response;
            }

            // http://127.0.0.1:8000/payment-process/D700273445744

            return json_encode($send);
        } catch (\Throwable $th) {
            // throw $th;
            $send['error'] = true;
            $send['message'] = $th->getMessage();
            return json_encode($send);
        }
    }
}
