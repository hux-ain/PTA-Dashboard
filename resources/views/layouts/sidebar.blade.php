{{-- layouts/sidebar.blade.php --}}

<div id="sidebar">
    <div class="logo-section">
        <div style="display:flex; align-items:center; justify-content:center; height:70px; gap:10px;">
            <img src="{{ asset('git_logo.png') }}" alt="Gerrys Logo" style="width:150px; height:auto; border-radius:8px;">
        </div>
        <h5 class="logo-text mt-3 text-center">Gerrys IT</h5>
    </div>

    <nav class="mt-3">

        {{-- Dashboard - All users --}}
        <a href="{{ route('home') }}" class="nav-link {{ request()->is('home') ? 'active' : '' }}" data-title="Dashboard">
            <i class="fa-solid fa-gauge-high"></i> <span>Dashboard</span>
        </a>

        {{-- Show data tables only for Admin and Employee roles, NOT for super_admin --}}
        @if(auth()->check() && in_array(auth()->user()->role, ['Admin', 'Employee']))
            <a href="{{ route('subscribers.index') }}" class="nav-link {{ request()->is('subscribers*') ? 'active' : '' }}" data-title="Subscribers CIR">
                <i class="fa-solid fa-users"></i> <span>Subscribers CIR</span>
            </a>

            <a href="{{ route('p2p.index') }}" class="nav-link {{ request()->is('p2p*') ? 'active' : '' }}" data-title="P2P Subscribers">
                <i class="fa-solid fa-network-wired"></i> <span>P2P Subscribers</span>
            </a>

            <a href="{{ route('complaints.index') }}" class="nav-link {{ request()->is('complaints*') ? 'active' : '' }}" data-title="Complaint Report">
                <i class="fa-solid fa-circle-exclamation"></i> <span>Complaint Report</span>
            </a>

            <a href="{{ route('faults.index') }}" class="nav-link {{ request()->is('faults*') && !request()->is('faultscleared*') ? 'active' : '' }}" data-title="Faults Reported">
                <i class="fa-solid fa-triangle-exclamation"></i> <span>Faults Reported</span>
            </a>

            <a href="{{ route('faultscleared.index') }}" class="nav-link {{ request()->is('faultscleared*') ? 'active' : '' }}" data-title="Faults Cleared">
                <i class="fa-solid fa-circle-check"></i> <span>Faults Cleared</span>
            </a>

            <a href="{{ route('darkcore.index') }}" class="nav-link {{ request()->is('darkcore*') ? 'active' : '' }}" data-title="Dark Core Links">
                <i class="fa-solid fa-route"></i> <span>Dark Core Links</span>
            </a>

            <a href="{{ route('dplc.index') }}" class="nav-link {{ request()->is('dplc*') ? 'active' : '' }}" data-title="DPLC Details">
                <i class="fa-solid fa-map-location-dot"></i> <span>DPLC Details</span>
            </a>

            <a href="{{ route('pops.index') }}" class="nav-link {{ request()->is('pops*') ? 'active' : '' }}" data-title="NOC / POP Locations">
                <i class="fa-solid fa-tower-broadcast"></i> <span>NOC / POP Locations</span>
            </a>
        @endif

        {{-- Data Import - Only for Admin and super_admin --}}
        @if(auth()->check() && in_array(auth()->user()->role, ['Admin', 'super_admin']))
            <a href="{{ route('imports.index') }}" class="nav-link {{ request()->is('imports*') ? 'active' : '' }}" data-title="Data Import">
                <i class="fa-solid fa-file-import"></i> <span>Data Import</span>
            </a>
        @endif

        {{-- User Management - Only for Admin and super_admin --}}
        @if(auth()->check() && in_array(auth()->user()->role, ['Admin', 'super_admin']))
            <hr class="my-2" style="opacity: 0.3;">
            <a href="{{ route('users.index') }}" class="nav-link {{ request()->is('users*') ? 'active' : '' }}" data-title="User Management">
                <i class="fa-solid fa-users-gear"></i> <span>User Management</span>
            </a>
        @endif

    </nav>
</div>
