<?php

namespace App\Http\Controllers;

use App\Models\Complaint;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ComplaintsController extends Controller
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

    public function edit(Complaint $complaint)
    {
        $this->ensureAdmin();
        $pageTitle = 'Edit Complaint';

        return view('complaints.create', compact('pageTitle', 'complaint'));
    }

    public function update(Request $request, Complaint $complaint)
    {
        $this->ensureAdmin();
        $validated = $this->validateComplaint($request);

        if (strtolower((string) ($validated['status'] ?? '')) === 'closed') {
            $validated['closed_at'] = $validated['closed_at'] ?? now();
            $validated['aging_downtime'] = $complaint->opened_at
                ? $this->formatDuration($complaint->opened_at, Carbon::parse($validated['closed_at']))
                : null;
        } else {
            $validated['closed_at'] = null;
            $validated['aging_downtime'] = null;
        }

        $complaint->update($validated);

        return redirect()->route('complaints.index')->with('success', 'Complaint updated successfully!');
    }

    public function close(Complaint $complaint)
    {
        $this->ensureAdmin();

        $closedAt = now();
        $complaint->update([
            'status' => 'Closed',
            'closed_at' => $closedAt,
            'aging_downtime' => $complaint->opened_at
                ? $this->formatDuration($complaint->opened_at, $closedAt)
                : null,
        ]);

        return redirect()->route('complaints.index')->with('success', 'Complaint closed successfully!');
    }

    public function destroy(Complaint $complaint)
    {
        if (auth()->user()->role !== 'super_admin') {
            abort(403, 'Unauthorized - Only Super Admin can delete complaints');
        }

        $complaint->delete();

        return redirect()->route('complaints.index')->with('success', 'Complaint deleted successfully!');
    }

    private function ensureAdmin(): void
    {
        if (!in_array(auth()->user()->role, ['Admin', 'super_admin'])) {
            abort(403, 'Unauthorized - Only Admin can edit or close complaints');
        }
    }

    private function validateComplaint(Request $request): array
    {
        return $request->validate([
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
    }

    private function formatDuration(Carbon $openedAt, Carbon $closedAt): string
    {
        $minutes = max(0, $openedAt->diffInMinutes($closedAt));
        $days = intdiv($minutes, 1440);
        $hours = intdiv($minutes % 1440, 60);
        $remainingMinutes = $minutes % 60;
        $parts = [];

        if ($days) $parts[] = $days . ' ' . str('day')->plural($days);
        if ($hours) $parts[] = $hours . ' ' . str('hour')->plural($hours);
        if ($remainingMinutes || !$parts) $parts[] = $remainingMinutes . ' ' . str('minute')->plural($remainingMinutes);

        return implode(' ', $parts);
    }
}
