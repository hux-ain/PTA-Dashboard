<?php

namespace App\Http\Controllers;

use App\Models\Subscriber;
use App\Http\Controllers\Concerns\ManagesCrud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubscribersController extends Controller
{
    use ManagesCrud;
    protected string $crudModel = Subscriber::class;
    protected string $crudView = 'subscribers.create';
    protected string $crudRoute = 'subscribers.index';
    protected string $crudLabel = 'Subscriber';
    protected array $crudRules = ['company_name' => 'required|string|max:255', 'district' => 'nullable|string|max:100', 'ntn_cnic' => 'nullable|string|max:50', 'address' => 'nullable|string', 'contact' => 'nullable|string|max:20', 'package' => 'nullable|string|max:100'];
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
        $pageTitle = 'Subscribers CIR';

        $search = $request->input('search');
        $filterPackage = $request->input('package');
        $filterDistrict = $request->input('district');

        $query = Subscriber::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('company_name', 'LIKE', "%{$search}%")
                  ->orWhere('ntn_cnic', 'LIKE', "%{$search}%")
                  ->orWhere('district', 'LIKE', "%{$search}%")
                  ->orWhere('contact', 'LIKE', "%{$search}%")
                  ->orWhere('package', 'LIKE', "%{$search}%");
            });
        }

        if ($filterPackage) {
            $query->where('package', $filterPackage);
        }

        if ($filterDistrict) {
            $query->where('district', $filterDistrict);
        }

        $subscribers = $query->paginate(25)->withQueryString();

        $packages = Subscriber::select('package')
            ->whereNotNull('package')
            ->where('package', '!=', '')
            ->distinct()
            ->orderBy('package')
            ->pluck('package');

        $districts = Subscriber::select('district')
            ->whereNotNull('district')
            ->where('district', '!=', '')
            ->distinct()
            ->orderBy('district')
            ->pluck('district');

        $totalSubscribers = Subscriber::count();

        $topPackage = Subscriber::select('package', DB::raw('count(*) as count'))
            ->whereNotNull('package')
            ->where('package', '!=', '')
            ->groupBy('package')
            ->orderByDesc('count')
            ->first();

        $companiesByCount = Subscriber::select(DB::raw('count(distinct company_name) as count'))->value('count');

        return view('subscribers.index', compact(
            'pageTitle',
            'subscribers',
            'packages',
            'search',
            'filterPackage',
            'districts',
            'filterDistrict',
            'totalSubscribers',
            'topPackage',
            'companiesByCount'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New Subscriber';
        return view('subscribers.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'company_name' => 'required|string|max:255',
            'district' => 'nullable|string|max:100',
            'ntn_cnic' => 'nullable|string|max:50',
            'address' => 'nullable|string',
            'contact' => 'nullable|string|max:20',
            'package' => 'nullable|string|max:100',
        ]);

        try {
            Subscriber::create($validated);
            return redirect()->route('subscribers.index')->with('success', 'Subscriber added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add subscriber: ' . $e->getMessage()]);
        }
    }
}