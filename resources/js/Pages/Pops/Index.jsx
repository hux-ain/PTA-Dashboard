import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, useForm, router } from '@inertiajs/react';

export default function PopsIndex({ pops = { data: [] }, stations = [] }) {
    const [editPop, setEditPop] = useState(null);
    const [showModal, setShowModal] = useState(false);

    const { data, setData, post, put, reset, processing } = useForm({
        pop_name: '',
        station_id: '',
        pop_address: '',
        poc: '',
        tower_type: 'Guys tower',
    });

    const openAddModal = () => {
        setEditPop(null);
        reset();
        setShowModal(true);
    };

    const openEditModal = (p) => {
        setEditPop(p);
        setData({
            pop_name: p.pop_name || '',
            station_id: p.station_id || '',
            pop_address: p.pop_address || '',
            poc: p.poc || '',
            tower_type: p.tower_type || 'Guys tower',
        });
        setShowModal(true);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        if (editPop) {
            put(`/pops/${editPop.pop_id || editPop.id}`, { onSuccess: () => { setShowModal(false); reset(); } });
        } else {
            post('/pops/store', { onSuccess: () => { setShowModal(false); reset(); } });
        }
    };

    const handleDelete = (id, name) => {
        if (confirm(`Delete POP "${name}"?`)) {
            router.delete(`/pops/${id}`);
        }
    };

    return (
        <AuthenticatedLayout title="POPs Management">
            <Head title="POPs Management" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h4 className="fw-bold mb-1">Point of Presence (POPs)</h4>
                        <small className="text-muted">Manage network towers, relay stations, and transmission points.</small>
                    </div>
                    <button className="btn btn-warning text-dark fw-bold btn-sm" onClick={openAddModal}>
                        <i className="fa-solid fa-plus me-2"></i>Add POP
                    </button>
                </div>

                <div className="card border-0 shadow-sm">
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-3">POP Name</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Tower Type</th>
                                        <th className="py-3">Address / Location</th>
                                        <th className="pe-3 py-3 text-end">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {pops.data && pops.data.length > 0 ? (
                                        pops.data.map(p => (
                                            <tr key={p.pop_id || p.id}>
                                                <td className="ps-3 fw-bold">{p.pop_name}</td>
                                                <td><span className="badge bg-secondary">{p.station?.name || 'N/A'}</span></td>
                                                <td><span className="badge bg-info text-dark">{p.tower_type || 'N/A'}</span></td>
                                                <td>{p.pop_address || 'N/A'}</td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <button onClick={() => openEditModal(p)} className="btn btn-outline-primary"><i className="fa-solid fa-pen"></i></button>
                                                        <button onClick={() => handleDelete(p.pop_id || p.id, p.pop_name)} className="btn btn-outline-danger"><i className="fa-solid fa-trash"></i></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr><td colSpan="5" className="text-center py-5 text-muted">No POPs found.</td></tr>
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
                                    <h5 className="modal-title fs-6">{editPop ? 'Edit POP' : 'Add New POP'}</h5>
                                    <button className="btn-close btn-close-white" onClick={() => setShowModal(false)}></button>
                                </div>
                                <form onSubmit={handleSubmit}>
                                    <div className="modal-body">
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">POP Name *</label>
                                            <input type="text" className="form-control" value={data.pop_name} onChange={e => setData('pop_name', e.target.value)} required />
                                        </div>
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Station *</label>
                                            <select className="form-select" value={data.station_id} onChange={e => setData('station_id', e.target.value)} required>
                                                <option value="">Select Station</option>
                                                {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                            </select>
                                        </div>
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Tower Type</label>
                                            <select className="form-select" value={data.tower_type} onChange={e => setData('tower_type', e.target.value)}>
                                                <option value="Guys tower">Guys tower</option>
                                                <option value="Self Support">Self Support</option>
                                            </select>
                                        </div>
                                        <div className="mb-3">
                                            <label className="form-label small fw-bold">Address / Location</label>
                                            <textarea className="form-control" rows="2" value={data.pop_address} onChange={e => setData('pop_address', e.target.value)}></textarea>
                                        </div>
                                    </div>
                                    <div className="modal-footer">
                                        <button type="button" className="btn btn-secondary btn-sm" onClick={() => setShowModal(false)}>Cancel</button>
                                        <button type="submit" className="btn btn-warning text-dark fw-bold btn-sm" disabled={processing}>Save POP</button>
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
