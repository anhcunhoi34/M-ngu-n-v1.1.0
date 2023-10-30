<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Setting;
use View;
use Auth;
use Session;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        
        View::composer('*', function($view){
            $setting = Setting::first();
            $view->with('setting', $setting);
            $view->with('default_avatar', $setting->default_avatar);
            $view->with('currency', $setting->currency_icon);
        });
    }
}
