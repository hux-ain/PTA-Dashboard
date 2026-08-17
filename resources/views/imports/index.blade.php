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
        @php
            $countCards = [
                ['label' => 'Subscribers CIR', 'count' => $subscribersCount, 'icon' => 'fa-users', 'color' => 'accent', 'route' => 'subscribers.index'],
                ['label' => 'P2P Subscribers', 'count' => $p2pCount, 'icon' => 'fa-network-wired', 'color' => 'primary', 'route' => 'p2p.index'],
                ['label' => 'Complaint Report', 'count' => $complaintsCount, 'icon' => 'fa-circle-exclamation', 'color' => 'danger', 'route' => 'complaints.index'],
                ['label' => 'Faults Reported', 'count' => $faultsCount, 'icon' => 'fa-triangle-exclamation', 'color' => 'warning', 'route' => 'faults.index'],
                ['label' => 'Faults Cleared', 'count' => $faultsClearedCount, 'icon' => 'fa-circle-check', 'color' => 'success', 'route' => 'faultscleared.index'],
                ['label' => 'Dark Core Links', 'count' => $darkCoreCount, 'icon' => 'fa-route', 'color' => 'secondary', 'route' => 'darkcore.index'],
                ['label' => 'DPLC Details', 'count' => $dplcCount, 'icon' => 'fa-map-location-dot', 'color' => 'accent', 'route' => 'dplc.index'],
                ['label' => 'NOC / POP Locations', 'count' => $popsCount, 'icon' => 'fa-tower-broadcast', 'color' => 'success', 'route' => 'pops.index'],
            ];
        @endphp
        @foreach($countCards as $card)
        <div class="col-xl-3 col-md-6">
            <a href="{{ route($card['route']) }}" class="text-decoration-none">
                <div class="card shadow-sm border-0 rounded-4 h-100 hover-lift">
                    <div class="card-body p-4 d-flex align-items-center">
                        <div class="flex-shrink-0 me-3">
                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba({{ $card['color'] == 'accent' ? '235,180,30' : ($card['color'] == 'primary' ? '13,110,253' : ($card['color'] == 'danger' ? '220,53,69' : ($card['color'] == 'warning' ? '245,158,11' : ($card['color'] == 'success' ? '25,135,84' : '108,117,125')))) }},0.15);">
                                <i class="fa-solid {{ $card['icon'] }} fs-5" style="color:{{ $card['color'] == 'accent' ? 'var(--accent)' : ($card['color'] == 'primary' ? '#0d6efd' : ($card['color'] == 'danger' ? '#dc3545' : ($card['color'] == 'warning' ? '#f59e0b' : ($card['color'] == 'success' ? '#198754' : '#6c757d')))) }};"></i>
                            </div>
                        </div>
                        <div>
                            <div class="text-muted small mb-1">{{ $card['label'] }}</div>
                            <h4 class="mb-0 fw-bold text-dark">{{ number_format($card['count']) }}</h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        @endforeach
    </div>

    @php
        $importBlocks = [
            [
                'title' => 'Subscribers CIR',
                'desc' => 'Import Total Subscribers — CIR Excel file',
                'icon' => 'fa-users',
                'color' => 'accent',
                'file_hint' => 'Expected file: Total Subscribers - CIR.xlsx',
                'submit_route' => 'imports.submit_subscribers',
                'truncate_route' => 'imports.truncate_subscribers',
                'count' => $subscribersCount,
            ],
            [
                'title' => 'P2P Subscribers',
                'desc' => 'Import Total P2P Subsribers Excel file',
                'icon' => 'fa-network-wired',
                'color' => 'primary',
                'file_hint' => 'Expected file: Total P2P Subsribers.xlsx',
                'submit_route' => 'imports.submit_p2p',
                'truncate_route' => 'imports.truncate_p2p',
                'count' => $p2pCount,
            ],
            [
                'title' => 'Complaint Report',
                'desc' => 'Import Complaint Report (may have multiple sheets)',
                'icon' => 'fa-circle-exclamation',
                'color' => 'danger',
                'file_hint' => 'Importer reads all sheets in the workbook automatically',
                'submit_route' => 'imports.submit_complaints',
                'truncate_route' => 'imports.truncate_complaints',
                'count' => $complaintsCount,
            ],
            [
                'title' => 'Tickets',
                'desc' => 'Import Tickets and support issues data',
                'icon' => 'fa-ticket',
                'color' => 'primary',
                'file_hint' => 'Expected file: tickets_2026-08-15.xlsx or similar format',
                'submit_route' => 'imports.submit_tickets',
                'truncate_route' => 'imports.truncate_complaints',
                'count' => $complaintsCount,
            ],
            [
                'title' => 'Faults Reported',
                'desc' => 'Import Fault Reported in Last 120 days',
                'icon' => 'fa-triangle-exclamation',
                'color' => 'warning',
                'file_hint' => 'Expected file: Fault Reported in Last 120 days.xlsx',
                'submit_route' => 'imports.submit_faults',
                'truncate_route' => 'imports.truncate_faults',
                'count' => $faultsCount,
            ],
            [
                'title' => 'Faults Cleared',
                'desc' => 'Import Faults Cleared in 24 &amp; 48 Hours',
                'icon' => 'fa-circle-check',
                'color' => 'success',
                'file_hint' => 'Expected file: Faults Cleared in 24 & 48 Hours.xlsx',
                'submit_route' => 'imports.submit_faults_cleared',
                'truncate_route' => 'imports.truncate_faults_cleared',
                'count' => $faultsClearedCount,
            ],
            [
                'title' => 'Dark Core Links',
                'desc' => 'Import Dark Core Links infrastructure data',
                'icon' => 'fa-route',
                'color' => 'secondary',
                'file_hint' => 'Expected columns: Name, Point A/B, Provider, Type, Own/Lease',
                'submit_route' => 'imports.submit_darkcore',
                'truncate_route' => 'imports.truncate_darkcore',
                'count' => $darkCoreCount,
            ],
            [
                'title' => 'DPLC Details',
                'desc' => 'Import DPLC-Details PA-PB Excel file',
                'icon' => 'fa-map-location-dot',
                'color' => 'accent',
                'file_hint' => 'Expected file: DPLC-Details PA-PB.xlsx',
                'submit_route' => 'imports.submit_dplc',
                'truncate_route' => 'imports.truncate_dplc',
                'count' => $dplcCount,
            ],
            [
                'title' => 'NOC / POP Locations',
                'desc' => 'Import NOC &amp; POP site locations data',
                'icon' => 'fa-tower-broadcast',
                'color' => 'success',
                'file_hint' => 'POP Name, GPS, Address, City, Own/Co-located',
                'submit_route' => 'imports.submit_pops',
                'truncate_route' => 'imports.truncate_pops',
                'count' => $popsCount,
            ],
        ];

        $colorMap = [
            'accent'    => ['bg' => 'rgba(235,180,30,0.15)', 'text' => 'var(--accent)', 'btn' => 'style="background:var(--accent);color:#1f2227;border:none;"'],
            'primary'   => ['bg' => 'rgba(13,110,253,0.12)', 'text' => '#0d6efd', 'btn' => 'btn-primary'],
            'danger'    => ['bg' => 'rgba(220,53,69,0.12)', 'text' => '#dc3545', 'btn' => 'btn-danger'],
            'warning'   => ['bg' => 'rgba(245,158,11,0.15)', 'text' => '#f59e0b', 'btn' => 'btn-warning text-dark'],
            'success'   => ['bg' => 'rgba(25,135,84,0.12)', 'text' => '#198754', 'btn' => 'btn-success'],
            'secondary' => ['bg' => 'rgba(108,117,125,0.12)', 'text' => '#6c757d', 'btn' => 'btn-secondary'],
        ];
    @endphp

    <div class="row g-4">
        @foreach($importBlocks as $block)
        @php $c = $colorMap[$block['color']]; @endphp
        <div class="col-xl-6" data-aos="fade-up" data-aos-delay="{{ $loop->iteration * 40 }}">
            <div class="card shadow-sm border-0 rounded-4 h-100 overflow-hidden">
                <div class="card-body p-4">
                    <div class="d-flex align-items-start justify-content-between mb-3 gap-2 flex-wrap">
                        <div class="d-flex align-items-center gap-3">
                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:54px;height:54px;background:{{ $c['bg'] }};">
                                <i class="fa-solid {{ $block['icon'] }} fs-4" style="color:{{ $c['text'] }};"></i>
                            </div>
                            <div>
                                <h6 class="mb-1 fw-bold text-dark">{{ $block['title'] }}</h6>
                                <p class="text-muted small mb-0">{{ $block['desc'] }}</p>
                            </div>
                        </div>
                        <span class="badge rounded-pill px-3 py-2" style="background:{{ $c['bg'] }};color:{{ $c['text'] }};">
                            {{ number_format($block['count']) }} records
                        </span>
                    </div>

                    <div class="rounded-3 p-3 mb-3" style="background:#f8f9fa;border:1px dashed #dee2e6;">
                        <div class="small text-muted mb-2"><i class="fa-solid fa-circle-info me-1"></i>{{ $block['file_hint'] }}</div>
                        <form method="POST" action="{{ route($block['submit_route']) }}" enctype="multipart/form-data" class="import-form d-flex gap-2 flex-wrap align-items-end">
                            @csrf
                            <div class="flex-grow-1" style="min-width:220px;">
                                <input class="form-control form-control-sm" type="file" name="file" accept=".xlsx,.xls" required>
                            </div>
                            <button type="submit" class="btn btn-sm fw-semibold {{ str_starts_with($c['btn'], 'style=') ? '' : $c['btn'] }}" {{ str_starts_with($c['btn'], 'style=') ? $c['btn'] : '' }}>
                                <i class="fa-solid fa-cloud-arrow-up me-1"></i> Upload &amp; Import
                            </button>
                        </form>
                    </div>

                    <form method="POST" action="{{ route($block['truncate_route']) }}" onsubmit="return confirm('WARNING: This will DELETE ALL {{ $block['title'] }} records. Continue?');">
                        @csrf
                        <button type="submit" class="btn btn-outline-danger btn-sm">
                            <i class="fa-solid fa-trash-can me-1"></i> Clear All {{ $block['title'] }} Data
                        </button>
                    </form>
                </div>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.import-form').forEach(function(form) {
        form.addEventListener('submit', function() {
            const btn = form.querySelector('button[type="submit"]');
            if (btn) {
                btn.disabled = true;
                btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-1"></i> Importing...';
            }
        });
    });
});
</script>
@endpush

@push('styles')
<style>
.hover-lift { transition: transform .2s ease, box-shadow .2s ease; }
.hover-lift:hover { transform: translateY(-2px); box-shadow: 0 10px 24px rgba(0,0,0,.08) !important; }
</style>
@endpush
