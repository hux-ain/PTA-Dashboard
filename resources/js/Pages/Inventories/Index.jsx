import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router } from '@inertiajs/react';

export default function InventoriesIndex({ inventories = { data: [], links: [] }, stations = [], summary = {}, filters = {} }) {
    const [search, setSearch] = useState(filters.search || '');
    const [verification, setVerification] = useState(filters.verification || '');
    const [stationId, setStationId] = useState(filters.station_id || '');

    const handleFilter = (e) => {
        e.preventDefault();
        router.get('/inventories', { search, verification, station_id: stationId }, { preserveState: true });
    };

    const handleDelete = (id, desc) => {
        if (confirm(`Are you sure you want to delete inventory item "${desc}"?`)) {
            router.delete(`/inventories/${id}`);
        }
    };

    return (
        <AuthenticatedLayout title="Inventory Management">
            <Head title="Inventory Management" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h4 className="fw-bold mb-1">Inventory Items</h4>
                        <small className="text-muted">Manage network equipment, routers, switches, and stock serial numbers.</small>
                    </div>
                    <div className="d-flex gap-2">
                        <Link href="/inventories/export-csv" className="btn btn-outline-secondary btn-sm">
                            <i className="fa-solid fa-file-csv me-2"></i>Export CSV
                        </Link>
                        <Link href="/inventories/create" className="btn btn-warning text-dark fw-bold btn-sm">
                            <i className="fa-solid fa-plus me-2"></i>Add Inventory Item
                        </Link>
                    </div>
                </div>

                {/* Summary Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-4">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Inventory</div>
                            <div className="fw-bold fs-4">{summary.total || 0}</div>
                        </div>
                    </div>
                    <div className="col-4">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Verified Items</div>
                            <div className="fw-bold fs-4">{summary.verified || 0}</div>
                        </div>
                    </div>
                    <div className="col-4">
                        <div className="card border-0 shadow-sm text-center py-2 bg-warning text-dark">
                            <div className="small">Unverified Items</div>
                            <div className="fw-bold fs-4">{summary.unverified || 0}</div>
                        </div>
                    </div>
                </div>

                {/* Filters */}
                <div className="card border-0 shadow-sm mb-4">
                    <div className="card-body">
                        <form onSubmit={handleFilter} className="row g-3 align-items-end">
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Search</label>
                                <input
                                    type="text"
                                    className="form-control form-control-sm"
                                    placeholder="Serial #, Model, Brand, Description..."
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Verification</label>
                                <select className="form-select form-select-sm" value={verification} onChange={(e) => setVerification(e.target.value)}>
                                    <option value="">All Verifications</option>
                                    <option value="Verified">Verified</option>
                                    <option value="Unverified">Unverified</option>
                                </select>
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Station</label>
                                <select className="form-select form-select-sm" value={stationId} onChange={(e) => setStationId(e.target.value)}>
                                    <option value="">All Stations</option>
                                    {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                </select>
                            </div>
                            <div className="col-md-3 d-flex gap-2">
                                <button type="submit" className="btn btn-primary btn-sm w-100">Filter</button>
                                <button type="button" className="btn btn-light btn-sm border" onClick={() => { setSearch(''); setVerification(''); setStationId(''); router.get('/inventories'); }}>Reset</button>
                            </div>
                        </form>
                    </div>
                </div>

                {/* Table */}
                <div className="card border-0 shadow-sm">
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-3">Item Description</th>
                                        <th className="py-3">Serial #</th>
                                        <th className="py-3">Brand / Model</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Verification</th>
                                        <th className="pe-3 py-3 text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {inventories.data && inventories.data.length > 0 ? (
                                        inventories.data.map(inv => (
                                            <tr key={inv.id}>
                                                <td className="ps-3 fw-bold">{inv.description}</td>
                                                <td><span className="font-monospace">{inv.serial_no || 'N/A'}</span></td>
                                                <td>{inv.brand || 'N/A'} {inv.model ? `(${inv.model})` : ''}</td>
                                                <td><span className="badge bg-secondary">{inv.station?.name || 'N/A'}</span></td>
                                                <td>
                                                    <span className={`badge ${inv.verification === 'Verified' ? 'bg-success' : 'bg-warning text-dark'}`}>
                                                        {inv.verification}
                                                    </span>
                                                </td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <Link href={`/inventories/${inv.id}/edit`} className="btn btn-outline-primary" title="Edit">
                                                            <i className="fa-solid fa-pen-to-square"></i>
                                                        </Link>
                                                        <button onClick={() => handleDelete(inv.id, inv.description)} className="btn btn-outline-danger" title="Delete">
                                                            <i className="fa-solid fa-trash-can"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr>
                                            <td colSpan="6" className="text-center py-5 text-muted">No inventory items found.</td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Pagination */}
                {inventories.links && inventories.links.length > 3 && (
                    <div className="d-flex justify-content-center mt-4">
                        <ul className="pagination pagination-sm">
                            {inventories.links.map((link, idx) => (
                                <li key={idx} className={`page-item ${link.active ? 'active' : ''} ${!link.url ? 'disabled' : ''}`}>
                                    <Link href={link.url || '#'} className="page-link" dangerouslySetInnerHTML={{ __html: link.label }} />
                                </li>
                            ))}
                        </ul>
                    </div>
                )}
            </div>
        </AuthenticatedLayout>
    );
}
