import React from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';

export default function ChangePassword() {
    const { data, setData, post, processing, errors, reset } = useForm({
        current_password: '',
        new_password: '',
        new_password_confirmation: '',
    });

    const handleSubmit = (e) => {
        e.preventDefault();
        post('/account/change-password', {
            onSuccess: () => reset()
        });
    };

    return (
        <AuthenticatedLayout title="Change Password">
            <Head title="Change Password" />

            <div className="container py-3" style={{ maxWidth: '600px' }}>
                <div className="card border-0 shadow-sm">
                    <div className="card-header bg-dark text-white fw-bold py-3">
                        <i className="fa-solid fa-lock me-2"></i>Change Password
                    </div>
                    <div className="card-body p-4">
                        <form onSubmit={handleSubmit}>
                            <div className="mb-3">
                                <label className="form-label small fw-bold">Current Password *</label>
                                <input
                                    type="password"
                                    className={`form-control ${errors?.current_password ? 'is-invalid' : ''}`}
                                    value={data.current_password}
                                    onChange={e => setData('current_password', e.target.value)}
                                    required
                                />
                                {errors?.current_password && <div className="invalid-feedback">{errors.current_password}</div>}
                            </div>

                            <div className="mb-3">
                                <label className="form-label small fw-bold">New Password *</label>
                                <input
                                    type="password"
                                    className={`form-control ${errors?.new_password ? 'is-invalid' : ''}`}
                                    value={data.new_password}
                                    onChange={e => setData('new_password', e.target.value)}
                                    required
                                />
                                {errors?.new_password && <div className="invalid-feedback">{errors.new_password}</div>}
                            </div>

                            <div className="mb-4">
                                <label className="form-label small fw-bold">Confirm New Password *</label>
                                <input
                                    type="password"
                                    className="form-control"
                                    value={data.new_password_confirmation}
                                    onChange={e => setData('new_password_confirmation', e.target.value)}
                                    required
                                />
                            </div>

                            <button type="submit" className="btn btn-warning text-dark fw-bold btn-sm w-100 py-2" disabled={processing}>
                                Update Password
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
