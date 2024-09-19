<?php

namespace App\Http\Controllers\Admin\Ecommerce;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Models\Product;
use App\Traits\Upload;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use Vanilo\Category\Models\Taxon;
use Vanilo\Category\Models\Taxonomy;

class ProductController extends Controller
{
    use Upload;
    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            try {
                $requestType = $request->requestType;
                if ($requestType == 'changeState') {
                    $productId = $request->productId;
                    $product = Product::find($productId);
                    $product->state = $product->state == 'active' ? 'inactive' : 'active';
                    $product->save();
                    return response()->json(['message' => 'Product status updated successfully', 'state' => $product->state, 'success' => true]);
                }
                return response()->json(['message' => 'Request type not found', 'success' => false]);
            } catch (\Exception $e) {
                return response()->json(['message' => $e->getMessage(), 'success' => false]);
            }
        }
        $languages = Language::get();
        return view('admin.ecommerce.products.index', compact('languages'));
    }
    public function list(Request $request)
    {
        $products = Product::query()
            ->when(!empty($request->search['value']), function ($query) use ($request) {
                $query->where('name', 'LIKE', '%' . $request->search['value'] . '%')
                    ->orWhere('sku', 'LIKE', '%' . $request->search['value'] . '%')
                    ->orWhere('slug', 'LIKE', '%' . $request->search['value'] . '%')
                    ->orWhere('excerpt', 'LIKE', '%' . $request->search['value'] . '%')
                    ->orWhere('state', 'LIKE', '%' . $request->search['value'] . '%')
                    ->orWhere('description', 'LIKE', '%' . $request->search['value'] . '%');
            })->orderBy('created_at', "DESC");
        return DataTables::of($products)
            ->addColumn('name', function ($item) {
                return $item->name;
            })
            ->addColumn('sku', function ($item) {
                return $item->sku;
            })
            ->addColumn('stock', function ($item) {
                return intval($item->stock).' Units';
            })
            ->addColumn('price', function ($item) {
                return $item->getProductPrice();
            })
            ->addColumn('excerpt', function ($item) {
                return '<p class="text-break text-wrap maximum-two-lines">' . $item->excerpt . '</p>';
            })
            ->addColumn('state', function ($item) {
                $checked = $item->state == 'active' ? 'checked' : '';
                return '<div class="form-check form-switch"><input class="form-check-input product_status" data-id="' . $item->id . '" data-state="' . $item->state . '" type="checkbox" role="switch" ' . $checked .  ' id="product_id_' . $item->state . '" /></div>';
            })
            ->addColumn('action', function ($item) {
                return '<div class="btn-group" role="group"><a class="btn btn-primary btn-sm editBtn" href="' . route('admin.ecommerce.product.edit', [$item->id]) . '"><i class="bi-pencil-fill me-1"></i> Edit</a><a class="btn btn-danger btn-sm deleteBtn" href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#deleteModal" data-route="' . route('admin.ecommerce.attributes.destroy', $item->id) . '"><i class="bi-trash3"></i> Delete</a></div>';
            })
            ->rawColumns(['name', 'sku', 'stock', 'price', 'excerpt', 'state', 'action'])
            ->make(true);
    }
    public function create(Request $request)
    {
        $languages = Language::get();
        $taxonomies = Taxonomy::with('taxons')->get();
        return view('admin.ecommerce.products.create', compact('languages', 'taxonomies'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required| string',
            'sku' => 'required  |string',
            'stock' => 'required|numeric',
            'price' => 'required',
            'images' => 'required|array',
            'excerpt' => 'required |string',
            'description' => ' required | string',
            'status' => 'required|string '
        ]);

        try {
            if (request()->hasFile('images')) {
                $images = [];
                $imagesDriver = null;
                foreach ($request->images as $image) {
                    $upload = $this->fileUpload($image, config('filelocation.product.path'), null, null, 'webp', 60);
                    $images[] = $upload['path'];
                    $imagesDriver = $upload['driver'];
                }
            }

            DB::beginTransaction();

            $product = new Product();
            $product->name = $data['name'];
            $product->sku = $data['sku'];
            $product->stock = $data['stock'];
            $product->price = $data['price'];
            $product->weight = $request->weight;
            $product->width = $request->width;
            $product->height = $request->height;
            $product->length = $request->length;
            $product->excerpt = $data['excerpt'];
            $product->description = $data['description'];
            $product->state = $data['status'];
            $product->images = $images ?? [];
            $product->images_driver = $imagesDriver ?? null;

            $product->save();

            foreach ($request->taxon_id as $taxon_id) {
                $taxon = Taxon::find($taxon_id);
                $product->taxons()->save($taxon);
            }
            if (request()->hasFile('images') && !empty($request->files->filter('images'))) {
                foreach ($request->file('images') as $image) {
                    $product->addMedia($image)->toMediaCollection('product');
                }
            }

            DB::commit();
            return redirect()->route('admin.ecommerce.product.index')->with('success', 'Product created successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }

    public function edit($id, Request $request)
    {
        $taxonomies = Taxonomy::with('taxons')->get();

        $product = $this->getProduct($id);

        $productImages = [];
        foreach ($product->images as $image) {
            $productImages[] = getFile($product->images_driver, $image);
        }

        return view('admin.ecommerce.products.edit', compact('product', 'taxonomies', 'productImages'));
    }

    public function update($id, Request $request)
    {

        $product = Product::findOrFail($id);

        $data = $request->validate([
            'name' => 'required| string',
            'sku' => 'required|string',
            'stock' => 'required|numeric',
            'price' => 'required',
            'images' => 'required|array',
            'excerpt' => 'required | string',
            'description' => 'required | string',
            'status' => 'required|string'
        ]);

        try {
            $productImages = $product->images;
            $images = [];
            $imagesDriver = $product->images_driver;
            if ($request->old) {
                foreach ($request->old as  $oldImage) {
                    $images[] = $productImages[$oldImage];
                }
                foreach ($productImages as $image) {
                    if (!in_array($image, $images)) {
                        $this->fileDelete($product->images_driver, $image);
                    }
                }
            } else {
                if (!$request->hasFile('images')) {
                    return  back()->with('error', 'Images is required');
                } else {
                    foreach ($productImages as $image) {
                        $this->fileDelete($product->images_driver, $image);
                    }
                }
            }
            if (request()->hasFile('images')) {
                foreach ($request->images as $image) {
                    $upload = $this->fileUpload($image, config('filelocation.product.path'), null, null, 'webp', 60);
                    $images[] = $upload['path'];
                    $imagesDriver = $upload['driver'];
                }
            }

            DB::beginTransaction();

            $product->name = $data['name'];
            $product->sku = $data['sku'];
            $product->stock = $data['stock'];
            $product->price = $data['price'];
            $product->weight = $request->weight;
            $product->width = $request->width;
            $product->height = $request->height;
            $product->length = $request->length;
            $product->excerpt = $data['excerpt'];
            $product->description = $data['description'];
            $product->state = $data['status'];
            $product->images =   $images ?? $product->images;
            $product->images_driver = $imagesDriver ?? $product->images_driver;

            $product->save();
            DB::commit();
            return redirect()->route('admin.ecommerce.product.edit', [$product->id])->with('success', 'Product updated successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        try {
            DB::beginTransaction();
            $product->details()->delete();
            $product->delete();
            DB::commit();

            return back()->with('success', 'Product Deleted successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }

    public function getProduct($id): Product
    {
        $product = Product::findOrFail($id);
        $attributes = $product->taxons->pluck('id')->toArray();
        $media = $product->media;

        $urls = [];
        foreach ($media as $item) {
            $image['id'] = $item->id;
            $image['url'] = $item->getUrl();
            $urls[] = $image;
        }

        unset($product->taxons);

        $product->taxons = $attributes;
        $product->imageUrls = $urls;

        return $product;
    }
}
