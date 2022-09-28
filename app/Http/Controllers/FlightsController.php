<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class FlightsController extends Controller
{
    public function index()
    {
         $flights = DB::select('select * from flights'); 
        //$posts = Post::latest()->take(6)->published()->get();
        return view('flights', compact('flights'));
    }
}
