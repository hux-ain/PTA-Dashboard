<?php

namespace App\Imports;

use App\Models\Subscriber;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Throwable;

class SubscriberImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
{
    use SkipsFailures;

    public function startRow(): int
    {
        return 4;
    }

    public function batchSize(): int
    {
        return 100;
    }

    public function chunkSize(): int
    {
        return 100;
    }

    private function cleanValue($value): string
    {
        if (is_object($value) && method_exists($value, '__toString')) {
            $value = (string) $value;
        }
        return trim((string) $value);
    }

    public function model(array $row)
    {
        $serialNo    = $this->cleanValue($row[0] ?? null);
        $companyName = $this->cleanValue($row[1] ?? null);
        $ntnCnic     = $this->cleanValue($row[2] ?? null);
        $address     = $this->cleanValue($row[3] ?? null);
        $contact     = $this->cleanValue($row[4] ?? null);
        $package     = $this->cleanValue($row[5] ?? null);

        if (empty($companyName)) {
            return null;
        }

        Subscriber::updateOrCreate(
            [
                'company_name' => $companyName,
                'ntn_cnic'     => $ntnCnic,
            ],
            [
                'serial_no'    => $serialNo,
                'address'      => $address,
                'contact'      => $contact,
                'package'      => $package,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
