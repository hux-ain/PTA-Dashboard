<?php

namespace App\Http\Controllers;

use App\Models\P2pSubscriber;
use Illuminate\Http\Request;

class P2pSubscribersController extends Controller
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
        $pageTitle = 'P2P Subscribers';

        $search = $request->input('search');
        $filterStatus = $request->input('status');
        $filterOwnership = $request->input('ownership');

        $query = P2pSubscriber::query();

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('link_name', 'LIKE', "%{$search}%")
                  ->orWhere('station_a', 'LIKE', "%{$search}%")
                  ->orWhere('station_b', 'LIKE', "%{$search}%")
                  ->orWhere('ownership', 'LIKE', "%{$search}%")
                  ->orWhere('frequency', 'LIKE', "%{$search}%");
            });
        }

        if ($filterStatus) {
            $query->where('status', $filterStatus);
        }

        if ($filterOwnership) {
            $query->where('ownership', $filterOwnership);
        }

        $p2pLinks = $query->paginate(25)->withQueryString();

        $statuses = P2pSubscriber::select('status')
            ->whereNotNull('status')
            ->where('status', '!=', '')
            ->distinct()
            ->orderBy('status')
            ->pluck('status');

        $ownerships = P2pSubscriber::select('ownership')
            ->whereNotNull('ownership')
            ->where('ownership', '!=', '')
            ->distinct()
            ->orderBy('ownership')
            ->pluck('ownership');

        return view('p2p.index', compact(
            'pageTitle',
            'p2pLinks',
            'statuses',
            'ownerships',
            'search',
            'filterStatus',
            'filterOwnership'
        ));
    }

    public function create()
    {
        $pageTitle = 'Add New P2P Subscriber';
        return view('p2p.create', compact('pageTitle'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'serial_no' => 'nullable|string|max:100',
            'link_name' => 'required|string|max:255',
            'station_a' => 'required|string|max:100',
            'station_b' => 'required|string|max:100',
            'status' => 'nullable|string|max:50',
            'ownership' => 'nullable|string|max:100',
            'frequency' => 'nullable|string|max:100',
        ]);

        try {
            P2pSubscriber::create($validated);
            return redirect()->route('p2p.index')->with('success', 'P2P Subscriber added successfully!');
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Failed to add P2P Subscriber: ' . $e->getMessage()]);
        }
    }
}
