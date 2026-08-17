<?php

namespace App\Imports;

use App\Models\DplcDetail;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Throwable;

class DplcDetailImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
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
        $serialNo             = $this->cleanValue($row[0] ?? null);
        $pointAGps            = $this->cleanValue($row[1] ?? null);
        $pointBGps            = $this->cleanValue($row[2] ?? null);
        $serviceProvider      = $this->cleanValue($row[3] ?? null);
        $totalBandwidthAcquired = $this->cleanValue($row[4] ?? null);

        if (empty($pointAGps)) {
            return null;
        }

        DplcDetail::updateOrCreate(
            [
                'point_a_gps' => $pointAGps,
                'point_b_gps' => $pointBGps,
            ],
            [
                'serial_no'               => $serialNo,
                'service_provider'        => $serviceProvider,
                'total_bandwidth_acquired' => $totalBandwidthAcquired,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
