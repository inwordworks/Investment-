<?php

namespace App\Livewire;

use Livewire\Component;

class Homepage extends Component
{
    public function render()
    {
        // print_r([
        //     'SERVER' => $_SERVER,
        //     // 'path_info' => isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : null,
        //     'full_path' => url($_SERVER['REQUEST_URI']),
        //     'route' => route('website.homepage')
        // ]);
        // return;
        return view('livewire.homepage');
    }
}
