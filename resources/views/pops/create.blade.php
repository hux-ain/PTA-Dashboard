@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('pops.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('pops.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="serial_no" class="form-label fw-semibold">Serial No</label>
                            <input type="text" class="form-control @error('serial_no') is-invalid @enderror"
                                   id="serial_no" name="serial_no" value="{{ old('serial_no') }}">
                            @error('serial_no')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="mb-3">
                            <label for="pop_name" class="form-label fw-semibold">POP Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('pop_name') is-invalid @enderror"
                                   id="pop_name" name="pop_name" value="{{ old('pop_name') }}" required>
                            @error('pop_name')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="city" class="form-label fw-semibold">City <span class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('city') is-invalid @enderror"
                                       id="city" name="city" value="{{ old('city') }}" required>
                                @error('city')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="gps_coordinates" class="form-label fw-semibold">GPS Coordinates</label>
                                <input type="text" class="form-control @error('gps_coordinates') is-invalid @enderror"
                                       id="gps_coordinates" name="gps_coordinates" value="{{ old('gps_coordinates') }}" placeholder="e.g., 24.8607, 67.0011">
                                @error('gps_coordinates')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label fw-semibold">Address</label>
                            <textarea class="form-control @error('address') is-invalid @enderror"
                                      id="address" name="address" rows="3">{{ old('address') }}</textarea>
                            @error('address')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="mb-3">
                            <label for="own_colocated" class="form-label fw-semibold">Own / Co-located</label>
                            <input type="text" class="form-control @error('own_colocated') is-invalid @enderror"
                                   id="own_colocated" name="own_colocated" value="{{ old('own_colocated') }}" placeholder="e.g., Own, Co-located">
                            @error('own_colocated')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save POP Location
                            </button>
                            <a href="{{ route('pops.index') }}" class="btn btn-secondary">
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
                    <p class="small text-muted mb-2"><strong>POP Name:</strong> Name of the Point of Presence / NOC location</p>
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
