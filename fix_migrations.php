<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$migrations = [
    '0001_01_01_000001_create_cache_table',
    '0001_01_01_000002_create_jobs_table',
    '2014_10_12_100000_create_password_resets_table',
    '2025_12_28_130657_create_bandwidth_report_history_table',
    '2025_12_28_130657_create_bandwidth_reports_table',
    '2025_12_28_130657_create_customer_history_table',
    '2025_12_28_130657_create_customer_pops_table',
    '2025_12_28_130657_create_customer_vendors_table',
    '2025_12_28_130657_create_customers_table',
    '2025_12_28_130657_create_password_change_log_table',
    '2025_12_28_130657_create_pops_table',
    '2025_12_28_130657_create_regions_table',
    '2025_12_28_130657_create_roles_table',
    '2025_12_28_130657_create_stations_table',
    '2025_12_28_130657_create_users_table',
    '2025_12_28_130657_create_vendors_link_table',
    '2025_12_28_130657_create_vendors_table',
    '2025_12_28_130700_add_foreign_keys_to_bandwidth_reports_table',
    '2025_12_28_130700_add_foreign_keys_to_customer_history_table',
    '2025_12_28_130700_add_foreign_keys_to_customer_pops_table',
    '2025_12_28_130700_add_foreign_keys_to_customer_vendors_table',
    '2025_12_28_130700_add_foreign_keys_to_customers_table',
    '2025_12_28_130700_add_foreign_keys_to_password_change_log_table',
    '2025_12_28_130700_add_foreign_keys_to_pops_table',
    '2025_12_28_130700_add_foreign_keys_to_stations_table',
    '2025_12_28_130700_add_foreign_keys_to_users_table',
    '2025_12_28_130700_add_foreign_keys_to_vendors_link_table',
    '2025_12_28_130700_add_foreign_keys_to_vendors_table',
    '2025_12_28_133707_create_sessions_table',
    '2026_04_09_111553_add_department_id_to_users_table',
    '2026_04_10_000001_create_user_stations_table',
    '2026_04_10_000002_create_user_departments_table'
];

foreach ($migrations as $migration) {
    DB::table('migrations')->updateOrInsert(
        ['migration' => $migration],
        ['batch' => 1]
    );
}

echo "Migrations marked as completed successfully.\n";
