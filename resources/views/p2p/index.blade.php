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

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-network-wired me-2 text-primary"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Point-to-Point subscriber links — search and filter</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('p2p.create') }}" class="btn btn-sm btn-primary fw-semibold">
                    <i class="fa-solid fa-plus me-1"></i> Add P2P Subscriber
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
                        <input type="text" name="search" class="form-control" placeholder="Search Link Name, Stations, Ownership, Frequency..." value="{{ $search }}">
                    </div>
                </div>
                <div style="min-width:170px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Status</label>
                    <select name="status" class="form-select">
                        <option value="">All Status</option>
                        @foreach($statuses as $st)
                        <option value="{{ $st }}" {{ $filterStatus == $st ? 'selected' : '' }}>{{ $st }}</option>
                        @endforeach
                    </select>
                </div>
                <div style="min-width:170px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Ownership</label>
                    <select name="ownership" class="form-select">
                        <option value="">All</option>
                        @foreach($ownerships as $o)
                        <option value="{{ $o }}" {{ $filterOwnership == $o ? 'selected' : '' }}>{{ $o }}</option>
                        @endforeach
                    </select>
                </div>
                <a href="{{ route('p2p.index') }}" class="btn btn-outline-secondary btn-sm">
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
                        <th class="px-4 py-3 text-uppercase small text-muted">Station A</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Station B</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Status</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Ownership</th>
                        <th class="px-4 py-3 text-uppercase small text-muted">Frequency</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($p2pLinks as $i => $p)
                    <tr>
                        <td class="px-4 py-2 small">{{ $p2pLinks->firstItem() + $i }}</td>
                        <td class="px-4 py-2 small fw-semibold text-dark">{{ $p->link_name ?? '—' }}</td>
                        <td class="px-4 py-2 small">{{ $p->station_a }}</td>
                        <td class="px-4 py-2 small">{{ $p->station_b }}</td>
                        <td class="px-4 py-2 small">
                            @if(in_array(strtolower($p->status), ['active','up','live']))
                            <span class="badge bg-success rounded-pill px-3 py-1">{{ $p->status }}</span>
                            @elseif(in_array(strtolower($p->status), ['down','inactive']))
                            <span class="badge bg-danger rounded-pill px-3 py-1">{{ $p->status }}</span>
                            @else
                            <span class="badge bg-secondary rounded-pill px-3 py-1">{{ $p->status }}</span>
                            @endif
                        </td>
                        <td class="px-4 py-2 small">
                            <span class="badge bg-info text-dark rounded-pill px-3 py-1">{{ $p->ownership }}</span>
                        </td>
                        <td class="px-4 py-2 small">{{ $p->frequency }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="text-center py-5 text-muted">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block opacity-50"></i>
                            No P2P Subscribers data found. Import data from the <a href="{{ route('imports.index') }}">Data Import page</a>.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @include('components.pagination', ['paginator' => $p2pLinks])
    </div>
</div>
@endsection
