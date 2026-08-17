<?php

namespace App\Imports;

use App\Models\P2pSubscriber;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Throwable;

class P2pSubscriberImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
{
    use SkipsFailures;

    public function startRow(): int
    {
        return 5;
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
        $serialNo  = $this->cleanValue($row[1] ?? null);
        $linkName  = $this->cleanValue($row[2] ?? null);
        $stationA  = $this->cleanValue($row[3] ?? null);
        $stationB  = $this->cleanValue($row[4] ?? null);
        $status    = $this->cleanValue($row[5] ?? null);
        $ownership = $this->cleanValue($row[6] ?? null);
        $frequency = $this->cleanValue($row[7] ?? null);

        if (empty($linkName)) {
            return null;
        }

        P2pSubscriber::updateOrCreate(
            [
                'link_name' => $linkName,
                'station_a' => $stationA,
                'station_b' => $stationB,
            ],
            [
                'serial_no' => $serialNo,
                'status'    => $status,
                'ownership' => $ownership,
                'frequency' => $frequency,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
