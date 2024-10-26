<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RolePermissionController;
use Illuminate\Support\Facades\Auth;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::group(['middleware' => ['auth']], function(){

    // Route::get('/post', [PostController::class, 'index'])->name('post.index');
Route::get('/post/create', [PostController::class, 'createPage'])->name('post.create');
Route::post('/add/post', [PostController::class, 'create'])->name('add.post');
Route::get('/post/edit/{id}', [PostController::class, 'edit'])->name('edit.post');
Route::post('/post/update/{id}', [PostController::class,'savePost'])->name('update.post');
Route::delete('/post/delete/{id}', [PostController::class, 'destroy'])->name('delete.post');
Route::get('/post/search', [PostController::class, 'postSearch'])->name('post.search');

Route::get('/role', [RolePermissionController::class, 'getRole'])->name('get.role');
Route::get('/add/role/page', [RolePermissionController::class, 'RolePage'])->name('role.page');
Route::get('/role/edit/{id}', [RolePermissionController::class, 'edit'])->name('edit.role');
Route::post('/role/update/{id}', [RolePermissionController::class,'updateRole'])->name('update.role');
Route::post('/add/role', [RolePermissionController::class, 'createRole'])->name('create.role');
Route::delete('/role/delete/{id}', [RolePermissionController::class, 'destroy'])->name('delete.role');

Route::get('/home', [PostController::class, 'index'])->name('home');

});



Auth::routes();
