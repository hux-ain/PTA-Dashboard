import React, { useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router } from '@inertiajs/react';

export default function UsersIndex({ users = { data: [] }, roles = [], stations = [], summary = {} }) {
    const [search, setSearch] = useState('');
    const [roleId, setRoleId] = useState('');
    const [stationId, setStationId] = useState('');

    const handleFilter = (e) => {
        e.preventDefault();
        router.get('/users', { search, role_id: roleId, station_id: stationId }, { preserveState: true });
    };

    const handleDelete = (id, name) => {
        if (confirm(`Are you sure you want to delete user "${name}"?`)) {
            router.delete(`/users/${id}/destroy`);
        }
    };

    return (
        <AuthenticatedLayout title="User Management">
            <Head title="User Management" />

            <div className="container-fluid py-2">
                <div className="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h4 className="fw-bold mb-1">User Management</h4>
                        <small className="text-muted">Manage system users, roles, station assignments, and access control.</small>
                    </div>
                    <Link href="/account/create" className="btn btn-warning text-dark fw-bold btn-sm">
                        <i className="fa-solid fa-user-plus me-2"></i>Create New User
                    </Link>
                </div>

                {/* Summary Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Users</div>
                            <div className="fw-bold fs-4">{summary.total || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Active Users</div>
                            <div className="fw-bold fs-4">{summary.active || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-danger text-white">
                            <div className="small">Inactive Users</div>
                            <div className="fw-bold fs-4">{summary.inactive || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-info text-dark">
                            <div className="small">Admins</div>
                            <div className="fw-bold fs-4">{summary.admins || 0}</div>
                        </div>
                    </div>
                </div>

                {/* Filters */}
                <div className="card border-0 shadow-sm mb-4">
                    <div className="card-body">
                        <form onSubmit={handleFilter} className="row g-3 align-items-end">
                            <div className="col-md-4">
                                <input
                                    type="text"
                                    className="form-control form-control-sm"
                                    placeholder="Search name, email, username..."
                                    value={search}
                                    onChange={(e) => setSearch(e.target.value)}
                                />
                            </div>
                            <div className="col-md-3">
                                <select className="form-select form-select-sm" value={roleId} onChange={(e) => setRoleId(e.target.value)}>
                                    <option value="">All Roles</option>
                                    {roles.map(r => <option key={r.id} value={r.id}>{r.role_name}</option>)}
                                </select>
                            </div>
                            <div className="col-md-3">
                                <select className="form-select form-select-sm" value={stationId} onChange={(e) => setStationId(e.target.value)}>
                                    <option value="">All Stations</option>
                                    {stations.map(st => <option key={st.id} value={st.id}>{st.name}</option>)}
                                </select>
                            </div>
                            <div className="col-md-2 d-flex gap-2">
                                <button type="submit" className="btn btn-primary btn-sm w-100">Filter</button>
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
                                        <th className="ps-3 py-3">Full Name</th>
                                        <th className="py-3">Email / Username</th>
                                        <th className="py-3">Role</th>
                                        <th className="py-3">Station</th>
                                        <th className="py-3">Status</th>
                                        <th className="pe-3 py-3 text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {users.data && users.data.length > 0 ? (
                                        users.data.map(u => (
                                            <tr key={u.id}>
                                                <td className="ps-3 fw-bold">{u.full_name || u.username}</td>
                                                <td>{u.email}</td>
                                                <td><span className="badge bg-dark">{u.role?.role_name || 'N/A'}</span></td>
                                                <td><span className="badge bg-secondary">{u.station?.name || 'All Stations'}</span></td>
                                                <td>
                                                    <span className={`badge ${u.is_active ? 'bg-success' : 'bg-danger'}`}>
                                                        {u.is_active ? 'Active' : 'Inactive'}
                                                    </span>
                                                </td>
                                                <td className="pe-3 text-end">
                                                    <div className="btn-group btn-group-sm">
                                                        <Link href={`/users/${u.id}/edit`} className="btn btn-outline-primary" title="Edit">
                                                            <i className="fa-solid fa-user-pen"></i>
                                                        </Link>
                                                        <button onClick={() => handleDelete(u.id, u.full_name || u.username)} className="btn btn-outline-danger" title="Delete">
                                                            <i className="fa-solid fa-trash-can"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr><td colSpan="6" className="text-center py-5 text-muted">No users found.</td></tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Pagination */}
                {users.links && users.links.length > 3 && (
                    <div className="d-flex justify-content-center mt-4">
                        <ul className="pagination pagination-sm">
                            {users.links.map((link, idx) => (
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
