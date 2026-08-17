<?php

namespace App\Http\Controllers;

use App\Models\FaultReported;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FaultsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware(function ($request, $next) {
            if (!in_array(auth()->user()->role, ['Admin', 'Employee', 'super_admin'])) {
                abort(403, 'Unauthorized - This section is only for Admin and Employee roles');
            }
            return $next($request);
        });
    }

    public function index(Request $request)
    {
        $pageTitle = 'Faults Reported';

        $search = $request->input('search');
        $filterStatus = $request->input('status');
        $filterAffect = $request->input('affect');
        $filterCity = $request->input('main_city');

        $query = FaultReported::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('customer_name', 'LIKE', "%{$search}%")
                  ->orWhere('main_city', 'LIKE', "%{$search}%")
                  ->orWhere('issue', 'LIKE', "%{$search}%")
                  ->orWhere('rca', 'LIKE', "%{$search}%")
                  ->orWhere('rfo', 'LIKE', "%{$search}%");
            });
        }

        if ($filterStatus) {
            $query->where('status', $filterStatus);
        }

        if ($filterAffect) {
            $query->where('affect', $filterAffect);
        }

        if ($filterCity) {
            $query->where('main_city', $filterCity);
        }

        $faults = $query->orderByDesc('opened_at')->paginate(25)->withQueryString();

        $statuses = FaultReported::select('status')
            ->whereNotNull('status')
            ->where('status', '!=', '')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        $affects = FaultReported::select('affect')
            ->whereNotNull('affect')
            ->where('affect', '!=', '')
            ->distinct()
            ->orderBy('affect')
            ->pluck('affect');

        $cities = FaultReported::select('main_city')
            ->whereNotNull('main_city')
            ->where('main_city', '!=', '')
            ->distinct()
            ->orderBy('main_city')
            ->pluck('main_city');

        $totalFaults = FaultReported::count();
        $totalOpen = FaultReported::whereIn('status', ['Open', 'open', 'Pending'])->count();
        $totalClosed = FaultReported::whereIn('status', ['Closed', 'closed'])->count();
        $avgAging = FaultReported::avg(DB::raw("CAST(SUBSTRING_INDEX(aging_downtime, ' ', 1) AS DECIMAL(10,2))"));
        $avgAging = $avgAging ? number_format($avgAging, 1) . ' hrs' : 'N/A';

        return view('faults.index', compact(
            'pageTitle',
            'faults',
            'statuses',
            'affects',
            'cities',
            'search',
            'filterStatus',
            'filterAffect',
            'filterCity',
            'totalFaults',
            'totalOpen',
            'totalClosed',
            'avgAging'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New Fault Report';
        return view('faults.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'customer_name' => 'required|string|max:255',
            'opened_at' => 'required|date',
            'issue' => 'required|string',
            'complaint_channel' => 'nullable|string|max:100',
            'main_city' => 'nullable|string|max:100',
            'closed_at' => 'nullable|date',
            'status' => 'nullable|string|max:50',
            'affect' => 'nullable|string|max:100',
            'aging_downtime' => 'nullable|string|max:100',
            'rfo' => 'nullable|string',
            'rca' => 'nullable|string',
        ]);

        try {
            FaultReported::create($validated);
            return redirect()->route('faults.index')->with('success', 'Fault Report added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add fault report: ' . $e->getMessage()]);
        }
    }
}
