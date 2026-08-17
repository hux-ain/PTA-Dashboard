import React from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, usePage } from '@inertiajs/react';

export default function AccountShow() {
    const { auth } = usePage().props;
    const user = auth?.user || {};

    return (
        <AuthenticatedLayout title="Account Details">
            <Head title="Account Details" />

            <div className="container py-3" style={{ maxWidth: '700px' }}>
                <div className="card border-0 shadow-sm">
                    <div className="card-header bg-dark text-white fw-bold py-3">
                        <i className="fa-solid fa-id-card me-2"></i>User Profile & Account Info
                    </div>
                    <div className="card-body p-4">
                        <div className="d-flex align-items-center mb-4 pb-3 border-bottom">
                            <div className="avatar-emoji-placeholder rounded-circle me-3" style={{ width: '64px', height: '64px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                                <i className="fa-solid fa-user fs-2"></i>
                            </div>
                            <div>
                                <h4 className="fw-bold mb-0">{user.name}</h4>
                                <span className="badge bg-warning text-dark me-2">{user.role_name}</span>
                                <small className="text-muted">{user.email}</small>
                            </div>
                        </div>

                        <div className="row g-3">
                            <div className="col-md-6">
                                <label className="form-label text-muted small mb-1">Username / Email</label>
                                <div className="fw-bold">{user.email}</div>
                            </div>
                            <div className="col-md-6">
                                <label className="form-label text-muted small mb-1">Assigned Role</label>
                                <div className="fw-bold">{user.role_name}</div>
                            </div>
                        </div>

                        <div className="mt-4 pt-3 border-top d-flex gap-2">
                            <Link href="/account/change-password" className="btn btn-warning text-dark fw-bold btn-sm">
                                <i className="fa-solid fa-key me-2"></i>Change Password
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
