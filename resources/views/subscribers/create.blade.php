@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="fa-solid fa-plus me-2 text-primary"></i>{{ $pageTitle }}</h2>
                <a href="{{ route('subscribers.index') }}" class="btn btn-outline-secondary">
                    <i class="fa-solid fa-arrow-left me-2"></i>Back to List
                </a>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8">
            <div class="card shadow-sm border-0 rounded-4">
                <div class="card-body p-4">
                    <form action="{{ route('subscribers.store') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label for="company_name" class="form-label fw-semibold">Company Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control @error('company_name') is-invalid @enderror" 
                                   id="company_name" name="company_name" value="{{ old('company_name') }}" required>
                            @error('company_name')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="ntn_cnic" class="form-label fw-semibold">NTN / CNIC</label>
                            <input type="text" class="form-control @error('ntn_cnic') is-invalid @enderror" 
                                   id="ntn_cnic" name="ntn_cnic" value="{{ old('ntn_cnic') }}" placeholder="e.g., 1234567-8">
                            @error('ntn_cnic')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label fw-semibold">Address</label>
                            <textarea class="form-control @error('address') is-invalid @enderror" 
                                      id="address" name="address" rows="3">{{ old('address') }}</textarea>
                            @error('address')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="contact" class="form-label fw-semibold">Contact Number</label>
                            <input type="text" class="form-control @error('contact') is-invalid @enderror" 
                                   id="contact" name="contact" value="{{ old('contact') }}" placeholder="e.g., +92-21-12345678">
                            @error('contact')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="mb-3">
                            <label for="package" class="form-label fw-semibold">Package</label>
                            <input type="text" class="form-control @error('package') is-invalid @enderror" 
                                   id="package" name="package" value="{{ old('package') }}" placeholder="e.g., Premium, Standard">
                            @error('package')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary fw-semibold">
                                <i class="fa-solid fa-check me-2"></i>Save Subscriber
                            </button>
                            <a href="{{ route('subscribers.index') }}" class="btn btn-secondary">
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
                    <p class="small text-muted mb-2">
                        <strong>Company Name:</strong> Full legal name of the subscriber company
                    </p>
                    <p class="small text-muted mb-2">
                        <strong>NTN/CNIC:</strong> Tax identification or national identity number
                    </p>
                    <p class="small text-muted mb-2">
                        <strong>Package:</strong> Service package or subscription tier
                    </p>
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
