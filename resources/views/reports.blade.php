
@extends('layouts.frontend.app')

@section('content')
<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-lg-8 top-left">
        <h1 class="text-white mb-20">Report an Issue</h1>
        <ul>
          <li>
            <a href="/">Home</a
            ><span class="lnr lnr-arrow-right"></span>TY
          </li>
          <li>
            <a href="/categories">Category</a
            ><span class="lnr lnr-arrow-right"></span>
          </li>
          <li><a href="/reports">Reports</a></li>
        </ul>
      </div>
    </div>
  </div>
</section>
<!-- End top-section Area -->
<!DOCTYPE html>
<html>
<head>
    <title>SQLizer Feedback and Reports</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-4">
  @if(session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
  @endif
  <div class="card">
    <div class="card-header text-center font-weight-bold">
    Fill out this form if you find an issue. We appreciate the feedback!
    </div>
    <div class="card-body">
      <form name="add-blog-post-form" id="add-blog-post-form" method="post" action="{{route('reports_store')}}">
       @csrf
       <div style="padding-bottom: 18px;">Reported by<span style="color: red;"> *</span><br/>
        <input type="text" id="name" name="name" style="max-width : 450px;" class="form-control"/>
        </div>
        <div style="padding-bottom: 18px;">
        <label for="type" >Type</label>
        <select id="type" name="type" style="max-width : 300px;" class="form-control">
          <option value="Inappropriate Content">Inappropriate Content</option>
          <option value="Spam">Spam</option>
          <option value="Bug/Error">Bug/Error</option>
        </select>
        </div>
        <div style="padding-bottom: 18px;">
        <label for="severity">Severity</label>
        <select id="severity" name="severity" style="max-width : 300px;" class="form-control">
          <option value="Minor">Minor</option>
          <option value="Moderate">Moderate</option>
          <option value="Serious">Serious</option>
          <option value="critical">Critical</option>
        </select>
        </div>
        <div style="padding-bottom: 18px;">Priority<br/>
        <select id="priority" name="priority" style="max-width : 300px;" class="form-control">
        <option value = "low">Low</option>
        <option value="medium" >Medium</option>
        <option value="high" >High</option>
        </select>
        </div>
        <div style="padding-bottom: 18px;">Summary<span style="color: red;"> *</span><br/>
        <input required="" type="text" id="summary" name="summary" style="max-width : 450px;" class="form-control"/>
        </div>
        <div class="form-group">
          <label for="issue">Please describe Issue</label>
          <textarea name="description" class="form-control" required=""></textarea>
        </div>
        {{ csrf_field() }}
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </div>
</div>  
</body>
</html>


<?php
/*foreach ($reports as $report) {
echo $report->id;
echo "<br>";  
echo $report->type;
echo $report->issue;
echo $report->created_at;
}*/

?>




@endsection
@push('footer')



