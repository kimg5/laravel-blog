<?php

namespace App\Http\Controllers\Admin;

use App\Application;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ApplicationController extends Controller
{
    public function index()
    {
        $applications = Application::all();
        return view('admin.applications.index', compact('applications'));
    }
    /**
     * Store a new application in the database.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
/* 
        $application = new Application;

        $application->name = $request->userInputName;
        $application->content = $request->userInputText;

        $application->save();


        return redirect()->back(); */
       
       
    }
}
