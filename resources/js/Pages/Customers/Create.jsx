import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm } from '@inertiajs/react';

export default function CustomerCreate({ stations = [], vendors = [], pops = [], connectionTypes = [] }) {
    const { data, setData, post, processing, errors } = useForm({
        customer_name: '',
        company_name: '',
        cnic_no: '',
        address: '',
        station_id: '',
        emails: [''],
        mobile_numbers: [''],
        connections: [
            {
                bandwidth: 10,
                status: 'Active',
                location: '',
                address: '',
                installed_by: '',
                remarks: '',
            }
        ]
    });

    const handleSubmit = (e) => {
        e.preventDefault();
        post('/customers/store');
    };

    return (
        <AuthenticatedLayout title="Create New Customer">
            <Head title="Create New Customer" />

            <div className="container-fluid py-2" style={{ maxWidth: '900px' }}>
                <div className="card border-0 shadow-sm">
                    <div className="card-header bg-dark text-white fw-bold py-3">
                        <i className="fa-solid fa-user-plus me-2 text-warning"></i>Customer & Connection Onboarding
                    </div>
                    <div className="card-body p-4">
                        <form onSubmit={handleSubmit}>
                            <h6 className="fw-bold border-bottom pb-2 mb-3 text-warning">Basic Customer Information</h6>

                            <div className="row g-3 mb-3">
                                <div className="col-md-6">
                                    <label className="form-label small fw-bold">Customer Name *</label>
                                    <input
                                        type="text"
                                        className={`form-control ${errors.customer_name ? 'is-invalid' : ''}`}
                                        value={data.customer_name}
                                        onChange={e => setData('customer_name', e.target.value)}
                                        required
                                    />
                                    {errors.customer_name && <div className="invalid-feedback">{errors.customer_name}</div>}
                                </div>

                                <div className="col-md-6">
                                    <label className="form-label small fw-bold">Company Name</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        value={data.company_name}
                                        onChange={e => setData('company_name', e.target.value)}
                                    />
                                </div>
                            </div>

                            <div className="row g-3 mb-3">
                                <div className="col-md-6">
                                    <label className="form-label small fw-bold">Station *</label>
                                    <select
                                        className={`form-select ${errors.station_id ? 'is-invalid' : ''}`}
                                        value={data.station_id}
                                        onChange={e => setData('station_id', e.target.value)}
                                        required
                                    >
                                        <option value="">Select Station</option>
                                        {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                    </select>
                                </div>

                                <div className="col-md-6">
                                    <label className="form-label small fw-bold">CNIC #</label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="42101-xxxxxxx-x"
                                        value={data.cnic_no}
                                        onChange={e => setData('cnic_no', e.target.value)}
                                    />
                                </div>
                            </div>

                            <h6 className="fw-bold border-bottom pb-2 mb-3 mt-4 text-warning">Connection Details</h6>

                            {data.connections.map((conn, idx) => (
                                <div key={idx} className="p-3 mb-3 border rounded bg-light">
                                    <div className="row g-3">
                                        <div className="col-md-6">
                                            <label className="form-label small fw-bold">Bandwidth (Mbps) *</label>
                                            <input
                                                type="number"
                                                className="form-control"
                                                value={conn.bandwidth}
                                                onChange={e => {
                                                    const updated = [...data.connections];
                                                    updated[idx].bandwidth = e.target.value;
                                                    setData('connections', updated);
                                                }}
                                                required
                                            />
                                        </div>

                                        <div className="col-md-6">
                                            <label className="form-label small fw-bold">Status *</label>
                                            <select
                                                className="form-select"
                                                value={conn.status}
                                                onChange={e => {
                                                    const updated = [...data.connections];
                                                    updated[idx].status = e.target.value;
                                                    setData('connections', updated);
                                                }}
                                            >
                                                <option value="Active">Active</option>
                                                <option value="Suspended">Suspended</option>
                                                <option value="Temp Off">Temp Off</option>
                                                <option value="Terminated">Terminated</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            ))}

                            <div className="mt-4 pt-3 border-top d-flex gap-2">
                                <button type="submit" className="btn btn-warning text-dark fw-bold px-4" disabled={processing}>
                                    <i className="fa-solid fa-check me-2"></i>Save Customer
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
