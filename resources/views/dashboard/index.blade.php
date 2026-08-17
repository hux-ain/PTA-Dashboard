@extends('layouts.app')

@section('content')
<div class="container-fluid">

    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show shadow-sm mb-4" role="alert">
        <i class="fa-solid fa-circle-check me-2"></i>{{ session('success') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    @endif
    @if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show shadow-sm mb-4" role="alert">
        <i class="fa-solid fa-circle-exclamation me-2"></i>{{ session('error') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    @endif

    <div class="row g-3 mb-4" data-aos="fade-up">
        <div class="col-xl-3 col-md-6">
            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:56px;height:56px;background:rgba(235,180,30,0.15);">
                            <i class="fa-solid fa-users fs-4" style="color:var(--accent);"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Subscribers (CIR)</div>
                        <h3 class="mb-0 fw-bold text-dark">{{ number_format($totalSubscribers) }}</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:56px;height:56px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-network-wired fs-4 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">P2P Subscribers</div>
                        <h3 class="mb-0 fw-bold text-dark">{{ number_format($totalP2p) }}</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:56px;height:56px;background:rgba(220,53,69,0.12);">
                            <i class="fa-solid fa-circle-exclamation fs-4 text-danger"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Complaints (Total)</div>
                        <h3 class="mb-0 fw-bold text-dark">{{ number_format($totalComplaints) }}</h3>
                        <div class="small mt-1">
                            <span class="text-warning"><i class="fa-solid fa-clock me-1"></i>Open: {{ $complaintsOpen }}</span>
                            <span class="mx-2 text-muted">|</span>
                            <span class="text-success"><i class="fa-solid fa-check me-1"></i>Closed: {{ $complaintsClosed }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:56px;height:56px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-tower-broadcast fs-4 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Infrastructure Assets</div>
                        <h3 class="mb-0 fw-bold text-dark">{{ number_format($totalInfrastructure) }}</h3>
                        <div class="small mt-1">
                            <span class="text-muted">DC: {{ $darkCoreCount }}</span>
                            <span class="mx-2 text-muted">|</span>
                            <span class="text-muted">DPLC: {{ $dplcCount }}</span>
                            <span class="mx-2 text-muted">|</span>
                            <span class="text-muted">POPs: {{ $popCount }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="50">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-body p-4">
                    <h6 class="mb-3 fw-bold text-dark"><i class="fa-solid fa-gauge me-2 text-warning"></i>Complaint Status</h6>
                    <canvas id="donutChart" height="220"></canvas>
                </div>
            </div>
        </div>
        <div class="col-xl-8" data-aos="fade-up" data-aos-delay="100">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-2 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-chart-line me-2 text-primary"></i>Complaint Trend — {{ ucwords(str_replace('_', ' ', $timePeriod)) }}</h6>
                    <form method="GET" class="d-flex gap-2 flex-wrap auto-filter-form">
                        <select name="time_period" class="form-select form-select-sm" style="width:auto;">
                            <option value="current_month" {{ $timePeriod == 'current_month' ? 'selected' : '' }}>Current Month</option>
                            <option value="last_month" {{ $timePeriod == 'last_month' ? 'selected' : '' }}>Last Month</option>
                            <option value="current_year" {{ $timePeriod == 'current_year' ? 'selected' : '' }}>Current Year</option>
                            <option value="last_year" {{ $timePeriod == 'last_year' ? 'selected' : '' }}>Last Year</option>
                        </select>
                        <select name="status_filter" class="form-select form-select-sm" style="width:auto;">
                            <option value="all" {{ $statusFilter == 'all' ? 'selected' : '' }}>All Status</option>
                            <option value="open" {{ $statusFilter == 'open' ? 'selected' : '' }}>Open Only</option>
                            <option value="closed" {{ $statusFilter == 'closed' ? 'selected' : '' }}>Closed Only</option>
                        </select>
                    </form>
                </div>
                <div class="card-body px-4 pb-4">
                    <canvas id="trendChart" height="130"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-xl-6" data-aos="fade-up">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-city me-2" style="color:var(--accent);"></i>Complaints by City (Top 15)</h6>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive" style="max-height:380px;overflow-y:auto;">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light sticky-top" style="z-index:1;">
                                <tr>
                                    <th class="px-4 py-2 text-uppercase small text-muted">City</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted text-center">Total</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted text-center">Open</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted text-center">Closed</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted text-center">Svc-Affect</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($cityComplaints as $row)
                                <tr>
                                    <td class="px-4 py-2 fw-semibold">{{ $row->main_city }}</td>
                                    <td class="px-4 py-2 text-center"><span class="badge bg-dark rounded-pill px-3">{{ $row->total }}</span></td>
                                    <td class="px-4 py-2 text-center"><span class="badge bg-warning text-dark rounded-pill px-3">{{ $row->open_count }}</span></td>
                                    <td class="px-4 py-2 text-center"><span class="badge bg-success rounded-pill px-3">{{ $row->closed_count }}</span></td>
                                    <td class="px-4 py-2 text-center"><span class="badge bg-danger rounded-pill px-3">{{ $row->service_count }}</span></td>
                                </tr>
                                @empty
                                <tr><td colspan="5" class="text-center text-muted py-4">No data yet. Import Complaint Report first.</td></tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-6" data-aos="fade-up" data-aos-delay="100">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-clock-rotate-left me-2 text-info"></i>Recent Complaints</h6>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="px-4 py-2 text-uppercase small text-muted">Customer</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted">City</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted">Issue</th>
                                    <th class="px-4 py-2 text-uppercase small text-muted">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($recentComplaints as $c)
                                <tr>
                                    <td class="px-4 py-2 small fw-semibold">{{ $c->customer_name }}</td>
                                    <td class="px-4 py-2 small">{{ $c->main_city }}</td>
                                    <td class="px-4 py-2 small" style="max-width:280px;">{{ \Illuminate\Support\Str::limit($c->issue, 60) }}</td>
                                    <td class="px-4 py-2 small">
                                        @if(in_array(strtolower($c->status), ['open','pending']))
                                            <span class="badge bg-warning text-dark rounded-pill px-3">{{ $c->status }}</span>
                                        @else
                                            <span class="badge bg-success rounded-pill px-3">{{ $c->status }}</span>
                                        @endif
                                    </td>
                                </tr>
                                @empty
                                <tr><td colspan="4" class="text-center text-muted py-4">No recent complaints.</td></tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3" data-aos="fade-up">
        <div class="col-xl-4">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-route me-2 text-secondary"></i>Dark Core — Providers</h6>
                </div>
                <div class="card-body p-3">
                    @forelse($darkCoreByProvider as $p)
                    <div class="d-flex justify-content-between align-items-center px-2 py-2 border-bottom border-light">
                        <span class="small fw-medium">{{ $p->service_provider_name }}</span>
                        <span class="badge bg-secondary rounded-pill px-3">{{ $p->count }}</span>
                    </div>
                    @empty
                    <div class="text-center text-muted py-4 small">No data. Import Dark Core Links.</div>
                    @endforelse
                </div>
            </div>
        </div>
        <div class="col-xl-4">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-map-location-dot me-2" style="color:var(--accent);"></i>DPLC — Providers</h6>
                </div>
                <div class="card-body p-3">
                    @forelse($dplcByProvider as $p)
                    <div class="d-flex justify-content-between align-items-center px-2 py-2 border-bottom border-light">
                        <span class="small fw-medium">{{ $p->service_provider }}</span>
                        <span class="badge rounded-pill px-3" style="background:var(--accent);color:#1f2227;">{{ $p->count }}</span>
                    </div>
                    @empty
                    <div class="text-center text-muted py-4 small">No data. Import DPLC Details.</div>
                    @endforelse
                </div>
            </div>
        </div>
        <div class="col-xl-4">
            <div class="card shadow-sm border-0 rounded-4 h-100">
                <div class="card-header bg-white border-0 pt-4 px-4 pb-2">
                    <h6 class="mb-0 fw-bold text-dark"><i class="fa-solid fa-tower-broadcast me-2 text-success"></i>POP Locations — Cities</h6>
                </div>
                <div class="card-body p-3">
                    @forelse($popByCity as $p)
                    <div class="d-flex justify-content-between align-items-center px-2 py-2 border-bottom border-light">
                        <span class="small fw-medium">{{ $p->city }}</span>
                        <span class="badge bg-success rounded-pill px-3">{{ $p->count }}</span>
                    </div>
                    @empty
                    <div class="text-center text-muted py-4 small">No data. Import NOC/POP Locations.</div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const donutCtx = document.getElementById('donutChart');
    if (donutCtx) {
        new Chart(donutCtx, {
            type: 'doughnut',
            data: {
                labels: ['Open', 'Closed', 'Pending/Other'],
                datasets: [{
                    data: [{{ $donutOpen }}, {{ $donutClosed }}, {{ $donutPending }}],
                    backgroundColor: ['#f59e0b', '#16a34a', '#6b7280'],
                    borderWidth: 2,
                    borderColor: '#fff'
                }]
            },
            options: {
                responsive: true,
                cutout: '65%',
                plugins: {
                    legend: { position: 'bottom', labels: { font: { size: 11 }, padding: 15, usePointStyle: true } }
                }
            }
        });
    }

    const trendCtx = document.getElementById('trendChart');
    if (trendCtx) {
        const labels = {!! $timeLabels !!};
        const values = {!! $timeValues !!};
        new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Complaints',
                    data: values,
                    borderColor: '#ebb41e',
                    backgroundColor: 'rgba(235,180,30,0.15)',
                    fill: true,
                    tension: 0.35,
                    borderWidth: 2.5,
                    pointRadius: 3,
                    pointBackgroundColor: '#ebb41e'
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, grid: { color: '#f1f5f9' } },
                    x: { grid: { display: false } }
                }
            }
        });
    }
});
</script>
@endpush
