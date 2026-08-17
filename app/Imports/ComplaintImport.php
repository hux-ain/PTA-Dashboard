<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class ComplaintImport implements WithMultipleSheets
{
    public function sheets(): array
    {
        return [
            0 => new ComplaintSheetImport('Complaint Resolved within 48 h'),
            1 => new ComplaintSheetImport('Complaint Log of Last 3 months'),
        ];
    }
}
