import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router } from '@inertiajs/react';

export default function SurveysIndex({ surveys = { data: [], links: [] }, stations = [], summary = {}, filters = {} }) {
    const [search, setSearch] = useState(filters.search || '');
    const [connectionType, setConnectionType] = useState(filters.connection_type || '');
    const [feasibility, setFeasibility] = useState(filters.feasibility || '');
    const [stationId, setStationId] = useState(filters.station_id || '');

    const handleFilter = (e) => {
        e.preventDefault();
        router.get('/surveys', { search, connection_type: connectionType, feasibility, station_id: stationId }, { preserveState: true });
    };

    return (
        <AuthenticatedLayout title="Survey Reports">
            <Head title="Survey Reports" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h4 className="fw-bold mb-1">Survey Reports</h4>
                        <small className="text-muted">Manage site surveys, feasibility assessments, and technical details.</small>
                    </div>
                    <div className="d-flex gap-2">
                        <Link href="/surveys/export-csv" className="btn btn-outline-secondary btn-sm">
                            <i className="fa-solid fa-file-csv me-2"></i>Export CSV
                        </Link>
                        <Link href="/surveys/create" className="btn btn-warning text-dark fw-bold btn-sm">
                            <i className="fa-solid fa-plus me-2"></i>New Survey
                        </Link>
                    </div>
                </div>

                {/* Summary Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Surveys</div>
                            <div className="fw-bold fs-4">{summary.total || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-primary text-white">
                            <div className="small">Fiber</div>
                            <div className="fw-bold fs-4">{summary.fiber || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-warning text-dark">
                            <div className="small">Radio Frequency (RF)</div>
                            <div className="fw-bold fs-4">{summary.rf || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Feasible</div>
                            <div className="fw-bold fs-4">{summary.feasible || 0}</div>
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
                                    placeholder="Customer, Raised by, POC..."
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Type</label>
                                <select className="form-select form-select-sm" value={connectionType} onChange={(e) => setConnectionType(e.target.value)}>
                                    <option value="">All Types</option>
                                    <option value="Fiber">Fiber</option>
                                    <option value="Radio Frequency">Radio Frequency</option>
                                </select>
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Feasibility</label>
                                <select className="form-select form-select-sm" value={feasibility} onChange={(e) => setFeasibility(e.target.value)}>
                                    <option value="">All Feasibilities</option>
                                    <option value="Feasible">Feasible</option>
                                    <option value="Non-Feasible">Non-Feasible</option>
                                </select>
                            </div>
                            <div className="col-md-3 d-flex gap-2">
                                <button type="submit" className="btn btn-primary btn-sm w-100">Filter</button>
                                <button type="button" className="btn btn-light btn-sm border" onClick={() => { setSearch(''); setConnectionType(''); setFeasibility(''); setStationId(''); router.get('/surveys'); }}>Reset</button>
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
                                        <th className="ps-3 py-3">Date</th>
                                        <th className="py-3">Customer Name</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Type</th>
                                        <th className="py-3">Feasibility</th>
                                        <th className="py-3">Raised By</th>
                                        <th className="pe-3 py-3 text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {surveys.data && surveys.data.length > 0 ? (
                                        surveys.data.map(s => (
                                            <tr key={s.id}>
                                                <td className="ps-3 fw-bold">{s.date}</td>
                                                <td className="fw-semibold">{s.customer_name}</td>
                                                <td><span className="badge bg-secondary">{s.station?.name || 'N/A'}</span></td>
                                                <td>{s.connection_type}</td>
                                                <td>
                                                    <span className={`badge ${s.feasibility === 'Feasible' ? 'bg-success' : 'bg-danger'}`}>
                                                        {s.feasibility}
                                                    </span>
                                                </td>
                                                <td>{s.raised_by || 'N/A'}</td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <Link href={`/surveys/${s.id}`} className="btn btn-outline-info" title="View">
                                                            <i className="fa-solid fa-eye"></i>
                                                        </Link>
                                                        <Link href={`/surveys/${s.id}/edit`} className="btn btn-outline-primary" title="Edit">
                                                            <i className="fa-solid fa-pen-to-square"></i>
                                                        </Link>
                                                        <Link href={`/surveys/${s.id}/print`} className="btn btn-outline-secondary" title="Print">
                                                            <i className="fa-solid fa-print"></i>
                                                        </Link>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr>
                                            <td colSpan="7" className="text-center py-5 text-muted">No surveys found.</td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Pagination */}
                {surveys.links && surveys.links.length > 3 && (
                    <div className="d-flex justify-content-center mt-4">
                        <ul className="pagination pagination-sm">
                            {surveys.links.map((link, idx) => (
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
