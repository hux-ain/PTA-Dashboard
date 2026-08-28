<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('subscribers', function (Blueprint $table) {
            $table->string('district', 100)->nullable()->after('company_name')->index();
        });
    }

    public function down(): void
    {
        Schema::table('subscribers', function (Blueprint $table) {
            $table->dropColumn('district');
        });
    }
};
