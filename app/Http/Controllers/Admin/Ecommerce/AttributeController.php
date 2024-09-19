<?php

namespace App\Http\Controllers\Admin\Ecommerce;

use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use Vanilo\Category\Models\Taxonomy;
use Vanilo\Category\Models\Taxon;

class AttributeController extends Controller
{
    // main attribute / Taxonomy
    public function index(): View
    {
        $languages = Language::get();
        return view('admin.ecommerce.attributes.index', compact('languages'));
    }
    public function list(Request $request)
    {
        $categories = Taxonomy::query()
            ->withCount('taxons')
            ->when(!empty($request->search['value']), function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->search['value'] . '%');
            })
            ->orderBy('created_at', "DESC");
        return DataTables::of($categories)
            ->addColumn('name', function ($category) {
                return $category->name;
            })
            ->addColumn('taxons_count', function ($category) {
                return $category->taxons_count;
            })
            ->addColumn('slug', function ($category) {
                return $category->slug;
            })
            ->addColumn('action', function ($item) {
                return '<div class="btn-group" role="group">
                    <a class="btn btn-primary btn-sm editBtn" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#editModal" data-route="' . route('admin.ecommerce.attributes.update', [$item->id]) . '" data-name="' . $item->name . '">
                      <i class="bi-pencil-fill me-1"></i> Edit
                    </a>
                    <a class="btn btn-danger btn-sm deleteBtn" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#deleteModal" data-route="' . route('admin.ecommerce.attributes.destroy', $item->id) . '">
                      <i class="bi-trash3"></i> Delete
                    </a>

                  </div>';
            })
            ->rawColumns(['name', 'taxons_count', 'slug', 'action'])
            ->make(true);
        //route('admin.project.edit', [$item->id])
        // route('admin.project.destroy', $item->id)
    }
    public function store(Request $request)
    {
        $data = $request->validate(['name' => 'required | string']);

        try {
            DB::beginTransaction();

            $taxonomy = new Taxonomy();
            $taxonomy->name = $data['name'];
            $taxonomy->save();

            DB::commit();
            return redirect()->route('admin.ecommerce.attributes.index')->with('success', 'Attribute created successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }
    public function update(Request $request, $id)
    {
        $taxonomy = Taxonomy::findOrFail($id);
        $data = $request->validate(['name' => 'required | string']);

        try {
            DB::beginTransaction();

            $taxonomy->name = $data['name'];
            $taxonomy->save();

            DB::commit();
            return back()->with('success', 'Attribute Updated successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }
    public function destroy(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $taxonomy = Taxonomy::findOrFail($id);
            $taxonomy->delete();
            DB::commit();
            return back()->with('success', 'Attribute Deleted successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }

    // child attributes / sub categories / taxons
    public function singleAttribute($slug, Request $request)
    {
        $taxonomy = Taxonomy::where('slug', $slug)->first();
        $attributes = Taxonomy::select('id', 'name')->get();
        return view('admin.ecommerce.attributes.single', compact('taxonomy', 'attributes'));
    }
    public function singleAttribute_list($id, Request $request)
    {
        $categories = Taxon::query()
            ->byTaxonomy($id)
            ->when(!empty($request->search['value']), function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->search['value'] . '%');
            })
            ->orderBy('created_at', "DESC");
        return DataTables::of($categories)
            ->addColumn('name', function ($category) {
                return $category->name;
            })
            ->addColumn('subtitle', function ($category) {
                return $category->subtitle;
            })
            ->addColumn('slug', function ($category) {
                return $category->slug;
            })
            ->addColumn('action', function ($item) {
                return '<div class="btn-group" role="group">
                    <a class="btn btn-primary btn-sm editBtn" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#editModal" data-route="' . route('admin.ecommerce.attributes.single_attribute_update', [$item->taxonomy->slug, $item->id]) . '" data-name="' . $item->name . '" data-subtitle="' . $item->subtitle . '" data-taxonomy_id="' . $item->taxonomy_id . '">
                      <i class="bi-pencil-fill me-1"></i> Edit
                    </a>
                    <a class="btn btn-danger btn-sm deleteBtn" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#deleteModal" data-route="' . route('admin.ecommerce.attributes.single_attribute_destroy', [$item->taxonomy->slug, $item->id]) . '">
                      <i class="bi-trash3"></i> Delete
                    </a>

                  </div>';
            })
            ->rawColumns(['name', 'subtitle', 'slug', 'action'])
            ->make(true);
    }
    public function singleAttribute_store($slug, Request $request)
    {
        $attribute = Taxonomy::where('slug', $slug)->first();
        $data = $request->validate([
            'name' => 'required | string',
        ]);

        try {
            DB::beginTransaction();

            $taxonomy = new Taxon();
            $taxonomy->name = $data['name'];
            $taxonomy->taxonomy_id = $attribute->id;
            $taxonomy->subtitle = $request->subtitle;
            $taxonomy->save();

            DB::commit();
            return redirect()->route('admin.ecommerce.attributes.single_attribute', $attribute->slug)->with('success', $attribute->name . ' created successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }
    public function singleAttribute_update($slug, $id, Request $request)
    {
        $attribute = Taxonomy::where('slug', $slug)->first();
        $taxonomy = Taxon::findOrFail($id);
        $data = $request->validate([
            'name' => 'required | string',
        ]);

        try {
            DB::beginTransaction();

            $taxonomy->name = $data['name'];
            $taxonomy->taxonomy_id = $attribute->id;
            $taxonomy->subtitle = $request->subtitle;
            $taxonomy->save();

            DB::commit();
            return back()->with('success', $taxonomy->name . ' Updated successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }
    public function singleAttribute_destroy($slug, $id)
    {
        try {
            DB::beginTransaction();
            $taxonomy = Taxon::findOrFail($id);
            $name = $taxonomy;
            $taxonomy->delete();
            DB::commit();
            return back()->with('success', $name . ' Deleted successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }
}
