<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('p2p_subscribers', function (Blueprint $table) {
            $table->id();
            $table->string('serial_no')->nullable()->index();
            $table->string('link_name')->nullable()->index();
            $table->text('station_a');
            $table->text('station_b');
            $table->string('status');
            $table->string('ownership');
            $table->string('frequency');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('p2p_subscribers');
    }
};
