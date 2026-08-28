<?php

namespace App\Http\Controllers;

use App\Models\DplcDetail;
use App\Http\Controllers\Concerns\ManagesCrud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DplcController extends Controller
{
    use ManagesCrud;
    protected string $crudModel = DplcDetail::class;
    protected string $crudView = 'dplc.create';
    protected string $crudRoute = 'dplc.index';
    protected string $crudLabel = 'DPLC Detail';
    protected array $crudRules = ['serial_no' => 'nullable|string|max:100', 'point_a_gps' => 'nullable|string|max:100', 'point_b_gps' => 'nullable|string|max:100', 'service_provider' => 'required|string|max:100', 'total_bandwidth_acquired' => 'nullable|string|max:100'];
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
        $pageTitle = 'DPLC Details';

        $search = $request->input('search');
        $filterProvider = $request->input('service_provider');

        $query = DplcDetail::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('point_a_gps', 'LIKE', "%{$search}%")
                  ->orWhere('point_b_gps', 'LIKE', "%{$search}%")
                  ->orWhere('service_provider', 'LIKE', "%{$search}%")
                  ->orWhere('total_bandwidth_acquired', 'LIKE', "%{$search}%");
            });
        }

        if ($filterProvider) {
            $query->where('service_provider', $filterProvider);
        }

        $dplcDetails = $query->paginate(25)->withQueryString();

        $providers = DplcDetail::select('service_provider')
            ->whereNotNull('service_provider')
            ->where('service_provider', '!=', '')
            ->distinct()
            ->orderBy('service_provider')
            ->pluck('service_provider');

        $totalDplc = DplcDetail::count();

        $totalBandwidth = DplcDetail::select(DB::raw("SUM(CAST(SUBSTRING_INDEX(REGEXP_REPLACE(total_bandwidth_acquired, '[^0-9.]', ''), ' ', 1) AS DECIMAL(20,2))) as total_bw"))
            ->value('total_bw');
        $totalBandwidthLabel = $totalBandwidth ? number_format($totalBandwidth, 2) . ' Mbps' : 'N/A';

        $byProviderCounts = DplcDetail::select('service_provider', DB::raw('count(*) as count'))
            ->whereNotNull('service_provider')
            ->where('service_provider', '!=', '')
            ->groupBy('service_provider')
            ->orderByDesc('count')
            ->get();

        return view('dplc.index', compact(
            'pageTitle',
            'dplcDetails',
            'providers',
            'search',
            'filterProvider',
            'totalDplc',
            'totalBandwidthLabel',
            'byProviderCounts'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New DPLC Detail';
        return view('dplc.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'serial_no' => 'nullable|string|max:100',
            'point_a_gps' => 'nullable|string|max:100',
            'point_b_gps' => 'nullable|string|max:100',
            'service_provider' => 'required|string|max:100',
            'total_bandwidth_acquired' => 'nullable|string|max:100',
        ]);

        try {
            DplcDetail::create($validated);
            return redirect()->route('dplc.index')->with('success', 'DPLC Detail added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add DPLC detail: ' . $e->getMessage()]);
        }
    }
}
