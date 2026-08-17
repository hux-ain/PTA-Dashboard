<?php

namespace App\Http\Controllers;

use App\Models\Complaint;
use Illuminate\Http\Request;

class ComplaintsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware(function ($request, $next) {
            if (!in_array(auth()->user()->role, ['Admin', 'Employee'])) {
                abort(403, 'Unauthorized - This section is only for Admin and Employee roles');
            }
            return $next($request);
        });
    }

    public function index(Request $request)
    {
        $pageTitle = 'Complaint Report';

        $search = $request->input('search');
        $filterStatus = $request->input('status');
        $filterAffect = $request->input('affect');
        $filterCity = $request->input('main_city');

        $query = Complaint::query();

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

        $complaints = $query->orderByDesc('opened_at')->paginate(25)->withQueryString();

        $statuses = Complaint::select('status')
            ->whereNotNull('status')
            ->where('status', '!=', '')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        $affects = Complaint::select('affect')
            ->whereNotNull('affect')
            ->where('affect', '!=', '')
            ->distinct()
            ->orderBy('affect')
            ->pluck('affect');

        $cities = Complaint::select('main_city')
            ->whereNotNull('main_city')
            ->where('main_city', '!=', '')
            ->distinct()
            ->orderBy('main_city')
            ->pluck('main_city');

        $totalComplaints = Complaint::count();
        $totalOpen = Complaint::open()->count();
        $totalClosed = Complaint::closed()->count();
        $totalService = Complaint::serviceAffecting()->count();

        return view('complaints.index', compact(
            'pageTitle',
            'complaints',
            'statuses',
            'affects',
            'cities',
            'search',
            'filterStatus',
            'filterAffect',
            'filterCity',
            'totalComplaints',
            'totalOpen',
            'totalClosed',
            'totalService'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New Complaint';
        return view('complaints.create', compact('pageTitle'));
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
            Complaint::create($validated);
            return redirect()->route('complaints.index')->with('success', 'Complaint added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add complaint: ' . $e->getMessage()]);
        }
    }
}
