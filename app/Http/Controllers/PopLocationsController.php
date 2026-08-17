<?php

namespace App\Http\Controllers;

use App\Models\NocPopLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PopLocationsController extends Controller
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
        $pageTitle = 'NOC / POP Locations';

        $search = $request->input('search');
        $filterCity = $request->input('city');
        $filterOwnColocated = $request->input('own_colocated');

        $query = NocPopLocation::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('pop_name', 'LIKE', "%{$search}%")
                  ->orWhere('gps_coordinates', 'LIKE', "%{$search}%")
                  ->orWhere('address', 'LIKE', "%{$search}%")
                  ->orWhere('city', 'LIKE', "%{$search}%")
                  ->orWhere('own_colocated', 'LIKE', "%{$search}%");
            });
        }

        if ($filterCity) {
            $query->where('city', $filterCity);
        }

        if ($filterOwnColocated) {
            $query->where('own_colocated', $filterOwnColocated);
        }

        $popLocations = $query->paginate(25)->withQueryString();

        $cities = NocPopLocation::select('city')
            ->whereNotNull('city')
            ->where('city', '!=', '')
            ->distinct()
            ->orderBy('city')
            ->pluck('city');

        $ownColocatedOptions = NocPopLocation::select('own_colocated')
            ->whereNotNull('own_colocated')
            ->where('own_colocated', '!=', '')
            ->distinct()
            ->orderBy('own_colocated')
            ->pluck('own_colocated');

        $totalPops = NocPopLocation::count();
        $ownCount = NocPopLocation::where('own_colocated', 'like', '%Own%')->count();
        $colocatedCount = NocPopLocation::where('own_colocated', 'like', '%Coloc%')->count();
        $citiesSummary = NocPopLocation::select('city', DB::raw('count(*) as count'))
            ->whereNotNull('city')
            ->where('city', '!=', '')
            ->groupBy('city')
            ->orderByDesc('count')
            ->limit(5)
            ->get();

        return view('pops.index', compact(
            'pageTitle',
            'popLocations',
            'cities',
            'ownColocatedOptions',
            'search',
            'filterCity',
            'filterOwnColocated',
            'totalPops',
            'ownCount',
            'colocatedCount',
            'citiesSummary'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New POP Location';
        return view('pops.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'serial_no' => 'nullable|string|max:100',
            'pop_name' => 'required|string|max:255',
            'city' => 'required|string|max:100',
            'gps_coordinates' => 'nullable|string|max:100',
            'address' => 'nullable|string',
            'own_colocated' => 'nullable|string|max:50',
        ]);

        try {
            NocPopLocation::create($validated);
            return redirect()->route('pops.index')->with('success', 'POP Location added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add POP location: ' . $e->getMessage()]);
        }
    }
}
