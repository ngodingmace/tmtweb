<?php

use App\Http\Controllers\Pemohon_Controller;
use App\Http\Controllers\FormController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::group(['namespace' => 'App\Http\Controllers'], function()
{
    /**
     * Home Routes
     */
    Route::get('/', 'HomeController@index')->name('home.index');
    Route::get('/form', [FormController::class, 'index'])->name('form');
    Route::post('/store', [FormController::class, 'store'])->name('form.store');
    Route::post('form', [FormController::class, 'create'])->name('form.create');

    Route::group(['middleware' => ['guest']], function() {
        /**
         * Register Routes
         */
        Route::get('/register', 'RegisterController@show')->name('register.show');
        Route::post('/register', 'RegisterController@register')->name('register.perform');

        /**
         * Login Routes
         */
        Route::get('/login', 'LoginController@show')->name('login.show');
        Route::post('/login', 'LoginController@login')->name('login.perform');

    });

    Route::group(['middleware' => ['auth']], function() {
        /**
         * Logout Routes
         */
        Route::post('/admin/delete-by-month', [PemohonController::class, 'deleteByMonth'])->name('admin.deleteByMonth');
        Route::get('/data-pemohon', 'App\Http\Controllers\Pemohon_Controller@dataPemohon')->name('dataPemohon');
        Route::get('admin/data-Pemohon', 'App\Http\Controllers\Pemohon_Controller@dataPemohon')->name('admin.dataPemohon');
        Route::get('/admin/{id}/data', 'App\Http\Controllers\Pemohon_Controller@getAdminData');
        Route::get('/admin/ngeprint/{id}', 'App\Http\Controllers\Pemohon_Controller@ngeprint')->name('admin.ngeprint');
        Route::resource('admin', Pemohon_Controller::class);
        Route::get('/logout', 'LogoutController@perform')->name('logout.perform');
    });
});
