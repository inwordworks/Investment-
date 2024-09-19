<?php

return [
    'modules' => [
        /**
         * Example:
         * VendorA\ModuleX\Providers\ModuleServiceProvider::class,
         * VendorB\ModuleY\Providers\ModuleServiceProvider::class
         *
         */
        Vanilo\Foundation\Providers\ModuleServiceProvider::class,
        // Vanilo\Product\Providers\ModuleServiceProvider::class
        // Vanilo\Foundation\Providers\ModuleServiceProvider::class => [
        //     // Currency settings
        //     'currency'    => [
        //         'code'   => 'INR',
        //         'sign'   => '₹',
        //         // For the format_price() template helper method:
        //         'format' => '%1$g%2$s'
        //         /* Amount is the first argument, currency is the second:
        //         'format' => '%2$s/%1$g'
        //         */
        //     ],
        //     // 'foundation' => [
        //     //     'image'       => [
        //     //         'product' => [
        //     //             'variants' => [
        //     //                 'thumbnail' => [ // Name of the image variant
        //     //                     'width'  => 250,
        //     //                     'height' => 250,
        //     //                     'fit'    => 'crop'
        //     //                 ],
        //     //                 'cart' => [ // Image variant names can be arbitrary
        //     //                     'width'  => 120,
        //     //                     'height' => 90,
        //     //                     'fit'    => 'crop'
        //     //                 ]
        //     //             ]
        //     //         ],
        //     //         'taxon' => [
        //     //             'variants' => [
        //     //                 'thumbnail' => [
        //     //                     'width'  => 320,
        //     //                     'height' => 180,
        //     //                     'fit'    => 'crop'
        //     //                 ],
        //     //                 'banner' => [
        //     //                     'width'  => 1248,
        //     //                     'height' => 702,
        //     //                     'fit'    => 'crop'
        //     //                 ]
        //     //             ]
        //     //         ]
        //     //     ]
        //     // ]
        // ],
    ],
    'register_route_models' => true
];
