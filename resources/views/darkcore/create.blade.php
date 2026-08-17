@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('darkcore.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('darkcore.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('name') is-invalid @enderror"
                                   id="name" name="name" value="{{ old('name') }}" required>
                            @error('name')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="point_a" class="form-label fw-semibold">Point A <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('point_a') is-invalid @enderror"
                                       id="point_a" name="point_a" value="{{ old('point_a') }}" required>
                                @error('point_a')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="point_b" class="form-label fw-semibold">Point B <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('point_b') is-invalid @enderror"
                                       id="point_b" name="point_b" value="{{ old('point_b') }}" required>
                                @error('point_b')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="service_provider_name" class="form-label fw-semibold">Service Provider Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('service_provider_name') is-invalid @enderror"
                                   id="service_provider_name" name="service_provider_name" value="{{ old('service_provider_name') }}" required>
                            @error('service_provider_name')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="service_type" class="form-label fw-semibold">Service Type</label>
                                <input type="text" class="form-control @error('service_type') is-invalid @enderror"
                                       id="service_type" name="service_type" value="{{ old('service_type') }}">
                                @error('service_type')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="own_or_lease" class="form-label fw-semibold">Own / Lease</label>
                                <input type="text" class="form-control @error('own_or_lease') is-invalid @enderror"
                                       id="own_or_lease" name="own_or_lease" value="{{ old('own_or_lease') }}" placeholder="e.g., Own, Lease">
                                @error('own_or_lease')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save Dark Core Link
                            </button>
                            <a href="{{ route('darkcore.index') }}" class="btn btn-secondary">
                                <i class="fa-solid fa-times me-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow-sm border-0 rounded-4 bg-light">
                <div class="card-body p-4">
                    <h6 class="fw-bold mb-3"><i class="fa-solid fa-circle-info me-2 text-info"></i>Information</h6>
                    <p class="small text-muted mb-2"><strong>Point A/B:</strong> The two endpoints of this dark core link</p>
                    <hr>
                    <p class="small text-muted mb-0">
                        <i class="fa-solid fa-asterisk text-danger me-1" style="font-size: 0.6rem;"></i>
                        <strong>Required fields</strong>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
