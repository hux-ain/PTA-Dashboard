<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'PTA Portal') }}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    @stack('styles')
</head>
<body>

@include('layouts.sidebar')

<div id="mainPanel">
    @include('layouts.header')
    <div class="content-wrapper">
        @yield('content')
    </div>
    @include('layouts.footer')
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    AOS.init({ duration: 800, once: true });

    const sidebar = document.getElementById('sidebar');
    const mainPanel = document.getElementById('mainPanel');
    const toggle = document.getElementById('sidebarToggle');
    
    const isMobile = () => window.innerWidth <= 991;

    if (sidebar) {
        if (isMobile()) {
            sidebar.classList.remove('active');
            sidebar.classList.remove('collapsed');
        } else {
            const sidebarCollapsed = localStorage.getItem('sidebarCollapsed') === 'true';
            if (sidebarCollapsed) {
                sidebar.classList.add('collapsed');
                mainPanel?.classList.add('expanded');
            }
        }
        
        requestAnimationFrame(() => {
            sidebar.classList.add('animate-in');
        });
    }

    if (toggle) {
        toggle.addEventListener('click', function (e) {
            e.preventDefault();
            
            if (isMobile()) {
                sidebar?.classList.toggle('active');
                
                if(sidebar.classList.contains('active')) {
                    document.body.style.overflow = 'hidden';
                } else {
                    document.body.style.overflow = 'auto';
                }
            } else {
                sidebar?.classList.add('collapsing');
                sidebar?.classList.toggle('collapsed');
                mainPanel?.classList.toggle('expanded');
                
                const isCollapsed = sidebar?.classList.contains('collapsed');
                localStorage.setItem('sidebarCollapsed', isCollapsed);
                
                setTimeout(() => {
                    sidebar?.classList.remove('collapsing');
                }, 350);
            }
        });
    }

    document.addEventListener('click', function (event) {
        if (isMobile() && sidebar.classList.contains('active')) {
            const isClickInsideSidebar = sidebar.contains(event.target);
            const isClickOnToggle = toggle.contains(event.target);

            if (!isClickInsideSidebar && !isClickOnToggle) {
                sidebar.classList.remove('active');
                document.body.style.overflow = 'auto';
            }
        }
    });

    window.addEventListener('resize', function() {
        if (!isMobile()) {
            sidebar?.classList.remove('active');
            document.body.style.overflow = 'auto';
        }
    });

    let filterTimeout;
    
    const submitForm = (form) => {
        if (form.dataset.submitting === 'true') return;
        form.dataset.submitting = 'true';
        form.submit();
    };

    document.querySelectorAll('.auto-filter-form').forEach(form => {
        form.querySelectorAll('input[type="text"], input[type="search"], input[type="date"], input[type="month"]').forEach(input => {
            input.addEventListener('input', () => {
                clearTimeout(filterTimeout);
                filterTimeout = setTimeout(() => submitForm(form), 600);
            });
        });

        form.querySelectorAll('select, input[type="month"]').forEach(el => {
            el.addEventListener('change', () => submitForm(form));
        });

        if (window.jQuery) {
            const $form = window.jQuery(form);
            $form.find('select.select2').on('change.select2', function() {
                submitForm(form);
            });
        }
    });
});
</script>
@stack('scripts')
</body>
</html>
