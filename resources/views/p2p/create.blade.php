@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('p2p.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('p2p.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="serial_no" class="form-label fw-semibold">Serial No</label>
                            <input type="text" class="form-control @error('serial_no') is-invalid @enderror"
                                   id="serial_no" name="serial_no" value="{{ old('serial_no') }}">
                            @error('serial_no')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="link_name" class="form-label fw-semibold">Link Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('link_name') is-invalid @enderror"
                                   id="link_name" name="link_name" value="{{ old('link_name') }}" required>
                            @error('link_name')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="station_a" class="form-label fw-semibold">Station A <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('station_a') is-invalid @enderror"
                                   id="station_a" name="station_a" value="{{ old('station_a') }}" required>
                            @error('station_a')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="station_b" class="form-label fw-semibold">Station B <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('station_b') is-invalid @enderror"
                                   id="station_b" name="station_b" value="{{ old('station_b') }}" required>
                            @error('station_b')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label fw-semibold">Status</label>
                            <input type="text" class="form-control @error('status') is-invalid @enderror"
                                   id="status" name="status" value="{{ old('status') }}" placeholder="e.g., Active, Down">
                            @error('status')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="ownership" class="form-label fw-semibold">Ownership</label>
                            <input type="text" class="form-control @error('ownership') is-invalid @enderror"
                                   id="ownership" name="ownership" value="{{ old('ownership') }}" placeholder="e.g., Own, Leased">
                            @error('ownership')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="frequency" class="form-label fw-semibold">Frequency</label>
                            <input type="text" class="form-control @error('frequency') is-invalid @enderror"
                                   id="frequency" name="frequency" value="{{ old('frequency') }}">
                            @error('frequency')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save P2P Subscriber
                            </button>
                            <a href="{{ route('p2p.index') }}" class="btn btn-secondary">
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
                    <p class="small text-muted mb-2"><strong>Link Name:</strong> Name identifying this P2P link</p>
                    <p class="small text-muted mb-2"><strong>Station A/B:</strong> The two endpoints of the link</p>
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
