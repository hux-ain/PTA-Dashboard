<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NocPopLocation extends Model
{
    use HasFactory;

    protected $table = 'noc_pop_locations';

    protected $fillable = [
        'serial_no',
        'pop_name',
        'gps_coordinates',
        'address',
        'city',
        'own_colocated',
    ];
}
