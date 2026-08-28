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
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(220,53,69,0.12);">
                            <i class="fa-solid fa-triangle-exclamation fs-5 text-danger"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Faults</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalFaults) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(245,158,11,0.15);">
                            <i class="fa-solid fa-fire fs-5 text-warning"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Open / Pending</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalOpen) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-wrench fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Closed / Resolved</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalClosed) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-hourglass-half fs-5 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Avg Aging</div>
                        <h4 class="mb-0 fw-bold">{{ $avgAging }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-triangle-exclamation me-2 text-danger"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">All faults reported — last 120 days view</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('faults.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add Fault
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
                        <input type="text" name="search" class="form-control" placeholder="Search Customer, City, Issue, RCA, RFO..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:160px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Status</label>
                    <select name="status" class="form-select">
                        <option value="">All</option>
                        @foreach($statuses as $st)
                        <option value="{{ $st }}" {{ $filterStatus == $st ? 'selected' : '' }}>{{ $st }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:180px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Affect</label>
                    <select name="affect" class="form-select">
                        <option value="">All</option>
                        @foreach($affects as $a)
                        <option value="{{ $a }}" {{ $filterAffect == $a ? 'selected' : '' }}>{{ $a }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:160px;">
                    <label class="form-label small fw-semibold text-muted mb-1">City</label>
                    <select name="main_city" class="form-select">
                        <option value="">All Cities</option>
                        @foreach($cities as $c)
                        <option value="{{ $c }}" {{ $filterCity == $c ? 'selected' : '' }}>{{ $c }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('faults.index') }}" class="btn btn-outline-secondary btn-sm">
                    <i class="fa-solid fa-rotate-left me-1"></i> Reset
                </a>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0" style="min-width:1300px;">
                <thead class="bg-light">
                    <tr>
                        <th class="px-4 py-3 text-uppercase small text-muted">#</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Customer</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">City</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Opened</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Issue</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Status</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Affect</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Aging</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">RFO</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($faults as $i => $f)
                    <tr>
                        <td class="px-4 py-2 small">{{ $faults->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $f->customer_name }}</td>
                        <td class="px-4 py-2 small">{{ $f->main_city }}</td>
                        <td class="px-4 py-2 small">{{ $f->opened_at ? $f->opened_at->format('d M Y') : '—' }}</td>
                        <td class="px-4 py-2 small" style="max-width:300px;">{{ \Illuminate\Support\Str::limit($f->issue, 70) }}</td>
                        <td class="px-4 py-2 small">
                            @if(in_array(strtolower($f->status), ['open','pending']))
                            <span class="badge bg-warning text-dark rounded-pill px-3 py-1">{{ $f->status }}</span>
                            @else
                            <span class="badge bg-success rounded-pill px-3 py-1">{{ $f->status }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small">
                            @if(stripos($f->affect, 'Service Affecting') !== false)
                            <span class="badge bg-danger rounded-pill px-3 py-1">{{ $f->affect }}</span>
                            @else
                            <span class="badge bg-secondary rounded-pill px-3 py-1">{{ $f->affect }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small fw-medium">{{ $f->aging_downtime }}</td>
                        <td class="px-4 py-2 small text-muted" style="max-width:220px;">{{ \Illuminate\Support\Str::limit($f->rfo ?? '—', 50) }}</td>
                        <td class="px-4 py-2 small">@include('components.crud-actions', ['record' => $f, 'routePrefix' => 'faults'])</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="9" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No Faults Reported data. Import from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $faults])
    </div>
</div>
@endsection
