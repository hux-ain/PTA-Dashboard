<?php

namespace App\Http\Controllers;

use App\Models\FaultsCleared;
use App\Http\Controllers\Concerns\ManagesCrud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FaultsClearedController extends Controller
{
    use ManagesCrud;
    protected string $crudModel = FaultsCleared::class;
    protected string $crudView = 'faultscleared.create';
    protected string $crudRoute = 'faultscleared.index';
    protected string $crudLabel = 'Cleared Fault';
    protected array $crudRules = ['customer_name' => 'required|string|max:255', 'opened_at' => 'required|date', 'issue' => 'required|string', 'complaint_channel' => 'nullable|string|max:100', 'main_city' => 'nullable|string|max:100', 'closed_at' => 'nullable|date', 'status' => 'nullable|string|max:50', 'affect' => 'nullable|string|max:100', 'owner' => 'nullable|string|max:100', 'aging_downtime' => 'nullable|string|max:100', 'rfo' => 'nullable|string', 'rca' => 'nullable|string'];
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
        $pageTitle = 'Faults Cleared';

        $search = $request->input('search');
        $filterStatus = $request->input('status');
        $filterAffect = $request->input('affect');
        $filterCity = $request->input('main_city');

        $query = FaultsCleared::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('customer_name', 'LIKE', "%{$search}%")
                  ->orWhere('main_city', 'LIKE', "%{$search}%")
                  ->orWhere('issue', 'LIKE', "%{$search}%")
                  ->orWhere('owner', 'LIKE', "%{$search}%")
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

        $faultsCleared = $query->orderByDesc('closed_at')->paginate(25)->withQueryString();

        $statuses = FaultsCleared::select('status')
            ->whereNotNull('status')
            ->where('status', '!=', '')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        $affects = FaultsCleared::select('affect')
            ->whereNotNull('affect')
            ->where('affect', '!=', '')
            ->distinct()
            ->orderBy('affect')
            ->pluck('affect');

        $cities = FaultsCleared::select('main_city')
            ->whereNotNull('main_city')
            ->where('main_city', '!=', '')
            ->distinct()
            ->orderBy('main_city')
            ->pluck('main_city');

        $totalCleared = FaultsCleared::count();
        $clearedUnder24h = FaultsCleared::where(function ($q) {
            $q->where('aging_downtime', 'LIKE', '%min%')
              ->orWhere(DB::raw("CAST(SUBSTRING_INDEX(aging_downtime, ' ', 1) AS DECIMAL(10,2))"), '<', 24);
        })->count();
        $cleared2448h = FaultsCleared::whereBetween(
            DB::raw("CAST(SUBSTRING_INDEX(aging_downtime, ' ', 1) AS DECIMAL(10,2))"),
            [24, 48]
        )->count();
        $totalService = FaultsCleared::where('affect', 'like', '%Service Affecting%')->count();

        return view('faultscleared.index', compact(
            'pageTitle',
            'faultsCleared',
            'statuses',
            'affects',
            'cities',
            'search',
            'filterStatus',
            'filterAffect',
            'filterCity',
            'totalCleared',
            'clearedUnder24h',
            'cleared2448h',
            'totalService'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New Fault Cleared';
        return view('faultscleared.create', compact('pageTitle'));
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
            'owner' => 'nullable|string|max:100',
            'aging_downtime' => 'nullable|string|max:100',
            'rfo' => 'nullable|string',
            'rca' => 'nullable|string',
        ]);

        try {
            FaultsCleared::create($validated);
            return redirect()->route('faultscleared.index')->with('success', 'Fault Cleared added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add fault cleared: ' . $e->getMessage()]);
        }
    }
}
