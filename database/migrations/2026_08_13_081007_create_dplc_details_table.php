<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('dplc_details', function (Blueprint $table) {
            $table->id();
            $table->string('serial_no')->nullable()->index();
            $table->longText('point_a_gps');
            $table->longText('point_b_gps');
            $table->string('service_provider');
            $table->string('total_bandwidth_acquired');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dplc_details');
    }
};
