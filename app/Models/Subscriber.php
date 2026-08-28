<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscriber extends Model
{
    use HasFactory;

    protected $table = 'subscribers';

    protected $fillable = [
        'serial_no',
        'company_name',
        'district',
        'ntn_cnic',
        'address',
        'contact',
        'package',
    ];
}
