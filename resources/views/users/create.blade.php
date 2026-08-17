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
                        <h5 class="mb-1 fw-bold text-dark"><i class="fa-solid fa-user-plus me-2" style="color:var(--accent);"></i>{{ $pageTitle }}</h5>
                        <p class="text-muted small mb-0">Create a new user account</p>
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

                    <form method="POST" action="{{ route('users.store') }}" class="needs-validation">
                        @csrf

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" id="name" name="name" value="{{ old('name') }}" required>
                            @error('name') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" id="email" name="email" value="{{ old('email') }}" required>
                            @error('email') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fw-semibold">Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control {{ $errors->has('password') ? 'is-invalid' : '' }}" id="password" name="password" required>
                            <small class="text-muted d-block mt-1">Minimum 8 characters</small>
                            @error('password') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-3">
                            <label for="password_confirmation" class="form-label fw-semibold">Confirm Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control {{ $errors->has('password_confirmation') ? 'is-invalid' : '' }}" id="password_confirmation" name="password_confirmation" required>
                            @error('password_confirmation') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="mb-4">
                            <label for="role" class="form-label fw-semibold">Role <span class="text-danger">*</span></label>
                            <select class="form-select {{ $errors->has('role') ? 'is-invalid' : '' }}" id="role" name="role" required>
                                <option value="" selected disabled>Select a role...</option>
                                @foreach($roles as $role)
                                <option value="{{ $role }}" {{ old('role') === $role ? 'selected' : '' }}>
                                    {{ $role }}
                                </option>
                                @endforeach
                            </select>
                            @error('role') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
                        </div>

                        <div class="d-flex gap-2 justify-content-between">
                            <a href="{{ route('users.index') }}" class="btn btn-outline-secondary fw-semibold">
                                <i class="fa-solid fa-times me-1"></i> Cancel
                            </a>
                            <button type="submit" class="btn fw-semibold" style="background:var(--accent);color:#1f2227;border:none;">
                                <i class="fa-solid fa-plus me-1"></i> Create User
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection
