<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('faults_reported', function (Blueprint $table) {
            $table->id();
            $table->string('customer_name')->index();
            $table->string('complaint_channel');
            $table->string('main_city');
            $table->datetime('opened_at')->nullable();
            $table->datetime('closed_at')->nullable();
            $table->text('issue');
            $table->string('status');
            $table->string('affect');
            $table->string('aging_downtime');
            $table->text('rfo')->nullable();
            $table->text('rca')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('faults_reported');
    }
};
