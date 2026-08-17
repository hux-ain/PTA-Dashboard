<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('dark_core_links', function (Blueprint $table) {
            $table->id();
            $table->text('name');
            $table->text('point_a');
            $table->text('point_b');
            $table->string('service_provider_name');
            $table->string('service_type');
            $table->string('own_or_lease');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('dark_core_links');
    }
};
