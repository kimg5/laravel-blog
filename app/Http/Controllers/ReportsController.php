<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\report;

use Illuminate\Support\Facades\DB;

class ReportsController extends Controller
{
    public function index()
    {
         //$reports = DB::select('select * from reports'); 
        //$posts = Post::latest()->take(6)->published()->get();
        return view('reports');
    }

    public function store(Request $request) {
        
        $date= date_create("now",timezone_open("America/New_York"));

        $report = new report();
        $report -> type = $request->type;
        $report -> severity = $request-> severity;
        $report ->priority = $request->priority;
        $report ->summary = $request->summary;
        $report -> description = $request->description;
        $report -> name = $request -> name;
        $report -> created_at =  $date;
        $report->save();

        return view('reports');

    }
}
