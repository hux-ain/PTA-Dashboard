@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('faultscleared.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('faultscleared.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="customer_name" class="form-label fw-semibold">Customer Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('customer_name') is-invalid @enderror"
                                   id="customer_name" name="customer_name" value="{{ old('customer_name') }}" required>
                            @error('customer_name')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="opened_at" class="form-label fw-semibold">Opened At <span class="text-danger">*</span></label>
                                <input type="datetime-local" class="form-control @error('opened_at') is-invalid @enderror"
                                       id="opened_at" name="opened_at" value="{{ old('opened_at') }}" required>
                                @error('opened_at')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="closed_at" class="form-label fw-semibold">Closed At</label>
                                <input type="datetime-local" class="form-control @error('closed_at') is-invalid @enderror"
                                       id="closed_at" name="closed_at" value="{{ old('closed_at') }}">
                                @error('closed_at')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="issue" class="form-label fw-semibold">Issue <span class="text-danger">*</span></label>
                            <textarea class="form-control @error('issue') is-invalid @enderror"
                                      id="issue" name="issue" rows="2" required>{{ old('issue') }}</textarea>
                            @error('issue')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="complaint_channel" class="form-label fw-semibold">Channel</label>
                                <input type="text" class="form-control @error('complaint_channel') is-invalid @enderror"
                                       id="complaint_channel" name="complaint_channel" value="{{ old('complaint_channel') }}" placeholder="e.g., Phone, Email">
                                @error('complaint_channel')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="main_city" class="form-label fw-semibold">City</label>
                                <input type="text" class="form-control @error('main_city') is-invalid @enderror"
                                       id="main_city" name="main_city" value="{{ old('main_city') }}">
                                @error('main_city')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="status" class="form-label fw-semibold">Status</label>
                                <input type="text" class="form-control @error('status') is-invalid @enderror"
                                       id="status" name="status" value="{{ old('status') }}" placeholder="e.g., Open, Closed">
                                @error('status')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="affect" class="form-label fw-semibold">Affect</label>
                                <input type="text" class="form-control @error('affect') is-invalid @enderror"
                                       id="affect" name="affect" value="{{ old('affect') }}" placeholder="e.g., Service Affecting">
                                @error('affect')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="owner" class="form-label fw-semibold">Owner</label>
                                <input type="text" class="form-control @error('owner') is-invalid @enderror"
                                       id="owner" name="owner" value="{{ old('owner') }}">
                                @error('owner')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="aging_downtime" class="form-label fw-semibold">Aging / Downtime</label>
                                <input type="text" class="form-control @error('aging_downtime') is-invalid @enderror"
                                       id="aging_downtime" name="aging_downtime" value="{{ old('aging_downtime') }}">
                                @error('aging_downtime')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="rfo" class="form-label fw-semibold">RFO (Reason for Outage)</label>
                            <textarea class="form-control @error('rfo') is-invalid @enderror"
                                      id="rfo" name="rfo" rows="2">{{ old('rfo') }}</textarea>
                            @error('rfo')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="mb-3">
                            <label for="rca" class="form-label fw-semibold">RCA (Root Cause Analysis)</label>
                            <textarea class="form-control @error('rca') is-invalid @enderror"
                                      id="rca" name="rca" rows="2">{{ old('rca') }}</textarea>
                            @error('rca')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save Fault Cleared
                            </button>
                            <a href="{{ route('faultscleared.index') }}" class="btn btn-secondary">
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
                    <p class="small text-muted mb-2"><strong>Issue:</strong> Description of the customer's complaint</p>
                    <p class="small text-muted mb-2"><strong>RFO / RCA:</strong> Fill once investigated</p>
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
