import React from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function ActivityIndex({ onlineUsers = [], loginLogs = [], activityLogs = [], summary = {} }) {
    return (
        <AuthenticatedLayout title="Activity & Audit Logs">
            <Head title="Activity & Audit Logs" />

            <div className="container-fluid py-2">
                <div className="mb-4">
                    <h4 className="fw-bold mb-1">Activity & Audit Logs</h4>
                    <small className="text-muted">Real-time user logins, system actions, and online presence tracking.</small>
                </div>

                {/* Stat Summary Cards */}
                <div className="row g-3 mb-4">
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-success text-white">
                            <div className="small">Online Users</div>
                            <div className="fw-bold fs-4">{summary.online || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-light">
                            <div className="text-muted small">Total Users</div>
                            <div className="fw-bold fs-4">{summary.total_users || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-info text-dark">
                            <div className="small">Logins Today</div>
                            <div className="fw-bold fs-4">{summary.logins_today || 0}</div>
                        </div>
                    </div>
                    <div className="col-3">
                        <div className="card border-0 shadow-sm text-center py-2 bg-warning text-dark">
                            <div className="small">Actions Today</div>
                            <div className="fw-bold fs-4">{summary.actions_today || 0}</div>
                        </div>
                    </div>
                </div>

                {/* Online Users List */}
                <div className="card border-0 shadow-sm mb-4">
                    <div className="card-header bg-dark text-white fw-bold py-3">
                        <i className="fa-solid fa-users-between-lines me-2 text-success"></i>Currently Online Users
                    </div>
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-2">User</th>
                                        <th className="py-2">Role</th>
                                        <th className="py-2">Last Activity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {onlineUsers.length > 0 ? (
                                        onlineUsers.map(u => (
                                            <tr key={u.id}>
                                                <td className="ps-3 fw-bold">{u.full_name || u.username}</td>
                                                <td><span className="badge bg-secondary">{u.role?.role_name || 'N/A'}</span></td>
                                                <td><span className="badge bg-success">Active Now</span></td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr><td colSpan="3" className="text-center py-3 text-muted">No active users online right now.</td></tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                {/* Audit Action Logs */}
                <div className="card border-0 shadow-sm">
                    <div className="card-header bg-secondary text-white fw-bold py-3">
                        <i className="fa-solid fa-list-check me-2"></i>System Action Audit Trail
                    </div>
                    <div className="card-body p-0">
                        <div className="table-responsive">
                            <table className="table table-hover align-middle mb-0" style={{ fontSize: '0.88rem' }}>
                                <thead className="bg-light">
                                    <tr>
                                        <th className="ps-3 py-3">Timestamp</th>
                                        <th className="py-3">User</th>
                                        <th className="py-3">Module</th>
                                        <th className="py-3">Action</th>
                                        <th className="py-3">Details</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {activityLogs.length > 0 ? (
                                        activityLogs.map(log => (
                                            <tr key={log.id}>
                                                <td className="ps-3 text-muted small">{new Date(log.created_at).toLocaleString()}</td>
                                                <td className="fw-bold">{log.user?.full_name || log.user?.username || 'System'}</td>
                                                <td><span className="badge bg-dark">{log.module}</span></td>
                                                <td><span className="badge bg-info text-dark">{log.action}</span></td>
                                                <td className="small">{log.description || log.details || '—'}</td>
                                            </tr>
                                        ))
                                    ) : (
                                        <tr><td colSpan="5" className="text-center py-4 text-muted">No audit logs recorded yet.</td></tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
