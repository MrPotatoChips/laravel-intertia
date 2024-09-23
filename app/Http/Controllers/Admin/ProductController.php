<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ProductStoreRequest;
use App\Http\Requests\Admin\ProductUpdateRequest;
use App\Models\Product;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response as InertiaResponse;
use Storage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request) : InertiaResponse
    {
        $search = $request->search ?: '';
        $sort = $request->sort ?: 'id';
        $order = $request->order ?: 'asc';

        return Inertia::render(
            component: 'Admin/Products/Index',
            props: [
                'products' => Product::where(
                    function ($query) use ($search){
                        if (filled($search)) {
                            return $query->where('product_name', 'like', "%$search%");
                        }
                    }
                )
                ->orderBy($sort, $order)
                ->paginate(3),
                'filters' => [
                    'sort' => $sort,
                    'order' => $order,
                    'search' => $search
                ]
            ]
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ProductStoreRequest $request) : RedirectResponse
    {
        $product = new Product($request->validated());
        $product->save();

        return Redirect::to(route('products.index'))->with([
            'message' => 'Product has been Created!'
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id) : InertiaResponse
    {
        return Inertia::render(
            component: 'Admin/Products/Show',
            props: [
                'product' => Product::find($id)
            ]
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(ProductUpdateRequest $request, string $id) : RedirectResponse
    {
        $product = Product::findOrFail($id);
        $product->update($request->validated());

        return Redirect::to(route('products.index'))->with([
            'message' => 'Product has been Updated!'
        ]);
    }

    public function upload(Request $request) {
        if ($request->hasFile('file')) {
            $file = Storage::putFile(
                path: 'temp',
                file: $request->file('file')
            );
        }

        return response()->json([
          'file' => $request->file()
        ]);
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
