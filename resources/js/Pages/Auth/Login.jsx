import React, { useState } from 'react';
import { Head, useForm } from '@inertiajs/react';

export default function Login({ errors, status }) {
    const { data, setData, post, processing } = useForm({
        email: '',
        password: '',
        remember: false,
    });

    const [showPassword, setShowPassword] = useState(false);

    const handleSubmit = (e) => {
        e.preventDefault();
        post('/login');
    };

    return (
        <div className="login-body">
            <Head title="Sign In — Gerrys Portal" />

            {/* Left Panel */}
            <div className="left-panel">
                <div className="logo-wrap">
                    <img src="https://www.gerrys.net/img/index/git_logo.png" alt="Gerrys IT" />
                </div>

                <h2>Gerrys Information<br /><span>Technology Portal</span></h2>
                <p>Secure internal management system for authorized personnel only.</p>

                <div className="feature-list">
                    <div className="feature-item">
                        <div className="feature-icon"><i className="fa fa-users"></i></div>
                        <div className="feature-text">Customer & Connection Management</div>
                    </div>
                    <div className="feature-item">
                        <div className="feature-icon"><i className="fa fa-network-wired"></i></div>
                        <div className="feature-text">Ticket Management</div>
                    </div>
                    <div className="feature-item">
                        <div className="feature-icon"><i className="fa fa-shield-halved"></i></div>
                        <div className="feature-text">Role-Based Access Control</div>
                    </div>
                    <div className="feature-item">
                        <div className="feature-icon"><i className="fa fa-chart-line"></i></div>
                        <div className="feature-text">Activity & Login Tracking</div>
                    </div>
                </div>
            </div>

            {/* Right Panel */}
            <div className="right-panel">
                <div className="login-card">
                    <div className="text-center mb-4">
                        <img
                            src="https://www.gerrys.net/img/broadband/net_logo.jpg"
                            alt="Gerrys Network"
                            style={{ height: '60px', objectFit: 'contain' }}
                        />
                    </div>

                    <h3>Welcome Back</h3>
                    <p className="subtitle">Sign in to your Gerrys portal account</p>

                    {(errors?.email || errors?.password) && (
                        <div className="alert-custom">
                            <i className="fa fa-circle-exclamation"></i>
                            <span>Invalid email or password. Please try again.</span>
                        </div>
                    )}

                    {status && (
                        <div style={{ background: '#f0fdf4', border: '1px solid #bbf7d0', borderRadius: '10px', padding: '12px 16px', fontSize: '0.8rem', color: '#16a34a', marginBottom: '20px' }}>
                            <i className="fa fa-circle-check me-1"></i> {status}
                        </div>
                    )}

                    <form onSubmit={handleSubmit}>
                        {/* Email */}
                        <div className="input-group-custom">
                            <label htmlFor="email">Email Address</label>
                            <div className="input-wrap">
                                <i className="fa fa-envelope input-icon"></i>
                                <input
                                    type="email"
                                    id="email"
                                    value={data.email}
                                    onChange={(e) => setData('email', e.target.value)}
                                    placeholder="yourname@company.com"
                                    className={errors?.email ? 'is-invalid' : ''}
                                    autoComplete="email"
                                    required
                                />
                            </div>
                        </div>

                        {/* Password */}
                        <div className="input-group-custom">
                            <label htmlFor="password">Password</label>
                            <div className="input-wrap">
                                <i className="fa fa-lock input-icon"></i>
                                <input
                                    type={showPassword ? 'text' : 'password'}
                                    id="password"
                                    value={data.password}
                                    onChange={(e) => setData('password', e.target.value)}
                                    placeholder="Enter your password"
                                    className={errors?.password ? 'is-invalid' : ''}
                                    autoComplete="current-password"
                                    required
                                />
                                <button
                                    type="button"
                                    className="toggle-pw"
                                    onClick={() => setShowPassword(!showPassword)}
                                >
                                    <i className={`fa ${showPassword ? 'fa-eye-slash' : 'fa-eye'}`}></i>
                                </button>
                            </div>
                        </div>

                        {/* Remember Me */}
                        <div className="remember-row">
                            <label>
                                <input
                                    type="checkbox"
                                    checked={data.remember}
                                    onChange={(e) => setData('remember', e.target.checked)}
                                />
                                Remember me
                            </label>
                        </div>

                        {/* Submit */}
                        <button type="submit" className="btn-login" disabled={processing}>
                            {processing ? (
                                <div className="spinner" style={{ display: 'block', margin: '0 auto' }}></div>
                            ) : (
                                <span><i className="fa fa-right-to-bracket me-2"></i>Sign In</span>
                            )}
                        </button>
                    </form>

                    <div className="login-footer">
                        <i className="fa fa-lock me-1"></i>
                        Restricted to <span>gerrys.net</span> accounts only
                    </div>
                </div>
            </div>
        </div>
    );
}
