<?php

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\PollController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function ()
{
    return view('welcome');
});


Route::get('/dashboard', function ()
{
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function ()
{
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::middleware(['auth'])->group(function ()
{
    Route::get('/poll', [PollController::class, 'index'])->name('poll.index');
    Route::post('/poll/store', [PollController::class, 'store'])->name('poll.store');
    Route::post('/poll/vote', [PollController::class, 'votes'])->name('poll.vote');
    Route::get('/poll/vote/{id}', [PollController::class, 'delete'])->name('poll.delete');
    Route::get('/poll/filter', [PollController::class, 'filter'])->name('poll.filter');
});

Route::middleware(['admin'])->group(function ()
{
    Route::get('/admin/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');
    Route::post('/admin/poll/status/{id}', [AdminController::class, 'toggleStatus'])->name('admin.poll.status');
    Route::get('/admin/poll/delete/{id}', [AdminController::class, 'destroy'])->name('admin.poll.delete');
    Route::get('/admin/poll/stats/{id}', [AdminController::class, 'stats'])->name('admin.poll.stats');
});

require __DIR__ . '/auth.php';
