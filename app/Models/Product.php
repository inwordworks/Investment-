<?php

namespace App\Models;

use Vanilo\Product\Models\Product as BaseProduct;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Vanilo\Contracts\Buyable;
use Vanilo\Support\Traits\BuyableModel;
use Vanilo\Support\Traits\HasImagesFromMediaLibrary;
use Illuminate\Database\Eloquent\Relations\MorphToMany;
use Vanilo\Category\Models\TaxonProxy;


class Product extends BaseProduct implements Buyable, HasMedia
{
    use BuyableModel; // Implements Buyable methods for common Eloquent models
    use HasImagesFromMediaLibrary; // Implements Buyable's image methods using Spatie Media Library
    use InteractsWithMedia; // Spatie package's default trait


    protected $casts = [
        'images' => 'array',
    ];

    public function getImages()
    {
        $images = [];
        foreach ($this->images as $image) {
            $images[] = getFile($this->images_driver, $image);
        }
        return $images;
    }

    public function getProductPrice()
    {
        return currencyPosition($this->price + 0);
    }
    // Define relationships with Projects and Investments
    public function projects()
    {
        return $this->hasMany(Project::class);
    }

    public function investments()
    {
        return $this->hasMany(InvestmentPlan::class);
    }

    public function taxons(): MorphToMany
    {
        return $this->morphToMany(
            TaxonProxy::modelClass(),
            'model',
            'model_taxons',
            'model_id',
            'taxon_id'
        );
    }
}
