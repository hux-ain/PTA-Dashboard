import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router } from '@inertiajs/react';

export default function TicketsIndex({ tickets = { data: [], links: [] }, stations = [], summary = {}, filters = {} }) {
    const [search, setSearch] = useState(filters.search || '');
    const [status, setStatus] = useState(filters.status || '');
    const [stationId, setStationId] = useState(filters.station_id || '');
    const [affect, setAffect] = useState(filters.affect || '');

    const handleFilter = (e) => {
        e.preventDefault();
        router.get('/tickets', { search, status, station_id: stationId, affect }, { preserveState: true });
    };

    const getStatusBadge = (ticketStatus) => {
        switch (ticketStatus) {
            case 'open': return <span className="badge bg-danger">Open</span>;
            case 'in-progress': return <span className="badge bg-warning text-dark">In Progress</span>;
            case 'closed': return <span className="badge bg-success">Closed</span>;
            default: return <span className="badge bg-secondary">{ticketStatus}</span>;
        }
    };

    return (
        <AuthenticatedLayout title="Tickets Management">
            <Head title="Tickets Management" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h4 className="fw-bold mb-1">Tickets Center</h4>
                        <small className="text-muted">Track customer complaints, outages, and resolution status.</small>
                    </div>
                    <div className="d-flex gap-2">
                        <Link href="/tickets/export-csv" className="btn btn-outline-secondary btn-sm">
                            <i className="fa-solid fa-file-csv me-2"></i>Export CSV
                        </Link>
                        <Link href="/tickets/create" className="btn btn-warning text-dark fw-bold btn-sm">
                            <i className="fa-solid fa-plus me-2"></i>Create New Ticket
                        </Link>
                    </div>
                </div>

                {/* Summary Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Tickets</div>
                            <div className="fw-bold fs-4">{summary.total || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-danger text-white">
                            <div className="small">Open</div>
                            <div className="fw-bold fs-4">{summary.open || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-warning text-dark">
                            <div className="small">In Progress</div>
                            <div className="fw-bold fs-4">{summary.in_progress || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Closed</div>
                            <div className="fw-bold fs-4">{summary.closed || 0}</div>
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
                                    placeholder="Ticket #, Issue, Customer..."
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Status</label>
                                <select
                                    className="form-select form-select-sm"
                                    value={status}
                                    onChange={(e) => setStatus(e.target.value)}
                                >
                                    <option value="">All Statuses</option>
                                    <option value="open">Open</option>
                                    <option value="in-progress">In Progress</option>
                                    <option value="closed">Closed</option>
                                </select>
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Station</label>
                                <select
                                    className="form-select form-select-sm"
                                    value={stationId}
                                    onChange={(e) => setStationId(e.target.value)}
                                >
                                    <option value="">All Stations</option>
                                    {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                </select>
                            </div>
                            <div className="col-md-3 d-flex gap-2">
                                <button type="submit" className="btn btn-primary btn-sm w-100">
                                    Filter
                                </button>
                                <button
                                    type="button"
                                    className="btn btn-light btn-sm border"
                                    onClick={() => { setSearch(''); setStatus(''); setStationId(''); router.get('/tickets'); }}
                                >
                                    Reset
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                {/* Tickets Table */}
                <div className="card border-0 shadow-sm">
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-3">Ticket #</th>
                                        <th className="py-3">Customer</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Issue</th>
                                        <th className="py-3">Opened At</th>
                                        <th className="py-3">Status</th>
                                        <th className="pe-3 py-3 text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {tickets.data && tickets.data.length > 0 ? (
                                        tickets.data.map(t => (
                                            <tr key={t.id}>
                                                <td className="ps-3 fw-bold">{t.ticket_no}</td>
                                                <td>{t.customer?.customer_name || 'N/A'}</td>
                                                <td><span className="badge bg-secondary">{t.station?.name || 'N/A'}</span></td>
                                                <td style={{ maxWidth: '250px' }} className="text-truncate">{t.issue}</td>
                                                <td>{t.opened_at ? new Date(t.opened_at).toLocaleDateString() : 'N/A'}</td>
                                                <td>{getStatusBadge(t.status)}</td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <Link href={`/tickets/${t.id}`} className="btn btn-outline-info" title="View Detail">
                                                            <i className="fa-solid fa-eye"></i>
                                                        </Link>
                                                        <Link href={`/tickets/${t.id}/edit`} className="btn btn-outline-primary" title="Edit">
                                                            <i className="fa-solid fa-pen-to-square"></i>
                                                        </Link>
                                                        <Link href={`/tickets/${t.id}/print`} className="btn btn-outline-secondary" title="Print">
                                                            <i className="fa-solid fa-print"></i>
                                                        </Link>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr>
                                            <td colSpan="7" className="text-center py-5 text-muted">No tickets found.</td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Pagination */}
                {tickets.links && tickets.links.length > 3 && (
                    <div className="d-flex justify-content-center mt-4">
                        <ul className="pagination pagination-sm">
                            {tickets.links.map((link, idx) => (
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
