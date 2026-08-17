<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FaultsCleared extends Model
{
    use HasFactory;

    protected $table = 'faults_cleared';

    protected $fillable = [
        'customer_name',
        'complaint_channel',
        'main_city',
        'opened_at',
        'closed_at',
        'issue',
        'status',
        'affect',
        'owner',
        'aging_downtime',
        'rfo',
        'rca',
    ];

    protected function casts(): array
    {
        return [
            'opened_at' => 'datetime',
            'closed_at' => 'datetime',
        ];
    }
}
