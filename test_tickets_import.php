<?php
require 'vendor/autoload.php';

$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

// Test importing tickets
use App\Imports\TicketsImport;
use Maatwebsite\Excel\Facades\Excel;

$file = 'D:/Work/Data for PTA/Data for PTA/tickets_2026-08-15.xlsx';

if (!file_exists($file)) {
    echo "File not found: $file\n";
    exit(1);
}

try {
    $countBefore = \App\Models\Complaint::count();
    echo "Before import: " . $countBefore . " complaints\n";
    
    Excel::import(new TicketsImport, $file);
    
    $countAfter = \App\Models\Complaint::count();
    echo "After import: " . $countAfter . " complaints\n";
    echo "Imported: " . ($countAfter - $countBefore) . " new records\n";
    
    // Show sample data
    $sample = \App\Models\Complaint::where('source_sheet', 'Tickets')->first();
    if ($sample) {
        echo "\nSample imported record:\n";
        echo "  Customer: " . $sample->customer_name . "\n";
        echo "  Channel: " . $sample->complaint_channel . "\n";
        echo "  City: " . $sample->main_city . "\n";
        echo "  Status: " . $sample->status . "\n";
        echo "  Issue: " . $sample->issue . "\n";
    }
    
    echo "\n✓ Tickets import completed successfully!\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
    echo $e->getTraceAsString();
    exit(1);
}
?>
