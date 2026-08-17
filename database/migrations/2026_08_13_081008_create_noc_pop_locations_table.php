<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('noc_pop_locations', function (Blueprint $table) {
            $table->id();
            $table->string('serial_no')->nullable()->index();
            $table->string('pop_name')->index();
            $table->text('gps_coordinates');
            $table->text('address');
            $table->string('city');
            $table->string('own_colocated');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('noc_pop_locations');
    }
};
