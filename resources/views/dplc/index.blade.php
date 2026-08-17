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
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(235,180,30,0.15);">
                            <i class="fa-solid fa-map-location-dot fs-5" style="color:var(--accent);"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total DPLC</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalDplc) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-gauge-high fs-5 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Bandwidth</div>
                        <h4 class="mb-0 fw-bold">{{ $totalBandwidthLabel }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-network-wired fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Providers</div>
                        <h4 class="mb-0 fw-bold">{{ $byProviderCounts->count() }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <div class="text-muted small mb-2"><i class="fa-solid fa-chart-simple me-1"></i> Top Providers</div>
                    @foreach($byProviderCounts->take(3) as $p)
                    <div class="d-flex justify-content-between align-items-center small mb-1">
                        <span class="fw-medium text-truncate" style="max-width:160px;" title="{{ $p->service_provider }}">{{ $p->service_provider }}</span>
                        <span class="badge rounded-pill px-2" style="background:var(--accent);color:#1f2227;">{{ $p->count }}</span>
                    </div>
                    @endforeach
                    @if($byProviderCounts->count() == 0)
                    <div class="small text-muted">No data yet</div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-map-location-dot me-2" style="color:var(--accent);"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Domestic Private Leased Circuit — GPS endpoints &amp; bandwidth</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('dplc.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add DPLC Detail
                </a>
                @if(auth()->user()->role === 'super_admin')
                    <a href="{{ route('imports.index') }}" class="btn btn-sm fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                        <i class="fa-solid fa-file-import me-1"></i> Import Data
                    </a>
                @endif
            </div>
        </div>

        <div class="px-4 pb-3">
            <form method="GET" class="auto-filter-form d-flex gap-2 flex-wrap align-items-end">
                <div class="flex-grow-1" style="min-width:260px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Search</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="search" class="form-control" placeholder="Search GPS A/B, Provider, Bandwidth..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:220px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Service Provider</label>
                    <select name="service_provider" class="form-select">
                        <option value="">All Providers</option>
                        @foreach($providers as $p)
                        <option value="{{ $p }}" {{ $filterProvider == $p ? 'selected' : '' }}>{{ $p }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('dplc.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-rotate-left me-1"></i> Reset
                </a>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th class="px-4 py-3 text-uppercase small text-muted">#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">S#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Point A (GPS)</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Point B (GPS)</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Service Provider</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Bandwidth Acquired</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($dplcDetails as $i => $d)
                    <tr>
                        <td class="px-4 py-2 small">{{ $dplcDetails->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold">{{ $d->serial_no ?? ($i+1) }}</td>
                        <td class="px-4 py-2 small" style="max-width:300px;">{{ $d->point_a_gps }}</td>
                        <td class="px-4 py-2 small" style="max-width:300px;">{{ $d->point_b_gps }}</td>
                        <td class="px-4 py-2 small">
                            <span class="badge rounded-pill px-3 py-1" style="background:rgba(235,180,30,0.18);color:#966f05;">{{ $d->service_provider }}</span>
                        </td>
                        <td class="px-4 py-2 small fw-semibold text-primary">{{ $d->total_bandwidth_acquired }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No DPLC Details data. Import from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $dplcDetails])
    </div>
</div>
@endsection
