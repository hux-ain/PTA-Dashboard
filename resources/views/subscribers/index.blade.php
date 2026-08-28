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
                            <i class="fa-solid fa-users fs-5" style="color:var(--accent);"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Subscribers</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalSubscribers) }}</h4>
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
                        <div class="text-muted small mb-1">Unique Companies</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($companiesByCount) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-crown fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Top Package</div>
                        <h4 class="mb-0 fw-bold">{{ $topPackage->package ?? 'N/A' }}</h4>
                        <div class="small text-muted">{{ $topPackage->count ?? 0 }} subscribers</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(111,66,193,0.12);">
                            <i class="fa-solid fa-layer-group fs-5 text-purple" style="color:#6f42c1;"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Distinct Packages</div>
                        <h4 class="mb-0 fw-bold">{{ $packages->count() }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-users me-2" style="color:var(--accent);"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Complete CIR subscriber listing with search and filters</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('subscribers.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add Subscriber
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
                        <input type="text" name="search" class="form-control" placeholder="Search by Company, NTN/CNIC, Contact, Package..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:200px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Package</label>
                    <select name="package" class="form-select">
                        
                    
                    <option value="">All Packages</option>
                        @foreach($packages as $p)
                        <option value="{{ $p }}" {{ $filterPackage == $p ? 'selected' : '' }}>{{ $p }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:200px;">
                    <label class="form-label small fw-semibold text-muted mb-1">District</label>
                    <select name="district" class="form-select">
                        <option value="">All Districts</option>
                        @foreach($districts as $district)
                        <option value="{{ $district }}" {{ $filterDistrict == $district ? 'selected' : '' }}>{{ $district }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('subscribers.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-rotate-left me-1"></i> Reset
                </a>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="bg-light">
                    <tr>
                        <th class="px-4 py-3 text-uppercase small text-muted">#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Company Name</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">District</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">NTN / CNIC</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Contact</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Package</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Address</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($subscribers as $i => $s)
                    <tr>
                        <td class="px-4 py-2 small">{{ $subscribers->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $s->company_name }}</td>
                        <td class="px-4 py-2 small">{{ $s->district ?? '—' }}</td>
                        <td class="px-4 py-2 small">{{ $s->ntn_cnic }}</td>
                        <td class="px-4 py-2 small">{{ $s->contact }}</td>
                        <td class="px-4 py-2 small">
                            <span class="badge rounded-pill px-3 py-1" style="background:rgba(235,180,30,0.18);color:#966f05;">{{ $s->package }}</span>
                        </td>
                        <td class="px-4 py-2 small text-muted" style="max-width:320px;">{{ \Illuminate\Support\Str::limit($s->address, 70) }}</td>
                        <td class="px-4 py-2 small">@include('components.crud-actions', ['record' => $s, 'routePrefix' => 'subscribers'])</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No Subscribers CIR data found. Import data from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $subscribers])
    </div>
</div>
@endsection
