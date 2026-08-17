<?php
require 'vendor/autoload.php';

$file = 'D:/Work/Data for PTA/Data for PTA/tickets_2026-08-15.xlsx';

if (!file_exists($file)) {
    die("File not found: $file\n");
}

try {
    $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
    $spreadsheet = $reader->load($file);
    $sheet = $spreadsheet->getActiveSheet();
    $rows = $sheet->toArray();
    
    echo "=== TICKETS FILE STRUCTURE ===\n";
    echo "Total rows: " . (count($rows) - 1) . " (excluding header)\n\n";
    
    echo "Column Headers:\n";
    $headers = $rows[0];
    foreach ($headers as $i => $header) {
        if ($header) echo ($i + 1) . ". " . $header . "\n";
    }
    
    echo "\nFirst 2 data rows (sample):\n";
    for ($i = 1; $i <= min(2, count($rows) - 1); $i++) {
        echo "\nRow " . ($i + 1) . ":\n";
        foreach ($headers as $j => $header) {
            if ($header && isset($rows[$i][$j])) {
                $val = $rows[$i][$j];
                if (is_object($val) && method_exists($val, 'format')) {
                    $val = $val->format('Y-m-d H:i:s');
                }
                echo "  $header: $val\n";
            }
        }
    }
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
