<?php

namespace App\Imports;

use App\Models\DarkCoreLink;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use PhpOffice\PhpSpreadsheet\RichText\RichText;
use Throwable;

class DarkCoreImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
{
    use SkipsFailures;

    public function startRow(): int
    {
        return 3;
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
        if ($value instanceof RichText) {
            $value = $value->__toString();
        }
        if (is_object($value) && method_exists($value, '__toString')) {
            $value = (string) $value;
        }
        return trim((string) $value);
    }

    public function model(array $row)
    {
        $name                = $this->cleanValue($row[0] ?? null);
        $pointA              = $this->cleanValue($row[1] ?? null);
        $pointB              = $this->cleanValue($row[2] ?? null);
        $serviceProviderName = $this->cleanValue($row[3] ?? null);
        $serviceType         = $this->cleanValue($row[4] ?? null);
        $ownOrLease          = $this->cleanValue($row[5] ?? null);

        if (empty($name)) {
            return null;
        }

        DarkCoreLink::updateOrCreate(
            [
                'name'     => $name,
                'point_a'  => $pointA,
                'point_b'  => $pointB,
            ],
            [
                'service_provider_name' => $serviceProviderName,
                'service_type'          => $serviceType,
                'own_or_lease'          => $ownOrLease,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
