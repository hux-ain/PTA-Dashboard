import React, { useEffect, useRef, useState } from 'react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link } from '@inertiajs/react';
import { Chart, registerables } from 'chart.js';

Chart.register(...registerables);

export default function Home(props) {
    const {
        totalCustomers = 0,
        totalConnections = 0,
        rfCustomers = 0,
        fiberCustomers = 0,
        ethernetCustomers = 0,
        totalInventories = 0,
        verifiedInventories = 0,
        unverifiedInventories = 0,
        totalTickets = 0,
        openTickets = 0,
        inProgressTickets = 0,
        closedTickets = 0,
        surveysThisYear = 0,
        totalSurveys = 0,
        surveysByFeasibility = {},
        surveysByConnectionThisYear = {},
        stationWiseStats = [],
        customerStatusData = [0, 0, 0, 0],
        lastTerminatedCustomers = [],
        topBandwidthCustomers = [],
        showCustomers = true,
        showInventories = true,
        showTickets = true,
        showSurveys = true,
        currentYear = new Date().getFullYear(),
        panelTitle = 'Dashboard',
        timeLabels = [],
        timeValues = [],
        ticketStatus = { Open: 0, Closed: 0, 'In Progress': 0 }
    } = props;

    const [graphPeriod, setGraphPeriod] = useState('current_year');
    const [graphStatus, setGraphStatus] = useState('Active');
    const [chartLabels, setChartLabels] = useState(timeLabels);
    const [chartValues, setChartValues] = useState(timeValues);

    const customersChartRef = useRef(null);
    const customersChartInstance = useRef(null);
    const statusChartRef = useRef(null);
    const statusChartInstance = useRef(null);

    // Fetch dynamic graph data when period or status changes
    useEffect(() => {
        fetch(`/dashboard/graph-data?type=time&period=${graphPeriod}&status=${graphStatus}`)
            .then(res => res.json())
            .then(data => {
                setChartLabels(data.labels || []);
                setChartValues(data.values || []);
            })
            .catch(err => console.error('Failed to load graph data:', err));
    }, [graphPeriod, graphStatus]);

    // Render / update Customers Analytics Line/Bar Chart
    useEffect(() => {
        if (!customersChartRef.current) return;
        if (customersChartInstance.current) {
            customersChartInstance.current.destroy();
        }

        const ctx = customersChartRef.current.getContext('2d');
        let borderColor = '#ebb41e';
        let backgroundColor = 'rgba(235, 180, 30, 0.2)';
        if (graphStatus === 'Terminated') {
            borderColor = '#dc3545';
            backgroundColor = 'rgba(220, 53, 69, 0.2)';
        } else if (graphStatus === 'All') {
            borderColor = '#3b82f6';
            backgroundColor = 'rgba(59, 130, 246, 0.2)';
        }

        const isLine = chartLabels.length > 12;
        customersChartInstance.current = new Chart(ctx, {
            type: isLine ? 'line' : 'bar',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: `Customers (${graphStatus})`,
                    data: chartValues,
                    borderColor,
                    backgroundColor: isLine
                        ? (borderColor === '#ebb41e' ? 'rgba(235, 180, 30, 0.08)' : (borderColor === '#dc3545' ? 'rgba(220, 53, 69, 0.08)' : 'rgba(59, 130, 246, 0.08)'))
                        : (borderColor === '#ebb41e' ? 'rgba(235, 180, 30, 0.7)' : (borderColor === '#dc3545' ? 'rgba(220, 53, 69, 0.7)' : 'rgba(59, 130, 246, 0.7)')),
                    borderWidth: 2,
                    fill: isLine ? false : true,
                    tension: 0.4,
                    pointRadius: isLine ? 3 : 0,
                    pointBackgroundColor: borderColor
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false },
                    tooltip: {
                        mode: 'index',
                        intersect: false,
                        callbacks: {
                            label: (ctx) => `${ctx.parsed.y} customers`
                        }
                    }
                },
                scales: {
                    x: { grid: { display: false }, ticks: { font: { size: 10 } } },
                    y: { grid: { color: '#f0f0f0' }, ticks: { font: { size: 11 } }, beginAtZero: true }
                }
            }
        });

        return () => {
            if (customersChartInstance.current) customersChartInstance.current.destroy();
        };
    }, [chartLabels, chartValues, graphStatus]);

    // Render Doughnut Chart for Customer Status Overview
    useEffect(() => {
        if (!statusChartRef.current) return;
        if (statusChartInstance.current) {
            statusChartInstance.current.destroy();
        }

        const ctx = statusChartRef.current.getContext('2d');
        statusChartInstance.current = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Active', 'Suspended', 'Temp Off', 'Terminated'],
                datasets: [{
                    data: customerStatusData.length ? customerStatusData : [0, 0, 0, 0],
                    backgroundColor: ['#28a745', '#ffc107', '#17a2b8', '#dc3545']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });

        return () => {
            if (statusChartInstance.current) statusChartInstance.current.destroy();
        };
    }, [customerStatusData]);

    return (
        <AuthenticatedLayout title={panelTitle}>
            <Head title={panelTitle} />

            <div className="dashboard-wrapper">
                {/* Top Metrics Cards Row */}
                <div className="stat-cards-row">
                    {showCustomers && (
                        <div className="dash-card accent-yellow">
                            <div className="card-label text-uppercase fw-bold">Customers & Connections</div>
                            <div className="d-flex justify-content-between align-items-start mt-2">
                                <div className="text-start">
                                    <div className="card-big-number">{totalCustomers}</div>
                                    <small className="text-muted">Total Customers</small>
                                    <div className="mt-3">
                                        <div className="card-big-number" style={{ fontSize: '1.8rem', color: '#000' }}>
                                            {totalConnections}
                                        </div>
                                        <small className="text-muted">Total Connections (Links)</small>
                                    </div>
                                </div>
                                <div className="text-end">
                                    <div style={{ fontSize: '0.9rem' }}><strong>RF:</strong> {rfCustomers}</div>
                                    <div style={{ fontSize: '0.9rem' }}><strong>Fiber:</strong> {fiberCustomers}</div>
                                    <div style={{ fontSize: '0.9rem' }}><strong>Ethernet:</strong> {ethernetCustomers}</div>
                                </div>
                            </div>
                        </div>
                    )}

                    {showInventories && (
                        <div className="dash-card accent-yellow">
                            <div className="card-label text-uppercase fw-bold">Inventory</div>
                            <div className="d-flex justify-content-between align-items-start mt-2">
                                <div className="text-start">
                                    <div className="card-big-number">{totalInventories}</div>
                                    <small className="text-muted">Total Items</small>
                                </div>
                                <div className="text-end">
                                    <div style={{ fontSize: '0.9rem' }}><strong>Verified:</strong> {verifiedInventories}</div>
                                    <div style={{ fontSize: '0.9rem' }}><strong>Unverified:</strong> {unverifiedInventories}</div>
                                </div>
                            </div>
                        </div>
                    )}

                    {showTickets && (
                        <div className="dash-card accent-yellow">
                            <div className="card-label text-uppercase fw-bold">Tickets</div>
                            <div className="d-flex justify-content-between align-items-start mt-2">
                                <div className="text-start">
                                    <div className="card-big-number">{totalTickets}</div>
                                    <small className="text-muted">Total</small>
                                </div>
                                <div className="text-end">
                                    <div style={{ fontSize: '0.85rem' }}>Open: <strong>{openTickets}</strong></div>
                                    <div style={{ fontSize: '0.85rem' }}>In Progress: <strong>{inProgressTickets}</strong></div>
                                    <div style={{ fontSize: '0.85rem' }}>Closed: <strong>{closedTickets}</strong></div>
                                </div>
                            </div>
                        </div>
                    )}

                    {showSurveys && (
                        <div className="dash-card accent-yellow">
                            <div className="card-label text-uppercase fw-bold">Surveys ({currentYear})</div>
                            <div className="d-flex justify-content-between align-items-start mt-2">
                                <div className="text-start">
                                    <div className="card-big-number">{surveysThisYear || totalSurveys}</div>
                                    <small className="text-muted">Total</small>
                                </div>
                                <div className="text-end">
                                    <div style={{ fontSize: '0.85rem' }}>Feasible: <strong>{surveysByFeasibility['Feasible'] || 0}</strong></div>
                                    <div style={{ fontSize: '0.85rem' }}>Non-Feasible: <strong>{surveysByFeasibility['Non-Feasible'] || 0}</strong></div>
                                    <div style={{ fontSize: '0.85rem' }}>RF: <strong>{surveysByConnectionThisYear['Radio Frequency'] || 0}</strong></div>
                                    <div style={{ fontSize: '0.85rem' }}>Fiber: <strong>{surveysByConnectionThisYear['Fiber'] || 0}</strong></div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* Customers Analytics Graph */}
                {showCustomers && (
                    <div className="card border-0 shadow-sm mb-4 mt-4">
                        <div className="card-header" style={{ background: 'var(--sidebar-bg)', color: 'var(--accent)', padding: '14px 16px' }}>
                            <div className="d-flex justify-content-between align-items-center flex-wrap gap-2">
                                <h6 className="mb-0 fw-bold" style={{ fontSize: '0.95rem' }}>
                                    <i className="fa-solid fa-chart-line me-2"></i>Customers Analytics
                                </h6>
                                <div className="d-flex align-items-center gap-3 flex-wrap">
                                    <select
                                        className="form-select form-select-sm"
                                        style={{ width: 'auto' }}
                                        value={graphPeriod}
                                        onChange={(e) => setGraphPeriod(e.target.value)}
                                    >
                                        <option value="current_month">Current Month</option>
                                        <option value="last_month">Last Month</option>
                                        <option value="current_year">Current Year</option>
                                        <option value="last_year">Last Year</option>
                                        <option value="last_10_years">Last 10 Years</option>
                                    </select>
                                    <select
                                        className="form-select form-select-sm"
                                        style={{ width: 'auto' }}
                                        value={graphStatus}
                                        onChange={(e) => setGraphStatus(e.target.value)}
                                    >
                                        <option value="Active">Active</option>
                                        <option value="Terminated">Terminated</option>
                                        <option value="All">All Status</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div className="card-body" style={{ padding: '16px' }}>
                            <div className="chart-container-line" style={{ height: '350px', position: 'relative' }}>
                                <canvas ref={customersChartRef}></canvas>
                            </div>
                        </div>
                    </div>
                )}

                {/* Station Wise Customers Table */}
                <div className="card border-0 shadow-sm mb-4">
                    <div className="card-header" style={{ background: 'var(--sidebar-bg)', color: 'var(--accent)', padding: '14px 18px' }}>
                        <h6 className="mb-0 fw-bold" style={{ fontSize: '0.95rem' }}>
                            <i className="fa-solid fa-broadcast-tower me-2"></i>Station Wise Customers
                        </h6>
                    </div>
                    <div className="card-body p-0">
                        {stationWiseStats.length > 0 ? (
                            <div className="table-responsive" style={{ maxHeight: '400px', overflowY: 'auto' }}>
                                <table className="table table-hover mb-0" style={{ fontSize: '0.9rem' }}>
                                    <thead style={{ background: '#f8f9fa', position: 'sticky', top: 0, zIndex: 10 }}>
                                        <tr>
                                            <th className="ps-4 py-3" style={{ width: '25%' }}>Station Name</th>
                                            <th className="py-3" style={{ width: '18%' }}>Total Customers</th>
                                            <th className="py-3" style={{ width: '18%' }}>Fiber</th>
                                            <th className="py-3" style={{ width: '18%' }}>RF</th>
                                            <th className="pe-4 py-3" style={{ width: '21%' }}>Ethernet</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {stationWiseStats.map((st) => (
                                            <tr key={st.id || st.name}>
                                                <td className="ps-4 py-3 fw-semibold">{st.name}</td>
                                                <td className="py-3 fw-bold" style={{ color: 'var(--accent)' }}>{st.total_customers}</td>
                                                <td className="py-3 fw-semibold text-primary">{st.fiber_count}</td>
                                                <td className="py-3 fw-semibold text-warning">{st.rf_count}</td>
                                                <td className="pe-4 py-3 fw-semibold text-success">{st.ethernet_count}</td>
                                            </tr>
                                        ))}
                                    </tbody>
                                </table>
                            </div>
                        ) : (
                            <div className="text-center py-5">
                                <i className="fa-solid fa-building-circle-xmark text-muted mb-3" style={{ fontSize: '3rem' }}></i>
                                <h5 className="text-muted mb-1">No Stations Found</h5>
                                <p className="text-muted small mb-0">There are no stations with active customers right now.</p>
                            </div>
                        )}
                    </div>
                </div>

                {/* Status Doughnut & Last Terminated Customers */}
                <div className="row g-4 mb-4">
                    <div className="col-lg-5">
                        <div className="card border-0 shadow-sm h-100">
                            <div className="card-header bg-dark text-white fw-bold py-3">
                                Customer Status Overview
                            </div>
                            <div className="card-body p-4" style={{ height: '300px' }}>
                                <canvas ref={statusChartRef}></canvas>
                            </div>
                        </div>
                    </div>

                    <div className="col-lg-7">
                        <div className="card border-0 shadow-sm h-100">
                            <div className="card-header bg-danger text-white fw-bold py-3">
                                <i className="fa-solid fa-user-slash me-2"></i>Recently Terminated Customers
                            </div>
                            <div className="card-body p-0">
                                {lastTerminatedCustomers.length > 0 ? (
                                    <div className="table-responsive">
                                        <table className="table table-hover mb-0" style={{ fontSize: '0.85rem' }}>
                                            <thead>
                                                <tr>
                                                    <th className="ps-3 py-2">Customer</th>
                                                    <th className="py-2">Station</th>
                                                    <th className="py-2">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {lastTerminatedCustomers.map((c) => (
                                                    <tr key={c.id}>
                                                        <td className="ps-3 py-2 fw-semibold">
                                                            <Link href={`/customers/${c.id}/edit`} className="text-decoration-none text-dark">
                                                                {c.company_name || c.name}
                                                            </Link>
                                                        </td>
                                                        <td className="py-2">{c.station?.name || 'N/A'}</td>
                                                        <td className="py-2"><span className="badge bg-danger">Terminated</span></td>
                                                    </tr>
                                                ))}
                                            </tbody>
                                        </table>
                                    </div>
                                ) : (
                                    <div className="p-4 text-center text-muted">No recent terminated customers found.</div>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
