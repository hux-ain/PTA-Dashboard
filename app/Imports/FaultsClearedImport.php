<?php

namespace App\Imports;

use App\Models\FaultsCleared;
use Carbon\Carbon;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use Throwable;

class FaultsClearedImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
{
    use SkipsFailures;

    public function startRow(): int
    {
        return 2;
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

    private function parseDate($value)
    {
        if (empty($value)) {
            return null;
        }
        if (is_numeric($value)) {
            try {
                return Carbon::instance(Date::excelToDateTimeObject((float) $value));
            } catch (\Exception $e) {
                return null;
            }
        }
        try {
            return Carbon::parse((string) $value);
        } catch (\Exception $e) {
            return null;
        }
    }

    public function model(array $row)
    {
        $customerName     = $this->cleanValue($row[1] ?? null);
        $complaintChannel = $this->cleanValue($row[2] ?? null);
        $mainCity         = $this->cleanValue($row[3] ?? null);
        $openedAt         = $this->parseDate($row[4] ?? null);
        $closedAt         = $this->parseDate($row[5] ?? null);
        $issue            = $this->cleanValue($row[6] ?? null);
        $status           = $this->cleanValue($row[7] ?? null);
        $affect           = $this->cleanValue($row[8] ?? null);
        $owner            = $this->cleanValue($row[9] ?? null);
        $agingDowntime    = $this->cleanValue($row[10] ?? null);
        $rfo              = $this->cleanValue($row[11] ?? null);
        $rca              = $this->cleanValue($row[12] ?? null);

        if (empty($customerName)) {
            return null;
        }

        FaultsCleared::updateOrCreate(
            [
                'customer_name' => $customerName,
                'opened_at'     => $openedAt,
                'issue'         => $issue,
            ],
            [
                'complaint_channel' => $complaintChannel,
                'main_city'         => $mainCity,
                'closed_at'         => $closedAt,
                'status'            => $status,
                'affect'            => $affect,
                'owner'             => $owner,
                'aging_downtime'    => $agingDowntime,
                'rfo'               => $rfo,
                'rca'               => $rca,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
