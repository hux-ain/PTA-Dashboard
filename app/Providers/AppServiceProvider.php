<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate; // <--- Yeh line add karein
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Use Bootstrap 5 for pagination
        Paginator::useBootstrapFive();

        // Yahan aapka Gate logic hona chahiye
        Gate::define('isAdmin', function ($user) {
            return $user->role_id == 1; // 1 for Admin
        });

        View::composer('layouts.header', function ($view) {
            $route = request()->route();
            $name = $route ? $route->getName() : null;

            $titles = [
                'home' => 'Dashboard',

                'customers.index' => 'Customers',
                'customers.create' => 'Create Customer',
                'customers.history' => 'Customer History',
                'customers.service_request' => 'Service Request',

                'account.details' => 'Account Details',
                'account.edit' => 'Edit Account',
                'account.password' => 'Change Password',
                'account.create_user' => 'User Management',
            ];

            $pageTitle = $titles[$name] ?? ($name ? str($name)->replace(['.', '_'], ' ')->title()->toString() : 'Portal');

            $view->with('pageTitle', $pageTitle);
        });
    }
}