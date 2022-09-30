@extends('layouts.frontend.app')

@section('content')
<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-md-8 top-left">
        <h1 class="text-white mb-20">We are looking for volunteer admins</h1>
<h3>Fill out the form below to tell us why you would be a good fit.</h3>
        
      </div>
    </div>
  </div>
</section>
<!-- End top-section Area -->

<!-- Form section -->
     <section>
     <div class="row justify-content-center d-flex">
      <div class="col-md-8">
    <form style="width:33%; margin:auto;  margin-top:2rem;" action="{{route('receiveApplication')}}" method="POST">
  <div class="form-outline mb-4">
    <label for="userInputName"><b>Your Name</b> </label>
    <input type="text" class="form-control" id="userInputName" name="userInputName" placeholder="Enter Your Name">
   
  </div>
  <div class="form-outline mb-4">
    <label for="userInputText"><b>Why do you want to be an admin?</b></label>
    <input type="textarea" class="form-control" id="userInputText"  name="userInputText"  placeholder="Your reason here">
  </div>
 
  <button type="submit" class="btn btn-primary btn-block mb-4">Submit</button>
 <div id="thankYouMessage" style="text-align: center; margin: 0 auto;font-size:1.25rem;">

<?php
if (isset($_POST['userInputName'])) { 

   
                  echo "All Data Submitted Successfully!<br />";
  echo "One of our team members will be in touch shortly.";
                
}
?></div>

 </div>

   @include('layouts.frontend.partials.sidebar')
  </div>
</section>
<!-- End Form Area -->

@endsection
