<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('complaints', function (Blueprint $table) {
            $table->id();
            $table->string('source_sheet', 50)->nullable();
            $table->string('customer_name')->index();
            $table->string('complaint_channel');
            $table->string('main_city');
            $table->datetime('opened_at')->nullable();
            $table->datetime('closed_at')->nullable();
            $table->text('issue');
            $table->string('status')->index();
            $table->string('affect');
            $table->string('owner')->nullable();
            $table->string('aging_downtime')->nullable();
            $table->text('rfo')->nullable();
            $table->text('rca')->nullable();
            $table->text('update_log')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('complaints');
    }
};
