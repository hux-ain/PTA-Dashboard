<div class="dashboard-header d-flex justify-content-between align-items-center px-4">

    <div class="d-flex align-items-center gap-3">
        <button class="btn btn-link p-0 text-dark" id="sidebarToggle">
            <i class="fa-solid fa-bars fs-4"></i>
        </button>

        <div class="d-none d-md-block">
            <h4 class="mb-0 fw-bold text-dark">
                <i class="fa-solid fa-layer-group me-2"></i>{{ $panelTitle ?? ($pageTitle ?? 'Portal') }}
            </h4>
        </div>
    </div>
        
    <div class="d-flex align-items-center gap-4">
        <div class="text-end d-none d-lg-block">
            <small class="text-muted d-block" style="font-size: 0.75rem;">Current Year</small>
            <strong class="text-dark">Year: {{ date('Y') }}</strong>
        </div>

        <div class="dropdown profile-container">
    <a class="d-flex align-items-center text-decoration-none dropdown-toggle profile-trigger bg-light rounded-pill shadow-sm"
       style="padding: 4px 16px 4px 4px;"
       href="#"
       id="profileDropdown"
       role="button"
       data-bs-toggle="dropdown"
       aria-expanded="false">

        @if(auth()->check() && auth()->user()->profile_image_url)
            <img src="{{ auth()->user()->profile_image_url }}"
                alt="Profile"
                class="rounded-circle"
                width="36"
                height="36"
                style="object-fit: cover; border: 2px solid var(--accent); aspect-ratio: 1/1;">
        @else
            <div class="avatar-emoji-placeholder rounded-circle" 
                 style="width: 36px; height: 36px; aspect-ratio: 1/1; display: flex; align-items: center; justify-content: center;">
                <i class="fa-solid fa-user" style="font-size: 1rem;"></i>
            </div>
        @endif

        <span class="ms-2 d-none d-sm-inline text-dark fw-bold" style="line-height: 1;">{{ auth()->check() ? auth()->user()->name : 'User' }}</span>
    </a>

    <ul class="dropdown-menu dropdown-menu-end shadow p-3 animated-dropdown" aria-labelledby="profileDropdown" style="z-index: 1002;">
        <li class="mb-2 px-2">
            <div class="d-flex align-items-center">
                @if(auth()->check() && auth()->user()->profile_image_url)
                    <img src="{{ auth()->user()->profile_image_url }}"
                        class="rounded-circle me-3"
                        width="50"
                        height="50"
                        style="object-fit: cover; border: 2px solid var(--accent); aspect-ratio: 1/1;">
                @else
                    <div class="avatar-emoji-placeholder rounded-circle me-3" 
                         style="width: 50px; height: 50px; aspect-ratio: 1/1; display: flex; align-items: center; justify-content: center;">
                        <i class="fa-solid fa-user" style="font-size: 1.5rem;"></i>
                    </div>
                @endif
                <div>
                    <h6 class="mb-0 fw-bold">{{ auth()->check() ? auth()->user()->name : 'User' }}</h6>
                    <small class="text-muted">{{ auth()->check() ? auth()->user()->email : 'user@gerrys.net' }}</small>
                </div>
            </div>
        </li>

        <li><hr class="dropdown-divider"></li>

        <li>
            <a class="dropdown-item animated-item" href="{{ route('home') }}">
                <i class="fa-solid fa-user me-2 text-secondary"></i> Account Details
            </a>
        </li>
        <li>
            <a class="dropdown-item animated-item" href="{{ route('home') }}">
                <i class="fa-solid fa-gear me-2 text-secondary"></i> Change Password
            </a>
        </li>


        <li><hr class="dropdown-divider"></li>

        <li>
            <a class="dropdown-item text-danger animated-item" 
               href="{{ route('logout') }}"
               onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                <i class="fa-solid fa-right-from-bracket me-2"></i> Sign Out
            </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </li>
    </ul>
</div>
    </div>
</div>
