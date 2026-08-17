import React, { useState } from 'react';
import { Link, usePage, router } from '@inertiajs/react';

export default function AuthenticatedLayout({ title, children }) {
    const { auth, flash } = usePage().props;
    const user = auth?.user || {};
    const can = auth?.can || {};
    const url = usePage().url;

    const [isCollapsed, setIsCollapsed] = useState(() => {
        return localStorage.getItem('sidebarCollapsed') === 'true';
    });
    const [isMobileActive, setIsMobileActive] = useState(false);
    const [profileDropdownOpen, setProfileDropdownOpen] = useState(false);

    const isSuperAdmin = user.isSuperAdmin || user.role_name === 'Super Admin';
    const isAdmin = user.isAdmin || user.role_name === 'Admin';

    // Show menu items if user has permission OR if flags are not set, default for Admin/SuperAdmin
    const canCustomers = can.customers !== undefined ? can.customers : true;
    const canTickets = can.tickets !== undefined ? can.tickets : true;
    const canSurveys = can.surveys !== undefined ? can.surveys : true;
    const canVendors = can.vendors !== undefined ? can.vendors : true;
    const canPops = can.pops !== undefined ? can.pops : true;
    const canInventory = can.inventories !== undefined ? can.inventories : true;
    const canUsers = can.users !== undefined ? can.users : isSuperAdmin;
    const canActivity = can.activity !== undefined ? can.activity : isSuperAdmin;

    const toggleSidebar = (e) => {
        e.preventDefault();
        if (window.innerWidth <= 991) {
            setIsMobileActive(!isMobileActive);
        } else {
            const nextState = !isCollapsed;
            setIsCollapsed(nextState);
            localStorage.setItem('sidebarCollapsed', nextState);
        }
    };

    const handleLogout = (e) => {
        e.preventDefault();
        router.post('/logout');
    };

    const isActive = (path) => {
        if (path === '/home' && (url === '/home' || url === '/')) return true;
        return url.startsWith(path);
    };

    return (
        <div className="layout-container" style={{ width: '100%', overflowX: 'hidden' }}>
            {/* Sidebar */}
            <div
                id="sidebar"
                className={`animate-in ${isCollapsed ? 'collapsed' : ''} ${isMobileActive ? 'active' : ''}`}
            >
                <div className="logo-section">
                    <img
                        src="https://www.gerrys.net/img/index/git_logo.png"
                        alt="Logo"
                        style={{ maxWidth: '100%', height: 'auto', display: 'block', margin: '0 auto' }}
                    />
                    <h5 className="logo-text mt-3 text-center">
                        {isSuperAdmin ? 'Super Admin' : isAdmin ? 'Admin Portal' : 'Employee Portal'}
                    </h5>
                </div>

                <nav className="mt-3">
                    <Link
                        href="/home"
                        className={`nav-link ${isActive('/home') ? 'active' : ''}`}
                    >
                        <i className="fa-solid fa-gauge-high"></i> <span>Dashboard</span>
                    </Link>

                    {canCustomers && (
                        <>
                            <Link
                                href="/customers/create"
                                className={`nav-link ${url === '/customers/create' ? 'active' : ''}`}
                            >
                                <i className="fa-solid fa-user-plus"></i> <span>Create Customer</span>
                            </Link>
                            <Link
                                href="/customers"
                                className={`nav-link ${url === '/customers' || (url.startsWith('/customers') && url !== '/customers/create') ? 'active' : ''}`}
                            >
                                <i className="fa-solid fa-address-card"></i> <span>Customers Info</span>
                            </Link>
                        </>
                    )}

                    {canTickets && (
                        <Link
                            href="/tickets"
                            className={`nav-link ${isActive('/tickets') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-ticket"></i> <span>Tickets</span>
                        </Link>
                    )}

                    {canSurveys && (
                        <Link
                            href="/surveys"
                            className={`nav-link ${isActive('/surveys') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-clipboard-list"></i> <span>Survey Reports</span>
                        </Link>
                    )}

                    {canVendors && (
                        <Link
                            href="/vendors"
                            className={`nav-link ${isActive('/vendors') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-handshake"></i> <span>Vendors</span>
                        </Link>
                    )}

                    {canPops && (
                        <Link
                            href="/pops"
                            className={`nav-link ${isActive('/pops') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-tower-broadcast"></i> <span>POPs</span>
                        </Link>
                    )}

                    {canUsers && (
                        <Link
                            href="/users"
                            className={`nav-link ${isActive('/users') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-users-gear"></i> <span>User Management</span>
                        </Link>
                    )}

                    {canActivity && (
                        <Link
                            href="/activity"
                            className={`nav-link ${isActive('/activity') ? 'active' : ''}`}
                        >
                            <i className="fa-solid fa-chart-line"></i> <span>Activity Log</span>
                        </Link>
                    )}

                    {canInventory && (
                        <Link
                            href="/inventories"
                            className={`nav-link ${isActive('/inventories') ? 'active' : ''}`}
                        >
                            <i className="fa fa-box"></i> <span>Inventory</span>
                        </Link>
                    )}
                </nav>
            </div>

            {/* Main Panel */}
            <div id="mainPanel" className={`${isCollapsed ? 'expanded' : ''}`}>
                {/* Header */}
                <div className="dashboard-header d-flex justify-content-between align-items-center px-4">
                    <div className="d-flex align-items-center gap-3">
                        <button className="btn btn-link p-0 text-dark" id="sidebarToggle" onClick={toggleSidebar}>
                            <i className="fa-solid fa-bars fs-4"></i>
                        </button>

                        <div className="d-none d-md-block">
                            <h4 className="mb-0 fw-bold text-dark">
                                <i className="fa-solid fa-layer-group me-2"></i>
                                {title || 'Portal'}
                            </h4>
                        </div>
                    </div>

                    <div className="d-flex align-items-center gap-4">
                        <div className="text-end d-none d-lg-block">
                            <small className="text-muted d-block" style={{ fontSize: '0.75rem' }}>Current Year</small>
                            <strong className="text-dark">Year: {new Date().getFullYear()}</strong>
                        </div>

                        <div className="dropdown profile-container position-relative">
                            <button
                                className="btn d-flex align-items-center text-decoration-none profile-trigger bg-light rounded-pill shadow-sm border-0"
                                style={{ padding: '4px 16px 4px 4px' }}
                                onClick={() => setProfileDropdownOpen(!profileDropdownOpen)}
                            >
                                <div
                                    className="avatar-emoji-placeholder rounded-circle"
                                    style={{ width: '36px', height: '36px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}
                                >
                                    <i className="fa-solid fa-user" style={{ fontSize: '1rem' }}></i>
                                </div>
                                <span className="ms-2 d-none d-sm-inline text-dark fw-bold" style={{ lineHeight: 1 }}>
                                    {user.name || 'User'}
                                </span>
                            </button>

                            {profileDropdownOpen && (
                                <ul
                                    className="dropdown-menu dropdown-menu-end shadow p-3 show position-absolute mt-2"
                                    style={{ right: 0, zIndex: 1002, width: '230px' }}
                                >
                                    <li className="mb-2 px-2">
                                        <div className="d-flex align-items-center">
                                            <div
                                                className="avatar-emoji-placeholder rounded-circle me-3"
                                                style={{ width: '40px', height: '40px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}
                                            >
                                                <i className="fa-solid fa-user" style={{ fontSize: '1.2rem' }}></i>
                                            </div>
                                            <div>
                                                <h6 className="mb-0 fw-bold" style={{ fontSize: '0.9rem' }}>{user.name}</h6>
                                                <small className="text-muted" style={{ fontSize: '0.75rem' }}>{user.email}</small>
                                            </div>
                                        </div>
                                    </li>

                                    <li><hr className="dropdown-divider" /></li>

                                    <li>
                                        <Link
                                            className="dropdown-item"
                                            href="/account/details"
                                            onClick={() => setProfileDropdownOpen(false)}
                                        >
                                            <i className="fa-solid fa-user me-2 text-secondary"></i> Account Details
                                        </Link>
                                    </li>
                                    <li>
                                        <Link
                                            className="dropdown-item"
                                            href="/account/change-password"
                                            onClick={() => setProfileDropdownOpen(false)}
                                        >
                                            <i className="fa-solid fa-gear me-2 text-secondary"></i> Change Password
                                        </Link>
                                    </li>

                                    <li><hr className="dropdown-divider" /></li>

                                    <li>
                                        <button
                                            className="dropdown-item text-danger border-0 bg-transparent"
                                            onClick={handleLogout}
                                        >
                                            <i className="fa-solid fa-right-from-bracket me-2"></i> Sign Out
                                        </button>
                                    </li>
                                </ul>
                            )}
                        </div>
                    </div>
                </div>

                {/* Flash Messages */}
                {flash?.success && (
                    <div className="mx-4 mt-3 alert alert-success alert-dismissible fade show" role="alert">
                        <i className="fa-solid fa-circle-check me-2"></i>
                        {flash.success}
                    </div>
                )}
                {flash?.error && (
                    <div className="mx-4 mt-3 alert alert-danger alert-dismissible fade show" role="alert">
                        <i className="fa-solid fa-triangle-exclamation me-2"></i>
                        {flash.error}
                    </div>
                )}

                {/* Main Content */}
                <div className="content-wrapper">
                    {children}
                </div>

                {/* Footer */}
                <footer className="footer text-center text-muted py-3">
                    <small>&copy; {new Date().getFullYear()} Gerry's Portal. All Rights Reserved.</small>
                </footer>
            </div>
        </div>
    );
}
