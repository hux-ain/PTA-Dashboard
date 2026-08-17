<?php

namespace App\Http\Controllers;

use App\Imports\ComplaintImport;
use App\Imports\DarkCoreImport;
use App\Imports\DplcDetailImport;
use App\Imports\FaultReportedImport;
use App\Imports\FaultsClearedImport;
use App\Imports\NocPopLocationImport;
use App\Imports\P2pSubscriberImport;
use App\Imports\SubscriberImport;
use App\Imports\TicketsImport;
use App\Models\Complaint;
use App\Models\DarkCoreLink;
use App\Models\DplcDetail;
use App\Models\FaultReported;
use App\Models\FaultsCleared;
use App\Models\NocPopLocation;
use App\Models\P2pSubscriber;
use App\Models\Subscriber;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class ImportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware(function ($request, $next) {
            if (auth()->user()->role !== 'super_admin') {
                abort(403, 'Unauthorized - Only Admin and Super Admin can access Data Import');
            }
            return $next($request);
        });
    }

    public function index()
    {
        $pageTitle = 'Data Import Center';

        $subscribersCount = Subscriber::count();
        $p2pCount = P2pSubscriber::count();
        $complaintsCount = Complaint::count();
        $faultsCount = FaultReported::count();
        $faultsClearedCount = FaultsCleared::count();
        $darkCoreCount = DarkCoreLink::count();
        $dplcCount = DplcDetail::count();
        $popsCount = NocPopLocation::count();

        return view('imports.index', compact(
            'pageTitle',
            'subscribersCount',
            'p2pCount',
            'complaintsCount',
            'faultsCount',
            'faultsClearedCount',
            'darkCoreCount',
            'dplcCount',
            'popsCount'
        ));
    }

    public function submitSubscribers(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = Subscriber::count();
            Excel::import(new SubscriberImport, $request->file('file'));
            $countAfter = Subscriber::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Subscribers CIR data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Subscribers CIR data: ' . $e->getMessage());
        }
    }

    public function submitP2p(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = P2pSubscriber::count();
            Excel::import(new P2pSubscriberImport, $request->file('file'));
            $countAfter = P2pSubscriber::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "P2P Subscribers data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import P2P Subscribers data: ' . $e->getMessage());
        }
    }

    public function submitComplaints(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = Complaint::count();
            Excel::import(new ComplaintImport, $request->file('file'));
            $countAfter = Complaint::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Complaint Report data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Complaint Report data: ' . $e->getMessage());
        }
    }

    public function submitTickets(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = Complaint::count();
            Excel::import(new TicketsImport, $request->file('file'));
            $countAfter = Complaint::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Tickets data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Tickets data: ' . $e->getMessage());
        }
    }

    public function submitFaults(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = FaultReported::count();
            Excel::import(new FaultReportedImport, $request->file('file'));
            $countAfter = FaultReported::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Faults Reported data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Faults Reported data: ' . $e->getMessage());
        }
    }

    public function submitFaultsCleared(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = FaultsCleared::count();
            Excel::import(new FaultsClearedImport, $request->file('file'));
            $countAfter = FaultsCleared::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Faults Cleared data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Faults Cleared data: ' . $e->getMessage());
        }
    }

    public function submitDarkCore(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = DarkCoreLink::count();
            Excel::import(new DarkCoreImport, $request->file('file'));
            $countAfter = DarkCoreLink::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "Dark Core Links data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import Dark Core Links data: ' . $e->getMessage());
        }
    }

    public function submitDplc(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = DplcDetail::count();
            Excel::import(new DplcDetailImport, $request->file('file'));
            $countAfter = DplcDetail::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "DPLC Details data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import DPLC Details data: ' . $e->getMessage());
        }
    }

    public function submitPops(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls|max:20480',
        ]);

        try {
            $countBefore = NocPopLocation::count();
            Excel::import(new NocPopLocationImport, $request->file('file'));
            $countAfter = NocPopLocation::count();
            $imported = $countAfter - $countBefore;

            return redirect()->back()->with('success', "NOC / POP Locations data imported successfully. " . ($imported > 0 ? "{$imported} new records added. " : "") . "Total records: {$countAfter}.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to import NOC / POP Locations data: ' . $e->getMessage());
        }
    }

    public function truncateSubscribers()
    {
        try {
            $count = Subscriber::count();
            DB::table('subscribers')->truncate();
            return redirect()->back()->with('success', "All {$count} Subscribers CIR records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete Subscribers CIR records: ' . $e->getMessage());
        }
    }

    public function truncateP2p()
    {
        try {
            $count = P2pSubscriber::count();
            DB::table('p2p_subscribers')->truncate();
            return redirect()->back()->with('success', "All {$count} P2P Subscribers records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete P2P Subscribers records: ' . $e->getMessage());
        }
    }

    public function truncateComplaints()
    {
        try {
            $count = Complaint::count();
            DB::table('complaints')->truncate();
            return redirect()->back()->with('success', "All {$count} Complaint Report records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete Complaint Report records: ' . $e->getMessage());
        }
    }

    public function truncateFaults()
    {
        try {
            $count = FaultReported::count();
            DB::table('faults_reported')->truncate();
            return redirect()->back()->with('success', "All {$count} Faults Reported records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete Faults Reported records: ' . $e->getMessage());
        }
    }

    public function truncateFaultsCleared()
    {
        try {
            $count = FaultsCleared::count();
            DB::table('faults_cleared')->truncate();
            return redirect()->back()->with('success', "All {$count} Faults Cleared records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete Faults Cleared records: ' . $e->getMessage());
        }
    }

    public function truncateDarkCore()
    {
        try {
            $count = DarkCoreLink::count();
            DB::table('dark_core_links')->truncate();
            return redirect()->back()->with('success', "All {$count} Dark Core Links records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete Dark Core Links records: ' . $e->getMessage());
        }
    }

    public function truncateDplc()
    {
        try {
            $count = DplcDetail::count();
            DB::table('dplc_details')->truncate();
            return redirect()->back()->with('success', "All {$count} DPLC Details records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete DPLC Details records: ' . $e->getMessage());
        }
    }

    public function truncatePops()
    {
        try {
            $count = NocPopLocation::count();
            DB::table('noc_pop_locations')->truncate();
            return redirect()->back()->with('success', "All {$count} NOC / POP Locations records have been deleted.");
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Failed to delete NOC / POP Locations records: ' . $e->getMessage());
        }
    }
}
