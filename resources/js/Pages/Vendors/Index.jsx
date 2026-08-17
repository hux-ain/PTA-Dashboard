import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm, router } from '@inertiajs/react';

export default function VendorsIndex({ vendors = { data: [] }, stations = [] }) {
    const [editVendor, setEditVendor] = useState(null);
    const [showModal, setShowModal] = useState(false);

    const { data, setData, post, put, reset, errors, processing } = useForm({
        vendor_name: '',
        station_id: '',
        poc: '',
        email: '',
        phone: '',
    });

    const openAddModal = () => {
        setEditVendor(null);
        reset();
        setShowModal(true);
    };

    const openEditModal = (v) => {
        setEditVendor(v);
        setData({
            vendor_name: v.vendor_name || '',
            station_id: v.station_id || '',
            poc: v.poc || '',
            email: v.email || '',
            phone: v.phone || '',
        });
        setShowModal(true);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        if (editVendor) {
            put(`/vendors/${editVendor.id}`, {
                onSuccess: () => { setShowModal(false); reset(); }
            });
        } else {
            post('/vendors/store', {
                onSuccess: () => { setShowModal(false); reset(); }
            });
        }
    };

    const handleDelete = (id, name) => {
        if (confirm(`Delete vendor "${name}"?`)) {
            router.delete(`/vendors/${id}`);
        }
    };

    return (
        <AuthenticatedLayout title="Vendors Directory">
            <Head title="Vendors Directory" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h4 className="fw-bold mb-1">Vendors Directory</h4>
                        <small className="text-muted">Manage third-party service providers and vendors.</small>
                    </div>
                    <button className="btn btn-warning text-dark fw-bold btn-sm" onClick={openAddModal}>
                        <i className="fa-solid fa-plus me-2"></i>Add Vendor
                    </button>
                </div>

                <div className="card border-0 shadow-sm">
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-3">Vendor Name</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">POC</th>
                                        <th className="py-3">Contact</th>
                                        <th className="pe-3 py-3 text-end">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {vendors.data && vendors.data.length > 0 ? (
                                        vendors.data.map(v => (
                                            <tr key={v.id}>
                                                <td className="ps-3 fw-bold">{v.vendor_name}</td>
                                                <td><span className="badge bg-secondary">{v.station?.name || 'N/A'}</span></td>
                                                <td>{v.poc || 'N/A'}</td>
                                                <td>{v.phone || v.email || 'N/A'}</td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <button onClick={() => openEditModal(v)} className="btn btn-outline-primary"><i className="fa-solid fa-pen"></i></button>
                                                        <button onClick={() => handleDelete(v.id, v.vendor_name)} className="btn btn-outline-danger"><i className="fa-solid fa-trash"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr><td colSpan="5" className="text-center py-5 text-muted">No vendors found.</td></tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Modal */}
                {showModal && (
                    <div className="modal show d-block" style={{ backgroundColor: 'rgba(0,0,0,0.5)' }}>
                        <div className="modal-dialog">
                            <div className="modal-content border-0 shadow">
                                <div className="modal-header bg-dark text-white">
                                    <h5 className="modal-title fs-6">{editVendor ? 'Edit Vendor' : 'Add New Vendor'}</h5>
                                    <button className="btn-close btn-close-white" onClick={() => setShowModal(false)}></button>
                                </div>
                                <form onSubmit={handleSubmit}>
                                    <div className="modal-body">
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Vendor Name *</label>
                                            <input type="text" className="form-control" value={data.vendor_name} onChange={e => setData('vendor_name', e.target.value)} required />
                                        </div>
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Station *</label>
                                            <select className="form-select" value={data.station_id} onChange={e => setData('station_id', e.target.value)} required>
                                                <option value="">Select Station</option>
                                                {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                            </select>
                                        </div>
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Point of Contact (POC)</label>
                                            <input type="text" className="form-control" value={data.poc} onChange={e => setData('poc', e.target.value)} />
                                        </div>
                                    </div>
                                    <div className="modal-footer">
                                        <button type="button" className="btn btn-secondary btn-sm" onClick={() => setShowModal(false)}>Cancel</button>
                                        <button type="submit" className="btn btn-warning text-dark fw-bold btn-sm" disabled={processing}>Save Vendor</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                )}
            </div>
        </AuthenticatedLayout>
    );
}
