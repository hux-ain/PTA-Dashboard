<?php

namespace App\Http\Controllers;

use App\Models\DarkCoreLink;
use App\Http\Controllers\Concerns\ManagesCrud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DarkCoreController extends Controller
{
    use ManagesCrud;
    protected string $crudModel = DarkCoreLink::class;
    protected string $crudView = 'darkcore.create';
    protected string $crudRoute = 'darkcore.index';
    protected string $crudLabel = 'Dark Core Link';
    protected array $crudRules = ['name' => 'required|string|max:255', 'point_a' => 'required|string|max:100', 'point_b' => 'required|string|max:100', 'service_provider_name' => 'required|string|max:100', 'service_type' => 'nullable|string|max:100', 'own_or_lease' => 'nullable|string|max:50'];
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
        $pageTitle = 'Dark Core Links';

        $search = $request->input('search');
        $filterProvider = $request->input('service_provider_name');
        $filterServiceType = $request->input('service_type');
        $filterOwnOrLease = $request->input('own_or_lease');

        $query = DarkCoreLink::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('name', 'LIKE', "%{$search}%")
                  ->orWhere('point_a', 'LIKE', "%{$search}%")
                  ->orWhere('point_b', 'LIKE', "%{$search}%")
                  ->orWhere('service_provider_name', 'LIKE', "%{$search}%")
                  ->orWhere('service_type', 'LIKE', "%{$search}%")
                  ->orWhere('own_or_lease', 'LIKE', "%{$search}%");
            });
        }

        if ($filterProvider) {
            $query->where('service_provider_name', $filterProvider);
        }

        if ($filterServiceType) {
            $query->where('service_type', $filterServiceType);
        }

        if ($filterOwnOrLease) {
            $query->where('own_or_lease', $filterOwnOrLease);
        }

        $darkCoreLinks = $query->paginate(25)->withQueryString();

        $providers = DarkCoreLink::select('service_provider_name')
            ->whereNotNull('service_provider_name')
            ->where('service_provider_name', '!=', '')
            ->distinct()
            ->orderBy('service_provider_name')
            ->pluck('service_provider_name');

        $serviceTypes = DarkCoreLink::select('service_type')
            ->whereNotNull('service_type')
            ->where('service_type', '!=', '')
            ->distinct()
            ->orderBy('service_type')
            ->pluck('service_type');

        $ownOrLeases = DarkCoreLink::select('own_or_lease')
            ->whereNotNull('own_or_lease')
            ->where('own_or_lease', '!=', '')
            ->distinct()
            ->orderBy('own_or_lease')
            ->pluck('own_or_lease');

        $totalDarkCore = DarkCoreLink::count();
        $ownCount = DarkCoreLink::where('own_or_lease', 'like', '%Own%')->count();
        $leaseCount = DarkCoreLink::where('own_or_lease', 'like', '%Lease%')->count();
        $byProviderTop3 = DarkCoreLink::select('service_provider_name', DB::raw('count(*) as count'))
            ->whereNotNull('service_provider_name')
            ->where('service_provider_name', '!=', '')
            ->groupBy('service_provider_name')
            ->orderByDesc('count')
            ->limit(3)
            ->get();

        return view('darkcore.index', compact(
            'pageTitle',
            'darkCoreLinks',
            'providers',
            'serviceTypes',
            'ownOrLeases',
            'search',
            'filterProvider',
            'filterServiceType',
            'filterOwnOrLease',
            'totalDarkCore',
            'ownCount',
            'leaseCount',
            'byProviderTop3'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New Dark Core Link';
        return view('darkcore.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'point_a' => 'required|string|max:100',
            'point_b' => 'required|string|max:100',
            'service_provider_name' => 'required|string|max:100',
            'service_type' => 'nullable|string|max:100',
            'own_or_lease' => 'nullable|string|max:50',
        ]);

        try {
            DarkCoreLink::create($validated);
            return redirect()->route('darkcore.index')->with('success', 'Dark Core Link added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add dark core link: ' . $e->getMessage()]);
        }
    }
}
