
@extends('layouts.frontend.app')


@include('layouts.frontend.partials.sidebar')
@section('title', 'Page Title')
 
@section('sidebar')
    @@parent
 
    <p>This is appended to the master sidebar.</p>
@stop
 
@section('content')
    <p>This is my body content.</p>

<?php
foreach ($reports as $report) {
echo $report->id;
echo "<br>";  
echo $report->type;
echo $report->issue;
echo $report->created_at;
}

?>




@endsection




