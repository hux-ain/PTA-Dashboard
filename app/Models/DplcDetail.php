<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DplcDetail extends Model
{
    use HasFactory;

    protected $table = 'dplc_details';

    protected $fillable = [
        'serial_no',
        'point_a_gps',
        'point_b_gps',
        'service_provider',
        'total_bandwidth_acquired',
    ];
}
