{{-- components/pagination.blade.php --}}

@if ($paginator->hasPages())
    <div class="d-flex justify-content-between align-items-center px-4 py-3 bg-white rounded-bottom">
        {{-- Entry Count --}}
        <div class="text-muted" style="font-size: 0.8rem; font-weight: 500;">
            Showing <span class="text-dark">{{ $paginator->firstItem() }}</span> to <span class="text-dark">{{ $paginator->lastItem() }}</span> of <span class="text-dark">{{ $paginator->total() }}</span> entries
        </div>
        
        {{-- Pagination Links --}}
        <div class="pagination-container">
            {!! $paginator->links() !!}
        </div>
    </div>
@endif
