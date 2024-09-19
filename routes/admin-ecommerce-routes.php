<?php

use App\Http\Controllers\Admin\Ecommerce\AttributeController;
use App\Http\Controllers\Admin\Ecommerce\CategoryController;
use App\Http\Controllers\Admin\Ecommerce\OrderController;
use App\Http\Controllers\Admin\Ecommerce\ProductController;
use Illuminate\Support\Facades\Route;
use Vanilo\Category\Models\Taxonomy;

Route::group(['prefix' => 'attributes', 'as' => 'attributes.'], function () {
    Route::get('/', [AttributeController::class, 'index'])->name('index');
    Route::get('list', [AttributeController::class, 'list'])->name('list');
    Route::post('store', [AttributeController::class, 'store'])->name('store');
    Route::get('edit/{id}', [AttributeController::class, 'edit'])->name('edit');
    Route::put('update/{id}', [AttributeController::class, 'update'])->name('update');
    Route::delete('delete/{id}', [AttributeController::class, 'destroy'])->name('destroy');

    // single taxomy data
    Route::get('{slug}', [AttributeController::class, 'singleAttribute'])->name('single_attribute');
    Route::get('{slug}/list', [AttributeController::class, 'singleAttribute_list'])->name('single_attribute_list');
    Route::post('{slug}/store', [AttributeController::class, 'singleAttribute_store'])->name('single_attribute_store');
    Route::get('{slug}/edit/{id}', [AttributeController::class, 'singleAttribute_edit'])->name('single_attribute_edit');
    Route::put('{slug}/update/{id}', [AttributeController::class, 'singleAttribute_update'])->name('single_attribute_update');
    Route::delete('{slug}/delete/{id}', [AttributeController::class, 'singleAttribute_destroy'])->name('single_attribute_destroy');
});

Route::group(['prefix' => 'product', 'as' => 'product.'], function () {
    Route::match(['get','post'],'/', [ProductController::class, 'index'])->name('index');
    Route::get('list', [ProductController::class, 'list'])->name('list');
    Route::match(['get','post'],'create', [ProductController::class, 'create'])->name('create');
    Route::post('store', [ProductController::class, 'store'])->name('store');
    Route::get('edit/{id}', [ProductController::class, 'edit'])->name('edit');
    Route::put('update/{id}', [ProductController::class, 'update'])->name('update');
});

Route::group(['prefix' => 'order', 'as' => 'order.'], function () {
    Route::get('/', [OrderController::class, 'index'])->name('index');
});
