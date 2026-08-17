<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class P2pSubscriber extends Model
{
    use HasFactory;

    protected $table = 'p2p_subscribers';

    protected $fillable = [
        'serial_no',
        'link_name',
        'station_a',
        'station_b',
        'status',
        'ownership',
        'frequency',
    ];
}
