<?php

namespace App\Imports;

use App\Models\Complaint;
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

class TicketsImport implements ToModel, WithStartRow, WithBatchInserts, WithChunkReading, SkipsOnError, SkipsOnFailure
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
        // Mapping from tickets file columns
        // Column order: #, Ticket No, Customer, Connection, Channel, Station, Opened At, Closed At, Issue, Status, Owner, Affect, RFO, RCA, Aging, Created By
        
        $ticketNo       = $this->cleanValue($row[1] ?? null); // Ticket No
        $customer       = $this->cleanValue($row[2] ?? null); // Customer
        $connection     = $this->cleanValue($row[3] ?? null); // Connection
        $channel        = $this->cleanValue($row[4] ?? null); // Channel
        $station        = $this->cleanValue($row[5] ?? null); // Station
        $openedAt       = $this->parseDate($row[6] ?? null); // Opened At
        $closedAt       = $this->parseDate($row[7] ?? null); // Closed At
        $issue          = $this->cleanValue($row[8] ?? null); // Issue
        $status         = $this->cleanValue($row[9] ?? null); // Status
        $owner          = $this->cleanValue($row[10] ?? null); // Owner
        $affect         = $this->cleanValue($row[11] ?? null); // Affect
        $rfo            = $this->cleanValue($row[12] ?? null); // RFO
        $rca            = $this->cleanValue($row[13] ?? null); // RCA
        $aging          = $this->cleanValue($row[14] ?? null); // Aging
        $createdBy      = $this->cleanValue($row[15] ?? null); // Created By

        if (empty($customer)) {
            return null;
        }

        // Combine metadata into update_log
        $updateLog = "Ticket: {$ticketNo} | Connection: {$connection} | Created By: {$createdBy}";

        Complaint::updateOrCreate(
            [
                'customer_name' => $customer,
                'opened_at'     => $openedAt,
                'issue'         => $issue,
            ],
            [
                'source_sheet'       => 'Tickets',
                'complaint_channel'  => $channel,
                'main_city'          => $station,
                'closed_at'          => $closedAt,
                'status'             => $status,
                'affect'             => $affect,
                'owner'              => $owner,
                'aging_downtime'     => $aging,
                'rfo'                => $rfo,
                'rca'                => $rca,
                'update_log'         => $updateLog,
            ]
        );

        return null;
    }

    public function onError(Throwable $e)
    {
    }
}
