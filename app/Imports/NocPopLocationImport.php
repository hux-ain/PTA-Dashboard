<?php

namespace App\Imports;

use App\Models\NocPopLocation;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Throwable;

class NocPopLocationImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
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
        $serialNo      = $this->cleanValue($row[0] ?? null);
        $popName       = $this->cleanValue($row[1] ?? null);
        $gpsCoordinates = $this->cleanValue($row[2] ?? null);
        $address       = $this->cleanValue($row[3] ?? null);
        $city          = $this->cleanValue($row[4] ?? null);
        $ownColocated  = $this->cleanValue($row[5] ?? null);

        if (empty($popName)) {
            return null;
        }

        NocPopLocation::updateOrCreate(
            [
                'pop_name' => $popName,
                'city'     => $city,
            ],
            [
                'serial_no'       => $serialNo,
                'gps_coordinates' => $gpsCoordinates,
                'address'         => $address,
                'own_colocated'   => $ownColocated,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
