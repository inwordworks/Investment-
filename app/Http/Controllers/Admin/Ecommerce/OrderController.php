<?php

namespace App\Http\Controllers\Admin\Ecommerce;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Product;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function index(): View
    {
        $languages = Language::get();
        return view('admin.ecommerce.attributes.index', compact('languages'));
    }
    public function list(Request $request)
    {
        $categories = Product::query()
            // ->withCount('taxons')
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
}
