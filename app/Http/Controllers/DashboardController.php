<?php

namespace App\Http\Controllers;

use App\Models\Complaint;
use App\Models\Subscriber;
use App\Models\P2pSubscriber;
use App\Models\DarkCoreLink;
use App\Models\DplcDetail;
use App\Models\NocPopLocation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $pageTitle = 'Dashboard';

        $totalSubscribers = Subscriber::count();
        $totalP2p = P2pSubscriber::count();
        $totalComplaints = Complaint::count();
        $totalDarkCore = DarkCoreLink::count();
        $totalDplc = DplcDetail::count();
        $totalPops = NocPopLocation::count();
        $totalInfrastructure = $totalDarkCore + $totalDplc + $totalPops;

        $p2pCount = P2pSubscriber::count();
        $packageBreakdown = Subscriber::select('package', DB::raw('count(*) as count'))
            ->whereNotNull('package')
            ->where('package', '!=', '')
            ->groupBy('package')
            ->orderByDesc('count')
            ->limit(3)
            ->get();

        $p2pStatusCounts = P2pSubscriber::select('status', DB::raw('count(*) as count'))
            ->groupBy('status')
            ->pluck('count', 'status')
            ->toArray();
        $p2pOwnershipCounts = P2pSubscriber::select('ownership', DB::raw('count(*) as count'))
            ->groupBy('ownership')
            ->pluck('count', 'ownership')
            ->toArray();

        $complaintsOpen = Complaint::open()->count();
        $complaintsClosed = Complaint::closed()->count();
        $complaintsService = Complaint::serviceAffecting()->count();

        $darkCoreCount = DarkCoreLink::count();
        $dplcCount = DplcDetail::count();
        $popCount = NocPopLocation::count();

        $timePeriod = $request->input('time_period', 'current_year');
        $statusFilter = $request->input('status_filter', 'all');

        $now = now();
        $labels = [];
        $values = [];

        $query = Complaint::query();

        switch ($timePeriod) {
            case 'current_month':
                $start = $now->copy()->startOfMonth();
                $end = $now->copy()->endOfMonth();
                $days = $start->diffInDays($end) + 1;
                for ($i = 1; $i <= $days; $i++) {
                    $labels[] = "Day $i";
                    $dayStart = $start->copy()->addDays($i - 1)->startOfDay();
                    $dayEnd = $dayStart->copy()->endOfDay();
                    $q = (clone $query)->whereBetween('opened_at', [$dayStart, $dayEnd]);
                    if ($statusFilter === 'open') $q->open();
                    elseif ($statusFilter === 'closed') $q->closed();
                    $values[] = $q->count();
                }
                break;
            case 'last_month':
                $start = $now->copy()->subMonth()->startOfMonth();
                $end = $now->copy()->subMonth()->endOfMonth();
                $days = $start->diffInDays($end) + 1;
                for ($i = 1; $i <= $days; $i++) {
                    $labels[] = "Day $i";
                    $dayStart = $start->copy()->addDays($i - 1)->startOfDay();
                    $dayEnd = $dayStart->copy()->endOfDay();
                    $q = (clone $query)->whereBetween('opened_at', [$dayStart, $dayEnd]);
                    if ($statusFilter === 'open') $q->open();
                    elseif ($statusFilter === 'closed') $q->closed();
                    $values[] = $q->count();
                }
                break;
            case 'last_year':
                $year = $now->copy()->subYear()->year;
                for ($m = 1; $m <= 12; $m++) {
                    $labels[] = date('M', mktime(0, 0, 0, $m, 1));
                    $monthStart = now()->setYear($year)->setMonth($m)->startOfMonth();
                    $monthEnd = $monthStart->copy()->endOfMonth();
                    $q = (clone $query)->whereBetween('opened_at', [$monthStart, $monthEnd]);
                    if ($statusFilter === 'open') $q->open();
                    elseif ($statusFilter === 'closed') $q->closed();
                    $values[] = $q->count();
                }
                break;
            case 'current_year':
            default:
                $year = $now->year;
                for ($m = 1; $m <= 12; $m++) {
                    $labels[] = date('M', mktime(0, 0, 0, $m, 1));
                    $monthStart = now()->setYear($year)->setMonth($m)->startOfMonth();
                    $monthEnd = $monthStart->copy()->endOfMonth();
                    $q = (clone $query)->whereBetween('opened_at', [$monthStart, $monthEnd]);
                    if ($statusFilter === 'open') $q->open();
                    elseif ($statusFilter === 'closed') $q->closed();
                    $values[] = $q->count();
                }
                break;
        }

        $timeLabels = json_encode($labels);
        $timeValues = json_encode($values);

        $cityComplaints = Complaint::select(
            'main_city',
            DB::raw('count(*) as total'),
            DB::raw("SUM(CASE WHEN status IN ('Open','open','Pending') THEN 1 ELSE 0 END) as open_count"),
            DB::raw("SUM(CASE WHEN status IN ('Closed','closed') THEN 1 ELSE 0 END) as closed_count"),
            DB::raw("SUM(CASE WHEN affect LIKE '%Service Affecting%' THEN 1 ELSE 0 END) as service_count")
        )
        ->whereNotNull('main_city')
        ->where('main_city', '!=', '')
        ->groupBy('main_city')
        ->orderByDesc('total')
        ->limit(15)
        ->get();

        $donutOpen = Complaint::open()->count();
        $donutClosed = Complaint::closed()->count();
        $donutPending = Complaint::whereNotIn('status', ['Open','open','Closed','closed','Pending'])->count()
            + Complaint::where('status', 'Pending')->count();
        $donutPending = max(0, $totalComplaints - $donutOpen - $donutClosed);

        $recentComplaints = Complaint::orderByDesc('opened_at')->limit(5)->get();

        $darkCoreByProvider = DarkCoreLink::select('service_provider_name', DB::raw('count(*) as count'))
            ->whereNotNull('service_provider_name')
            ->where('service_provider_name', '!=', '')
            ->groupBy('service_provider_name')
            ->orderByDesc('count')
            ->get();

        $dplcByProvider = DplcDetail::select('service_provider', DB::raw('count(*) as count'))
            ->whereNotNull('service_provider')
            ->where('service_provider', '!=', '')
            ->groupBy('service_provider')
            ->orderByDesc('count')
            ->get();

        $popByCity = NocPopLocation::select('city', DB::raw('count(*) as count'))
            ->whereNotNull('city')
            ->where('city', '!=', '')
            ->groupBy('city')
            ->orderByDesc('count')
            ->get();

        return view('dashboard.index', compact(
            'pageTitle',
            'totalSubscribers',
            'totalP2p',
            'totalComplaints',
            'totalInfrastructure',
            'p2pCount',
            'packageBreakdown',
            'p2pStatusCounts',
            'p2pOwnershipCounts',
            'complaintsOpen',
            'complaintsClosed',
            'complaintsService',
            'darkCoreCount',
            'dplcCount',
            'popCount',
            'timeLabels',
            'timeValues',
            'timePeriod',
            'statusFilter',
            'cityComplaints',
            'donutOpen',
            'donutClosed',
            'donutPending',
            'recentComplaints',
            'darkCoreByProvider',
            'dplcByProvider',
            'popByCity'
        ));
    }
}
