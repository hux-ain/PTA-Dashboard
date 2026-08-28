<?php

namespace App\Http\Controllers\Concerns;

use Illuminate\Http\Request;

trait ManagesCrud
{
    public function edit($id)
    {
        $this->ensureCrudAdmin();
        $record = ($this->crudModel)::findOrFail($id);
        $pageTitle = 'Edit ' . $this->crudLabel;

        return view($this->crudView, compact('pageTitle', 'record'));
    }

    public function update(Request $request, $id)
    {
        $this->ensureCrudAdmin();
        $record = ($this->crudModel)::findOrFail($id);
        $record->update($request->validate($this->crudRules));

        return redirect()->route($this->crudRoute)->with('success', $this->crudLabel . ' updated successfully!');
    }

    public function destroy($id)
    {
        if (auth()->user()->role !== 'super_admin') {
            abort(403, 'Unauthorized - Only Super Admin can delete records');
        }

        ($this->crudModel)::findOrFail($id)->delete();

        return redirect()->route($this->crudRoute)->with('success', $this->crudLabel . ' deleted successfully!');
    }

    private function ensureCrudAdmin(): void
    {
        if (!in_array(auth()->user()->role, ['Admin', 'super_admin'])) {
            abort(403, 'Unauthorized - Only Admin can edit records');
        }
    }
}
