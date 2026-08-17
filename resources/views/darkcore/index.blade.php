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
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(108,117,125,0.12);">
                            <i class="fa-solid fa-route fs-5 text-secondary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Links</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalDarkCore) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-building-circle-check fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Owned</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($ownCount) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-handshake fs-5 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Leased</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($leaseCount) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(235,180,30,0.15);">
                            <i class="fa-solid fa-list-ranking fs-5" style="color:var(--accent);"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Top Provider</div>
                        <h4 class="mb-0 fw-bold text-truncate" style="max-width:180px;">{{ $byProviderTop3->first()->service_provider_name ?? 'N/A' }}</h4>
                        <div class="small text-muted">{{ $byProviderTop3->first()->count ?? 0 }} links</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-route me-2 text-secondary"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Dark core optical links — providers &amp; ownership</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('darkcore.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add Dark Core Link
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
                        <input type="text" name="search" class="form-control" placeholder="Search Link Name, Points A/B, Provider, Service Type..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:200px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Provider</label>
                    <select name="service_provider_name" class="form-select">
                        <option value="">All Providers</option>
                        @foreach($providers as $p)
                        <option value="{{ $p }}" {{ $filterProvider == $p ? 'selected' : '' }}>{{ $p }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:160px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Service Type</label>
                    <select name="service_type" class="form-select">
                        <option value="">All Types</option>
                        @foreach($serviceTypes as $t)
                        <option value="{{ $t }}" {{ $filterServiceType == $t ? 'selected' : '' }}>{{ $t }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:160px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Own / Lease</label>
                    <select name="own_or_lease" class="form-select">
                        <option value="">All</option>
                        @foreach($ownOrLeases as $o)
                        <option value="{{ $o }}" {{ $filterOwnOrLease == $o ? 'selected' : '' }}>{{ $o }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('darkcore.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-rotate-left me-1"></i> Reset
                </a>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th class="px-4 py-3 text-uppercase small text-muted">#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Link Name</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Point A</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Point B</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Provider</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Service Type</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Own / Lease</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($darkCoreLinks as $i => $d)
                    <tr>
                        <td class="px-4 py-2 small">{{ $darkCoreLinks->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $d->name }}</td>
                        <td class="px-4 py-2 small">{{ $d->point_a }}</td>
                        <td class="px-4 py-2 small">{{ $d->point_b }}</td>
                        <td class="px-4 py-2 small">{{ $d->service_provider_name }}</td>
                        <td class="px-4 py-2 small">
                            <span class="badge bg-primary rounded-pill px-3 py-1">{{ $d->service_type }}</span>
                        </td>
                        <td class="px-4 py-2 small">
                            @if(stripos($d->own_or_lease, 'Own') !== false)
                            <span class="badge bg-success rounded-pill px-3 py-1">{{ $d->own_or_lease }}</span>
                            @else
                            <span class="badge bg-info text-dark rounded-pill px-3 py-1">{{ $d->own_or_lease }}</span>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No Dark Core Links data. Import from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $darkCoreLinks])
    </div>
</div>
@endsection
