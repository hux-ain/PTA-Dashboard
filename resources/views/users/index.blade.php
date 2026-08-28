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
        <div class="col-xl-4 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(235,180,30,0.15);">
                            <i class="fa-solid fa-users fs-5" style="color:var(--accent);"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Total Users</div>
                        <h4 class="mb-0 fw-bold">{{ number_format($totalUsers) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(13,110,253,0.12);">
                            <i class="fa-solid fa-crown fs-5 text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Admin Users</div>
                        <h4 class="mb-0 fw-bold">{{ number_format(\App\Models\User::where('role', 'Admin')->count()) }}</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-md-6">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4 d-flex align-items-center">
                    <div class="flex-shrink-0 me-3">
                        <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:50px;height:50px;background:rgba(25,135,84,0.12);">
                            <i class="fa-solid fa-user-tie fs-5 text-success"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-muted small mb-1">Employee Users</div>
                        <h4 class="mb-0 fw-bold">{{ number_format(\App\Models\User::where('role', 'Employee')->count()) }}</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card shadow-sm border-0 rounded-4 overflow-hidden" data-aos="fade-up">
        <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center flex-wrap gap-3 pt-4 px-4 pb-3">
            <div>
                <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-users-gear me-2" style="color:var(--accent);"></i>{{ $pageTitle }}</h5>
                <p class="text-muted small mb-0">Manage system users and roles</p>
            </div>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <a href="{{ route('users.create') }}" class="btn btn-sm fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                    <i class="fa-solid fa-user-plus me-1"></i> Add User
                </a>
            </div>
        </div>

        <div class="px-4 pb-3">
            <form method="GET" class="auto-filter-form d-flex gap-2 flex-wrap align-items-end">
                <div class="flex-grow-1" style="min-width:260px;">
                    <label class="form-label small fw-semibold text-muted mb-1">Search</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0 text-muted"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <input type="text" class="form-control border-start-0 form-control-sm" name="search" placeholder="Name, Email, or Role..." value="{{ $search }}">
                    </div>
                </div>
                <button type="submit" class="btn btn-sm fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                    <i class="fa-solid fa-filter me-1"></i> Filter
                </button>
            </form>
        </div>

        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light fw-semibold text-muted small">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($users as $user)
                    <tr>
                        <td class="fw-bold text-muted">{{ $user->id }}</td>
                        <td>{{ $user->name }}</td>
                        <td><small class="text-muted">{{ $user->email }}</small></td>
                        <td>
                            @if($user->role === 'Admin')
                                <span class="badge bg-danger">{{ $user->role }}</span>
                            @elseif($user->role === 'super_admin')
                                <span class="badge bg-warning text-dark fw-bold">{{ $user->role }}</span>
                            @else
                                <span class="badge bg-info">{{ $user->role }}</span>
                            @endif
                        </td>
                        <td><small class="text-muted">{{ $user->created_at?->format('M d, Y') ?? 'N/A' }}</small></td>
                        <td>
                            <div class="d-flex gap-2">
                                <a href="{{ route('users.edit', $user->id) }}" class="btn btn-sm btn-outline-primary" title="Edit">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </a>
                                @if(auth()->user()->role === 'super_admin' && $user->id !== auth()->id())
                                <form method="POST" action="{{ route('users.destroy', $user->id) }}" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </form>
                                @endif
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">
                            <i class="fa-solid fa-inbox fs-3 mb-2 d-block" style="opacity:0.5;"></i>
                            No users found
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        @if($users->hasPages())
        <div class="d-flex justify-content-between align-items-center px-4 py-3 border-top">
            <small class="text-muted">Showing {{ $users->firstItem() }} to {{ $users->lastItem() }} of {{ $users->total() }} users</small>
            <nav>
                {{ $users->links('pagination::bootstrap-5') }}
            </nav>
        </div>
        @endif
    </div>

</div>
@endsection
