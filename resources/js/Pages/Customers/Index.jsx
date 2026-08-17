import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router } from '@inertiajs/react';

export default function CustomersIndex(props) {
    const {
        customers = { data: [], links: [], current_page: 1, last_page: 1, total: 0 },
        stations = [],
        pops = [],
        vendors = [],
        connectionTypes = [],
        summary = { total: 0, active: 0, terminated: 0, suspended: 0, temp_off: 0 },
        filters = {}
    } = props;

    const [search, setSearch] = useState(filters.search || '');
    const [stationId, setStationId] = useState(filters.station_id || '');
    const [popId, setPopId] = useState(filters.pop_id || '');
    const [status, setStatus] = useState(filters.status || '');

    const handleSearchSubmit = (e) => {
        e.preventDefault();
        router.get('/customers', {
            search,
            station_id: stationId,
            pop_id: popId,
            status
        }, { preserveState: true });
    };

    const handleDelete = (id, name) => {
        if (confirm(`Are you sure you want to delete customer "${name}"?`)) {
            router.delete(`/customers/${id}`);
        }
    };

    const getStatusBadge = (linkStatus) => {
        switch (linkStatus) {
            case 'Active': return <span className="badge bg-success">Active</span>;
            case 'Terminated': return <span className="badge bg-danger">Terminated</span>;
            case 'Suspended': return <span className="badge bg-warning text-dark">Suspended</span>;
            case 'Temp Off': return <span className="badge bg-info text-dark">Temp Off</span>;
            default: return <span className="badge bg-secondary">{linkStatus || 'N/A'}</span>;
        }
    };

    return (
        <AuthenticatedLayout title="Customers Info">
            <Head title="Customers Info" />

            <div className="container-fluid py-2">
                {/* Header Action Bar */}
                <div className="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h4 className="fw-bold mb-1">Customers Directory</h4>
                        <small className="text-muted">Manage all customer connections, locations, and details.</small>
                    </div>
                    <div className="d-flex gap-2">
                        <Link href="/customers/export-csv" className="btn btn-outline-secondary btn-sm">
                            <i className="fa-solid fa-file-csv me-2"></i>Export CSV
                        </Link>
                        <Link href="/customers/create" className="btn btn-warning text-dark fw-bold btn-sm">
                            <i className="fa-solid fa-user-plus me-2"></i>Add New Customer
                        </Link>
                    </div>
                </div>

                {/* Summary Stat Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-6 col-md-2">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Customers</div>
                            <div className="fw-bold fs-4">{summary.total || 0}</div>
                        </div>
                    </div>
                    <div className="col-6 col-md-2">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Active</div>
                            <div className="fw-bold fs-4">{summary.active || 0}</div>
                        </div>
                    </div>
                    <div className="col-6 col-md-2">
                        <div className="card border-0 shadow-sm text-center py-2 bg-danger text-white">
                            <div className="small">Terminated</div>
                            <div className="fw-bold fs-4">{summary.terminated || 0}</div>
                        </div>
                    </div>
                    <div className="col-6 col-md-2">
                        <div className="card border-0 shadow-sm text-center py-2 bg-warning text-dark">
                            <div className="small">Suspended</div>
                            <div className="fw-bold fs-4">{summary.suspended || 0}</div>
                        </div>
                    </div>
                    <div className="col-6 col-md-2">
                        <div className="card border-0 shadow-sm text-center py-2 bg-info text-dark">
                            <div className="small">Temp Off</div>
                            <div className="fw-bold fs-4">{summary.temp_off || 0}</div>
                        </div>
                    </div>
                </div>

                {/* Filters */}
                <div className="card border-0 shadow-sm mb-4">
                    <div className="card-body">
                        <form onSubmit={handleSearchSubmit} className="row g-3 align-items-end">
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Search</label>
                                <input
                                    type="text"
                                    className="form-control form-control-sm"
                                    placeholder="Name, Company, IP, Location..."
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Station</label>
                                <select
                                    className="form-select form-select-sm"
                                    value={stationId}
                                    onChange={(e) => setStationId(e.target.value)}
                                >
                                    <option value="">All Stations</option>
                                    {stations.map(s => <option key={s.id} value={s.id}>{s.name}</option>)}
                                </select>
                            </div>
                            <div className="col-md-3">
                                <label className="form-label small fw-bold">Status</label>
                                <select
                                    className="form-select form-select-sm"
                                    value={status}
                                    onChange={(e) => setStatus(e.target.value)}
                                >
                                    <option value="">All Statuses</option>
                                    <option value="Active">Active</option>
                                    <option value="Terminated">Terminated</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Temp Off">Temp Off</option>
                                </select>
                            </div>
                            <div className="col-md-3 d-flex gap-2">
                                <button type="submit" className="btn btn-primary btn-sm w-100">
                                    <i className="fa-solid fa-filter me-1"></i>Filter
                                </button>
                                <button
                                    type="button"
                                    className="btn btn-light btn-sm border"
                                    onClick={() => {
                                        setSearch(''); setStationId(''); setPopId(''); setStatus('');
                                        router.get('/customers');
                                    }}
                                >
                                    Reset
                                </button>
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
                                        <th className="ps-3 py-3">#</th>
                                        <th className="py-3">Customer Name</th>
                                        <th className="py-3">Company Name</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Connections / Links</th>
                                        <th className="pe-3 py-3 text-end">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {customers.data && customers.data.length > 0 ? (
                                        customers.data.map((c, index) => (
                                            <tr key={c.id}>
                                                <td className="ps-3 fw-bold text-muted">{(customers.current_page - 1) * 15 + index + 1}</td>
                                                <td className="fw-bold">{c.customer_name}</td>
                                                <td>{c.company_name || 'N/A'}</td>
                                                <td><span className="badge bg-secondary">{c.station?.name || 'N/A'}</span></td>
                                                <td>
                                                    {c.links && c.links.length > 0 ? (
                                                        c.links.map((link) => (
                                                            <div key={link.id} className="small mb-1">
                                                                <span className="fw-semibold me-2">{link.bandwidth_mbps} Mbps</span>
                                                                {getStatusBadge(link.status)}
                                                                {link.location && <small className="text-muted ms-2">({link.location})</small>}
                                                            </div>
                                                        ))
                                                    ) : (
                                                        <span className="text-muted small">No links recorded</span>
                                                    )}
                                                </td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <Link href={`/customers/${c.id}/history`} className="btn btn-outline-info" title="History">
                                                            <i className="fa-solid fa-clock-rotate-left"></i>
                                                        </Link>
                                                        <Link href={`/customers/${c.id}/edit`} className="btn btn-outline-primary" title="Edit">
                                                            <i className="fa-solid fa-pen-to-square"></i>
                                                        </Link>
                                                        <Link href={`/customers/${c.id}/print`} className="btn btn-outline-secondary" title="Print">
                                                            <i className="fa-solid fa-print"></i>
                                                        </Link>
                                                        <button onClick={() => handleDelete(c.id, c.customer_name)} className="btn btn-outline-danger" title="Delete">
                                                            <i className="fa-solid fa-trash-can"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr>
                                            <td colSpan="6" className="text-center py-5 text-muted">
                                                No customers found matching your criteria.
                                            </td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Pagination */}
                {customers.links && customers.links.length > 3 && (
                    <div className="d-flex justify-content-center mt-4">
                        <nav>
                            <ul className="pagination pagination-sm">
                                {customers.links.map((link, idx) => (
                                    <li key={idx} className={`page-item ${link.active ? 'active' : ''} ${!link.url ? 'disabled' : ''}`}>
                                        <Link
                                            href={link.url || '#'}
                                            className="page-link"
                                            dangerouslySetInnerHTML={{ __html: link.label }}
                                        />
                                    </li>
                                ))}
                            </ul>
                        </nav>
                    </div>
                )}
            </div>
        </AuthenticatedLayout>
    );
}
