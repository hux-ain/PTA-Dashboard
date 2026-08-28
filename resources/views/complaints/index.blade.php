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
                            <i class="fa-solid fa-circle-exclamation fs-5 text-danger"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Complaints</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalComplaints) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(245,158,11,0.15);">
                            <i class="fa-solid fa-clock fs-5 text-warning"></i>
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
                            <i class="fa-solid fa-circle-check fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Closed</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalClosed) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(220,53,69,0.18);">
                            <i class="fa-solid fa-triangle-exclamation fs-5 text-danger"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Service Affecting</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalService) }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-circle-exclamation me-2 text-danger"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Customer complaints — search by status, city, issue</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('complaints.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add Complaint
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
                        <input type="text" name="search" class="form-control" placeholder="Search by Customer, City, Issue, Owner, RCA, RFO..." value="{{ $search }}">
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
                <a href="{{ route('complaints.index') }}" class="btn btn-outline-secondary btn-sm">
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
                        <th class="px-4 py-3 text-uppercase small text-muted">Channel</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Opened</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Issue</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Status</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Affect</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Owner</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Aging</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($complaints as $i => $c)
                    <tr>
                        <td class="px-4 py-2 small">{{ $complaints->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $c->customer_name }}</td>
                        <td class="px-4 py-2 small">{{ $c->main_city }}</td>
                        <td class="px-4 py-2 small">{{ $c->complaint_channel }}</td>
                        <td class="px-4 py-2 small">{{ $c->opened_at ? $c->opened_at->format('d M Y H:i') : '—' }}</td>
                        <td class="px-4 py-2 small" style="max-width:340px;">{{ \Illuminate\Support\Str::limit($c->issue, 80) }}</td>
                        <td class="px-4 py-2 small">
                            @if(in_array(strtolower($c->status), ['open','pending']))
                            <span class="badge bg-warning text-dark rounded-pill px-3 py-1">{{ $c->status }}</span>
                            @else
                            <span class="badge bg-success rounded-pill px-3 py-1">{{ $c->status }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small">
                            @if(stripos($c->affect, 'Service Affecting') !== false)
                            <span class="badge bg-danger rounded-pill px-3 py-1">{{ $c->affect }}</span>
                            @else
                            <span class="badge bg-secondary rounded-pill px-3 py-1">{{ $c->affect }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small text-muted">{{ $c->owner ?? '—' }}</td>
                        <td class="px-4 py-2 small">{{ $c->aging_downtime ?? '—' }}</td>
                        <td class="px-4 py-2 small">
                            @if(in_array(auth()->user()->role, ['Admin', 'super_admin']))
                                <a href="{{ route('complaints.edit', $c) }}" class="btn btn-sm btn-outline-primary" title="Edit complaint"><i class="fa-solid fa-pen"></i></a>
                                @if(strtolower((string) $c->status) !== 'closed')
                                <form action="{{ route('complaints.close', $c) }}" method="POST" class="d-inline">
                                    @csrf @method('PATCH')
                                    <button type="submit" class="btn btn-sm btn-outline-success" title="Close complaint" onclick="return confirm('Close this complaint?')"><i class="fa-solid fa-check"></i></button>
                                </form>
                                @endif
                            @endif
                            @if(auth()->user()->role === 'super_admin')
                                <form action="{{ route('complaints.destroy', $c) }}" method="POST" class="d-inline">
                                    @csrf @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete complaint" onclick="return confirm('Delete this complaint permanently?')"><i class="fa-solid fa-trash"></i></button>
                                </form>
                            @endif
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="11" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No Complaints data found. Import from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $complaints])
    </div>
</div>
@endsection
