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
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-tower-broadcast fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total POPs</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalPops) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-building fs-5 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Own POPs</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($ownCount) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(111,66,193,0.12);">
                            <i class="fa-solid fa-building-user fs-5" style="color:#6f42c1;"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Co-located</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($colocatedCount) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <div class="text-muted small mb-2"><i class="fa-solid fa-city me-1"></i> Top Cities</div>
                    @foreach($citiesSummary as $c)
                    <div class="d-flex justify-content-between align-items-center small mb-1">
                        <span class="fw-medium">{{ $c->city }}</span>
                        <span class="badge bg-success rounded-pill px-2">{{ $c->count }}</span>
                    </div>
                    @endforeach
                    @if($citiesSummary->count() == 0)
                    <div class="small text-muted">No data yet</div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-tower-broadcast me-2 text-success"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">NOC / POP site locations — cities, ownership, GPS</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('pops.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add POP Location
                </a>
                <a href="{{ route('imports.index') }}" class="btn btn-sm fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                    <i class="fa-solid fa-file-import me-1"></i> Import Data
                </a>
            </div>
        </div>

        <div class="px-4 pb-3">
            <form method="GET" class="auto-filter-form d-flex gap-2 flex-wrap align-items-end">
                <div class="flex-grow-1" style="min-width:260px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Search</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="search" class="form-control" placeholder="Search POP Name, Address, GPS, City, Ownership..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:180px;">
                    <label class="form-label small fw-semibold text-muted mb-1">City</label>
                    <select name="city" class="form-select">
                        <option value="">All Cities</option>
                        @foreach($cities as $c)
                        <option value="{{ $c }}" {{ $filterCity == $c ? 'selected' : '' }}>{{ $c }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:180px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Own / Co-located</label>
                    <select name="own_colocated" class="form-select">
                        <option value="">All</option>
                        @foreach($ownColocatedOptions as $o)
                        <option value="{{ $o }}" {{ $filterOwnColocated == $o ? 'selected' : '' }}>{{ $o }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('pops.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-rotate-left me-1"></i> Reset
                </a>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th class="px-4 py-3 text-uppercase small text-muted">#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">POP Name</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">City</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Own / Co-located</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">GPS Coordinates</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Address</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($popLocations as $i => $p)
                    <tr>
                        <td class="px-4 py-2 small">{{ $popLocations->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $p->pop_name }}</td>
                        <td class="px-4 py-2 small">
                            <span class="badge rounded-pill px-3 py-1 bg-info text-dark">{{ $p->city }}</span>
                        </td>
                        <td class="px-4 py-2 small">
                            @if(stripos($p->own_colocated, 'Own') !== false)
                            <span class="badge bg-success rounded-pill px-3 py-1">{{ $p->own_colocated }}</span>
                            @else
                            <span class="badge bg-primary rounded-pill px-3 py-1">{{ $p->own_colocated }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small text-primary">{{ $p->gps_coordinates }}</td>
                        <td class="px-4 py-2 small text-muted" style="max-width:320px;">{{ \Illuminate\Support\Str::limit($p->address, 75) }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No NOC/POP Locations data. Import from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $popLocations])
    </div>
</div>
@endsection
