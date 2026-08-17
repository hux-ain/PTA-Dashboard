<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Sign In — Gerrys.net Portal</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
</head>
<body class="login-body">

    {{-- ===== LEFT PANEL ===== --}}
    <div class="left-panel">
        <div class="logo-wrap">
            <div style="display:flex; flex-direction:column; align-items:center; gap:8px;">
                <img src="{{ asset('git_logo.png') }}" alt="Gerrys Logo" style="width:110px; height:auto; border-radius:8px;">
                <div style="font-weight:800; color:var(--sidebar-bg); font-size:0.85rem; letter-spacing:0.5px;">GERRYS</div>
            </div>
        </div>

        <h2>Gerrys.net<br><span>IT Systems</span></h2>
        <p>Gerrys IT Dashboard — secure access for authorized personnel.</p>

        <div class="feature-list">
            <div class="feature-item">
                <div class="feature-icon"><i class="fa fa-users"></i></div>
                <div class="feature-text">Subscriber Management</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fa fa-circle-exclamation"></i></div>
                <div class="feature-text">Complaint Tracking</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fa fa-network-wired"></i></div>
                <div class="feature-text">Network Infrastructure</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon"><i class="fa fa-chart-line"></i></div>
                <div class="feature-text">Data Import & Analytics</div>
            </div>
        </div>
    </div>

    {{-- ===== RIGHT PANEL ===== --}}
    <div class="right-panel">
        <div class="login-card">

            <div class="text-center mb-4">
                <div style="display:flex; align-items:center; justify-content:center; gap:10px;">
                    <img src="{{ asset('git_logo.png') }}" alt="Gerrys Logo" style="width:70px; height:auto; border-radius:8px;">
                    <div style="text-align:left;">
                        <div style="font-weight:800; color:var(--sidebar-bg); font-size:1rem; letter-spacing:0.3px;">Gerrys.net</div>
                        <div style="font-size:0.7rem; color:#9ca3af; font-weight:600;">IT Systems Portal</div>
                    </div>
                </div>
            </div>

            <h3>Welcome Back</h3>
            <p class="subtitle">Sign in to your Gerrys IT account</p>

            {{-- Main Error Alert --}}
            @if($errors->has('email') || $errors->has('password') || session('error'))
            <div class="alert-custom">
                <i class="fa fa-circle-exclamation"></i>
                <span>Invalid email or password. Please try again.</span>
            </div>
            @endif

            {{-- Success --}}
            @if(session('status'))
            <div style="background:#f0fdf4; border:1px solid #bbf7d0; border-radius:10px; padding:12px 16px; font-size:0.8rem; color:#16a34a; margin-bottom:20px;">
                <i class="fa fa-circle-check me-1"></i> {{ session('status') }}
            </div>
            @endif

            <form method="POST" action="{{ route('login.submit') }}" id="loginForm">
                @csrf

                {{-- Email --}}
                <div class="input-group-custom">
                    <label for="email">Email Address</label>
                    <div class="input-wrap">
                        <i class="fa fa-envelope input-icon"></i>
                        <input type="email"
                               id="email"
                               name="email"
                               value="{{ old('email') }}"
                               placeholder="yourname@company.com"
                               class="{{ $errors->has('email') ? 'is-invalid' : '' }}"
                               autocomplete="email"
                               required>
                    </div>
                </div>

                {{-- Password --}}
                <div class="input-group-custom">
                    <label for="password">Password</label>
                    <div class="input-wrap">
                        <i class="fa fa-lock input-icon"></i>
                        <input type="password"
                               id="password"
                               name="password"
                               placeholder="Enter your password"
                               class="{{ $errors->has('password') ? 'is-invalid' : '' }}"
                               autocomplete="current-password"
                               required>
                        <button type="button" class="toggle-pw" onclick="togglePassword()" id="toggleBtn">
                            <i class="fa fa-eye" id="eyeIcon"></i>
                        </button>
                    </div>
                </div>

                {{-- Remember Me --}}
                <div class="remember-row">
                    <label>
                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
                        Remember me
                    </label>
                </div>

                {{-- Submit --}}
                <button type="submit" class="btn-login" id="submitBtn">
                    <span id="btnText"><i class="fa fa-right-to-bracket me-2"></i>Sign In</span>
                    <div class="spinner" id="spinner"></div>
                </button>

            </form>

            <div class="login-footer">
                <i class="fa fa-lock me-1"></i>
                Restricted to <span>authorized Gerrys users</span> only
            </div>

        </div>
    </div>

<script>
    function togglePassword() {
        const pw  = document.getElementById('password');
        const eye = document.getElementById('eyeIcon');
        if (pw.type === 'password') {
            pw.type = 'text';
            eye.className = 'fa fa-eye-slash';
        } else {
            pw.type = 'password';
            eye.className = 'fa fa-eye';
        }
    }

    document.getElementById('loginForm').addEventListener('submit', function() {
        const btnText = document.getElementById('btnText');
        const spinner = document.getElementById('spinner');
        const submitBtn = document.getElementById('submitBtn');
        
        btnText.style.display = 'none';
        spinner.style.display = 'block';
        submitBtn.disabled = true;
    });
</script>

</body>
</html>
