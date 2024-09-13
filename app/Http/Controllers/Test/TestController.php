<?php

namespace App\Http\Controllers\Test;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use PhonePe\Env as PhonePeEnv;
use PhonePe\payments\v1\models\request\builders\InstrumentBuilder;
use PhonePe\payments\v1\models\request\builders\PgPayRequestBuilder;
use PhonePe\payments\v1\PhonePePaymentClient;

class TestController extends Controller
{
    public function index()
    {
        try {
            $MERCHANTID = 'PGTESTPAYUAT105';
            $SALTKEY = 'c45b52fe-f2c5-4ef6-a6b5-131aa89ed133';
            $SALTINDEX = 1;
            $phonepeEnv = PhonePeEnv::UAT;
            $SHOULDPUBLISHEVENTS = false;

            $merchantUserId = time();

            $phonePePaymentsClient = new PhonePePaymentClient($MERCHANTID, $SALTKEY, $SALTINDEX, $phonepeEnv, $SHOULDPUBLISHEVENTS);

            $merchantTransactionId = 'D700273445742';

            $callbackUrl = route('phonepe.callback', ['transactionId' => $merchantTransactionId]);

            $request = PgPayRequestBuilder::builder()
                ->mobileNumber("9873350509")
                ->callbackUrl($callbackUrl)
                ->merchantId($MERCHANTID)
                ->merchantUserId($merchantUserId)
                ->amount(100)
                ->merchantTransactionId($merchantTransactionId)
                ->redirectUrl($callbackUrl)
                ->redirectMode("REDIRECT")
                ->paymentInstrument(InstrumentBuilder::buildPayPageInstrument())
                ->build();
            // return print_r(['request' => $request]);

            $response = $phonePePaymentsClient->pay($request);
            // return print_r(['response' => $response]);
            $url = $response->getInstrumentResponse()?->getRedirectInfo()->getUrl();
            return var_dump(['yrl' => $url]);
        } catch (\Throwable $th) {
            return print_r(['error' => $th->getMessage()]);
        }
    }
}
