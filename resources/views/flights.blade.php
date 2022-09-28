
@extends('layouts.frontend.app')

@section('content')
@include('layouts.frontend.partials.sidebar')

<?php
foreach ($flights as $flight) {
echo $flight->id;
echo "<br>";  
echo $flight->type;
echo $flight->payload;
}

?>



@endsection




