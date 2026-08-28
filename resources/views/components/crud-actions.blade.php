@if(in_array(auth()->user()->role, ['Admin', 'super_admin']))
    <a href="{{ route($routePrefix . '.edit', $record->id) }}" class="btn btn-sm btn-outline-primary" title="Edit"><i class="fa-solid fa-pen"></i></a>
@endif
@if(auth()->user()->role === 'super_admin')
    <form action="{{ route($routePrefix . '.destroy', $record->id) }}" method="POST" class="d-inline">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-sm btn-outline-danger" title="Delete" onclick="return confirm('Delete this record permanently?')"><i class="fa-solid fa-trash"></i></button>
    </form>
@endif
