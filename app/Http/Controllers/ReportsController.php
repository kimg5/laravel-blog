<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class ReportsController extends Controller
{
    public function index()
    {
         $reports = DB::select('select * from reports'); 
        //$posts = Post::latest()->take(6)->published()->get();
        return view('reports', compact('reports'));
    }
}
