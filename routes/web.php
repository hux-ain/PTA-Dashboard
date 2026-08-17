<?php

use App\Http\Controllers\ComplaintsController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DarkCoreController;
use App\Http\Controllers\DplcController;
use App\Http\Controllers\FaultsClearedController;
use App\Http\Controllers\FaultsController;
use App\Http\Controllers\ImportController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\P2pSubscribersController;
use App\Http\Controllers\PopLocationsController;
use App\Http\Controllers\SubscribersController;
use App\Http\Controllers\UserManagementController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect()->route('login');
});

Route::middleware('guest')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('/login', [LoginController::class, 'login'])->name('login.submit');
});

Route::middleware(['auth'])->group(function () {

    Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

    Route::get('/home', [DashboardController::class, 'index'])->name('home');

    // Subscribers
    Route::get('/subscribers', [SubscribersController::class, 'index'])->name('subscribers.index');
    Route::get('/subscribers/create', [SubscribersController::class, 'create'])->name('subscribers.create');
    Route::post('/subscribers', [SubscribersController::class, 'store'])->name('subscribers.store');

    // P2P
    Route::get('/p2p', [P2pSubscribersController::class, 'index'])->name('p2p.index');
    Route::get('/p2p/create', [P2pSubscribersController::class, 'create'])->name('p2p.create');
    Route::post('/p2p', [P2pSubscribersController::class, 'store'])->name('p2p.store');

    // Complaints
    Route::get('/complaints', [ComplaintsController::class, 'index'])->name('complaints.index');
    Route::get('/complaints/create', [ComplaintsController::class, 'create'])->name('complaints.create');
    Route::post('/complaints', [ComplaintsController::class, 'store'])->name('complaints.store');

    // Faults
    Route::get('/faults', [FaultsController::class, 'index'])->name('faults.index');
    Route::get('/faults/create', [FaultsController::class, 'create'])->name('faults.create');
    Route::post('/faults', [FaultsController::class, 'store'])->name('faults.store');

    // Faults Cleared
    Route::get('/faultscleared', [FaultsClearedController::class, 'index'])->name('faultscleared.index');
    Route::get('/faultscleared/create', [FaultsClearedController::class, 'create'])->name('faultscleared.create');
    Route::post('/faultscleared', [FaultsClearedController::class, 'store'])->name('faultscleared.store');

    // Dark Core
    Route::get('/darkcore', [DarkCoreController::class, 'index'])->name('darkcore.index');
    Route::get('/darkcore/create', [DarkCoreController::class, 'create'])->name('darkcore.create');
    Route::post('/darkcore', [DarkCoreController::class, 'store'])->name('darkcore.store');

    // DPLC
    Route::get('/dplc', [DplcController::class, 'index'])->name('dplc.index');
    Route::get('/dplc/create', [DplcController::class, 'create'])->name('dplc.create');
    Route::post('/dplc', [DplcController::class, 'store'])->name('dplc.store');

    // POPs
    Route::get('/pops', [PopLocationsController::class, 'index'])->name('pops.index');
    Route::get('/pops/create', [PopLocationsController::class, 'create'])->name('pops.create');
    Route::post('/pops', [PopLocationsController::class, 'store'])->name('pops.store');

    Route::get('/imports', [ImportController::class, 'index'])->name('imports.index');

    Route::post('/import-submit-subscribers', [ImportController::class, 'submitSubscribers'])->name('imports.submit_subscribers');
    Route::post('/import-submit-p2p', [ImportController::class, 'submitP2p'])->name('imports.submit_p2p');
    Route::post('/import-submit-complaints', [ImportController::class, 'submitComplaints'])->name('imports.submit_complaints');
    Route::post('/import-submit-tickets', [ImportController::class, 'submitTickets'])->name('imports.submit_tickets');
    Route::post('/import-submit-faults', [ImportController::class, 'submitFaults'])->name('imports.submit_faults');
    Route::post('/import-submit-faults-cleared', [ImportController::class, 'submitFaultsCleared'])->name('imports.submit_faults_cleared');
    Route::post('/import-submit-darkcore', [ImportController::class, 'submitDarkCore'])->name('imports.submit_darkcore');
    Route::post('/import-submit-dplc', [ImportController::class, 'submitDplc'])->name('imports.submit_dplc');
    Route::post('/import-submit-pops', [ImportController::class, 'submitPops'])->name('imports.submit_pops');

    Route::post('/truncate-subscribers', [ImportController::class, 'truncateSubscribers'])->name('imports.truncate_subscribers');
    Route::post('/truncate-p2p', [ImportController::class, 'truncateP2p'])->name('imports.truncate_p2p');
    Route::post('/truncate-complaints', [ImportController::class, 'truncateComplaints'])->name('imports.truncate_complaints');
    Route::post('/truncate-faults', [ImportController::class, 'truncateFaults'])->name('imports.truncate_faults');
    Route::post('/truncate-faults-cleared', [ImportController::class, 'truncateFaultsCleared'])->name('imports.truncate_faults_cleared');
    Route::post('/truncate-darkcore', [ImportController::class, 'truncateDarkCore'])->name('imports.truncate_darkcore');
    Route::post('/truncate-dplc', [ImportController::class, 'truncateDplc'])->name('imports.truncate_dplc');
    Route::post('/truncate-pops', [ImportController::class, 'truncatePops'])->name('imports.truncate_pops');

    // User Management - Admin only
    Route::resource('users', UserManagementController::class);
});
