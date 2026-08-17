@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('dplc.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('dplc.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="serial_no" class="form-label fw-semibold">Serial No</label>
                            <input type="text" class="form-control @error('serial_no') is-invalid @enderror"
                                   id="serial_no" name="serial_no" value="{{ old('serial_no') }}">
                            @error('serial_no')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="point_a_gps" class="form-label fw-semibold">Point A GPS</label>
                                <input type="text" class="form-control @error('point_a_gps') is-invalid @enderror"
                                       id="point_a_gps" name="point_a_gps" value="{{ old('point_a_gps') }}" placeholder="e.g., 24.8607, 67.0011">
                                @error('point_a_gps')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="point_b_gps" class="form-label fw-semibold">Point B GPS</label>
                                <input type="text" class="form-control @error('point_b_gps') is-invalid @enderror"
                                       id="point_b_gps" name="point_b_gps" value="{{ old('point_b_gps') }}" placeholder="e.g., 24.8607, 67.0011">
                                @error('point_b_gps')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="service_provider" class="form-label fw-semibold">Service Provider <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('service_provider') is-invalid @enderror"
                                   id="service_provider" name="service_provider" value="{{ old('service_provider') }}" required>
                            @error('service_provider')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="mb-3">
                            <label for="total_bandwidth_acquired" class="form-label fw-semibold">Total Bandwidth Acquired</label>
                            <input type="text" class="form-control @error('total_bandwidth_acquired') is-invalid @enderror"
                                   id="total_bandwidth_acquired" name="total_bandwidth_acquired" value="{{ old('total_bandwidth_acquired') }}" placeholder="e.g., 10 Mbps">
                            @error('total_bandwidth_acquired')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save DPLC Detail
                            </button>
                            <a href="{{ route('dplc.index') }}" class="btn btn-secondary">
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
                    <p class="small text-muted mb-2"><strong>GPS Points:</strong> Coordinates of link endpoints</p>
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
