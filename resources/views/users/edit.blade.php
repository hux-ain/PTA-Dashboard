@extends('layouts.app')

@section('content')
<div class="container-fluid">

    <div class="row" data-aos="fade-up">
        <div class="col-lg-8 mx-auto">
            <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
                <div class="card-header bg-white border-0 d-flex align-items-center gap-3 pt-4 px-4 pb-3">
                    <a href="{{ route('users.index') }}" class="btn btn-sm btn-outline-secondary">
                        <i class="fa-solid fa-arrow-left me-1"></i> Back
                    </a>
                    <div>
                        <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-user-pen me-2" style="color:var(--accent);"></i>{{ $pageTitle }}</h5>
                        <p class="text-muted small mb-0">Update user information</p>
                    </div>
                </div>

                <div class="card-body p-4">
                    @if($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
                        <i class="fa-solid fa-circle-exclamation me-2"></i>
                        <strong>Please fix the following errors:</strong>
                        <ul class="mt-2 mb-0">
                            @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                    @endif

                    <form method="POST" action="{{ route('users.update', $user->id) }}" class="needs-validation">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" id="name" name="name" value="{{ old('name', $user->name) }}" required>
                            @error('name') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" id="email" name="email" value="{{ old('email', $user->email) }}" required>
                            @error('email') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fw-semibold">Password <span class="text-muted">(Leave empty to keep current)</span></label>
                            <input type="password" class="form-control {{ $errors->has('password') ? 'is-invalid' : '' }}" id="password" name="password">
                            <small class="text-muted d-block mt-1">Minimum 8 characters if changing</small>
                            @error('password') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="password_confirmation" class="form-label fw-semibold">Confirm Password</label>
                            <input type="password" class="form-control {{ $errors->has('password_confirmation') ? 'is-invalid' : '' }}" id="password_confirmation" name="password_confirmation">
                            @error('password_confirmation') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-4">
                            <label for="role" class="form-label fw-semibold">Role <span class="text-danger">*</span></label>
                            <select class="form-select {{ $errors->has('role') ? 'is-invalid' : '' }}" id="role" name="role" required>
                                <option value="" disabled>Select a role...</option>
                                @foreach($roles as $role)
                                <option value="{{ $role }}" {{ old('role', $user->role) === $role ? 'selected' : '' }}>
                                    {{ $role }}
                                </option>
                                @endforeach
                            </select>
                            @error('role') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="alert alert-info mb-4" role="alert">
                            <i class="fa-solid fa-info-circle me-2"></i>
                            <strong>Info:</strong> Account created on {{ $user->created_at?->format('M d, Y H:i') ?? 'N/A' }}.
                            Last updated {{ $user->updated_at?->diffForHumans() ?? 'never' }}.
                        </div>

                        <div class="d-flex gap-2 justify-content-between">
                            <a href="{{ route('users.index') }}" class="btn btn-outline-secondary fw-semibold">
                                <i class="fa-solid fa-times me-1"></i> Cancel
                            </a>
                            <button type="submit" class="btn fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                                <i class="fa-solid fa-check me-1"></i> Update User
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection
