<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Complaint extends Model
{
    use HasFactory;

    protected $table = 'complaints';

    protected $fillable = [
        'source_sheet',
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
        'update_log',
    ];

    protected function casts(): array
    {
        return [
            'opened_at' => 'datetime',
            'closed_at' => 'datetime',
        ];
    }

    public function scopeOpen(Builder $query): Builder
    {
        return $query->whereIn('status', ['Open', 'open', 'Pending']);
    }

    public function scopeClosed(Builder $query): Builder
    {
        return $query->whereIn('status', ['Closed', 'closed']);
    }

    public function scopeServiceAffecting(Builder $query): Builder
    {
        return $query->where('affect', 'like', '%Service Affecting%');
    }
}
