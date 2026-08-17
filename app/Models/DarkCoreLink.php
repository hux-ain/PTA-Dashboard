<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DarkCoreLink extends Model
{
    use HasFactory;

    protected $table = 'dark_core_links';

    protected $fillable = [
        'name',
        'point_a',
        'point_b',
        'service_provider_name',
        'service_type',
        'own_or_lease',
    ];
}
