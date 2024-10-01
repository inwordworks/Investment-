<?php

namespace App\Exports;

use App\Models\Payout;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;


class WithdrawExport implements FromCollection, WithMapping, WithHeadings, WithStyles, ShouldAutoSize
{
    public $extraHeadings = [];

    public $payouts;

    public function __construct($payouts)
    {
        $extraHeadings = [];
        foreach ($payouts[0]->userkyc->kyc_info as $kyc_info) {
            $extraHeadings[] = $kyc_info->field_label;
        }
        $this->payouts = $payouts;
        $this->extraHeadings = $extraHeadings;
    }

    public function collection()
    {
        return $this->payouts;
    }

    public function map($payout): array
    {
        $kycData = [];
        foreach ($payout->userkyc->kyc_info as $kyc_info) {
            $kycData[] = $kyc_info->field_value;
            $this->extraHeadings[] = $kyc_info->field_label;
        }
        return [
            $payout->trx_id,
            $payout->user->username,
            $payout->user->firstname . ' ' . $payout->user->lastname,
            $payout->amount,
            $payout->net_amount,
            date('d M, Y', strtotime($payout->created_at)),
            ...$kycData,
        ];
    }

    public function headings(): array
    {
        $headings = [
            'Trx Number',
            'Username',
            'User Full Name',
            'Amount Withdraw',
            'Amount Payable',
            'Requested',
        ];
        foreach ($this->extraHeadings as $extraHeading) {
            $headings[] = $extraHeading;
        }
        return $headings;
    }

    public function styles(Worksheet $sheet)
    {
        return [
            // Style the first row as bold text.
            1 => ['font' => ['bold' => true]],
        ];
    }
}
