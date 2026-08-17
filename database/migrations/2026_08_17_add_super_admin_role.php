<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Modify the role enum to include 'super_admin'
        DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('Admin', 'Employee', 'super_admin') DEFAULT 'Admin'");
    }

    public function down(): void
    {
        // Revert to original enum
        DB::statement("ALTER TABLE users MODIFY COLUMN role ENUM('Admin', 'Employee') DEFAULT 'Admin'");
    }
};
