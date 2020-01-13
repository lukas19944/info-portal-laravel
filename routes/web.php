<?php

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


use App\Gallery;
use Illuminate\Support\Facades\Route;
use function foo\func;


//Route::get('/', function () {
//    return view('main');
//});

Auth::routes();

Route::get('/', function (){
    return view('main');
})->name('home');

Route::resource('/admin/users', 'Admin\UsersController', ['except'=>['show','create','store']]);

Route::namespace('Admin')->prefix('admin')->name('admin.')->middleware('can:manage-users')->group(function(){
    Route::resource('/users', 'UsersController', ['except'=>['show','create','store']]);

});

Route::get('/users/profile/{name}', 'Users\ProfileController@index')->name('users.profile.index');
Route::post('/users/profile/update', 'Users\ProfileController@update')->name('users.profile.update');
Route::post('/users/profile', 'Users\ProfileController@changePassword')->name('users.profile.changePassword');
Route::get('/user/{name}', 'Users\ProfileController@showProfile')->name('users.profile.showProfile');

//Route::get('/articles/add', function (){
//    return view('articles.add');
//})->name('articles.add');


Route::namespace('Articles')->group(function() {
    Route::resource('/articles', 'ArticlesController');
});

Route::get('articles/tag/{name}', 'Articles\TagsController@showByTag')->name('articles.tag.showByTag');

Route::get('gallery/{name}/addimage','Gallery\GalleriesController@addImage')->name('gallery.addimage');
Route::resource('/gallery', 'Gallery\GalleriesController',['except'=>['edit','update']]);

Route::prefix('gallery/{gallery_name}/image')->name('image.')->group(function (){
    Route::get('{image}','Gallery\ImagesController@show')->name('show');
    Route::get('{image}/edit', 'Gallery\ImagesController@edit')->name('edit');


});

Route::resource('/image', 'Gallery\ImagesController',['except'=>['index','edit','show']]);


