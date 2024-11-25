<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminPollController extends Controller
{
    public function index()
    {
        return view('admin.dashboard');
    }
}
