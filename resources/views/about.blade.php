@extends('layouts.frontend.app')

@section('content')
<!-- Start top-section Area -->
<section class="top-section-area section-gap">
  <div class="container">
    <div class="row justify-content-between align-items-center d-flex">
      <div class="col-lg-8 top-left">
        <h1 class="text-white mb-20">Laravel is a PHP framework for building web apps.</h1>
        
          <h3>Here are some resources to learn more...</h3>
        
      </div>
    </div>
  </div>
</section>
<!-- End top-section Area -->
<div class="post-wrapper pt-100">
  <!-- Start post Area -->
  <section class="post-area">
    <div class="container">
      <div class="row justify-content-center d-flex">
        <div class="col-lg-8">
          <div class="top-posts pt-50">
            <div class="container">
              <div class="row justify-content-center">
            
                <div class="single-posts col-lg-6 col-sm-6" >
                  <a href="https://www.youtube.com/watch?v=MYyJ4PuL4pY">
            <img class="img-fluid" src="{{asset('frontend/img/tutorial1.jpg')}}" style="width:300px;height:200px" />

                 
                  </a>
                  <div class="detail">
                   
                      <h4 class="pb-5">
                       4-Hour Tutorial by TraversyMedia
                      </h4>
                    </a>
                    <div style="font-size: 1.2rem">
                      Lots of fundamental Laravel concepts are explained in detail in this tutorial.
                    </div>
                 
                  </div>
                </div>
                <div class="single-posts col-lg-6 col-sm-6">
                  <a href="https://laravel.com/docs/9.x">
            <img class="img-fluid" src="{{asset('frontend/img/lara-logo.png')}}" style="width:300px;height:200px" />

                 
                  
                  <div class="detail">
                   
                      <h4 class="pb-5">
                       Official Laravel Documentation
                      </h4>
                    </a>
                    <div style="font-size: 1.2rem">
                      When learning a new technology, it is always best to thoroughly read the documentation.
                    </div>
                 
                  </div>
                </div>
                
          
              
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </div>
  </section>
{{-- team section --}}
<section class="team-area section-gap" id="about">
  <div class="container">
    <div class="row d-flex justify-content-center">
      <div class="col-md-8 col-xl-6 text-center mx-auto">
        <h3>Developer Team</h3>
        <p class="w-lg-50 style=text-align: center">
          This site was designed and developed by SQLizer group
        </p>
      </div>
    </div>
    <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
      <div class="col" style="width: 280px">
        <div class="card border-0 shadow-none">
          <div class="card-body d-flex align-items-center p-0">
            <img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="130" height="130" src="frontend/img/team/kevin.jpg" />
            <div itemscope itemtype="https://schema.org/Person">
              <h6 class="fw-bold text-primary mb-0">
                <span itemprop="name">
                  <strong> Kevin Darby </strong></span>
              </h6>
            </div>
          </div>
        </div>
      </div>
      <div class="col" style="width: 289px">
        <div class="card border-0 shadow-none">
          <div class="card-body d-flex align-items-center p-0">
            <img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="130" height="130" src="frontend/img/team//Nathaniel1.png" />
            <div itemscope itemtype="https://schema.org/Person">
              <h6 class="fw-bold text-primary mb-0">
                <span itemprop="name">
                  <strong> Nathaniel Kwok </strong>
                </span>
              </h6>
            </div>
          </div>
        </div>
      </div>
      <div class="col" style="width: 274px">
        <div class="card border-0 shadow-none">
          <div class="card-body d-flex align-items-center p-0">
            <img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="130" height="130" src="frontend/img/team/Kim.png" />
            <div itemscope itemtype="https://schema.org/Person">
              <h6 class="fw-bold text-primary mb-0">
                <span itemprop="name"><strong>Piao Wenzhe</strong></span>
              </h6>
            </div>
          </div>
        </div>
      </div>
      <div class="col" style="width: 290px">
        <div class="card border-0 shadow-none">
          <div class="card-body d-flex align-items-center p-0">
            <img class="rounded-circle flex-shrink-0 me-3 fit-cover" width="130" height="130" src="frontend/img/team/hilal.jpg" />
            <div itemscope itemtype="https://schema.org/Person">
              <h6 class="fw-bold text-primary mb-0">
                <span itemprop="name">
                  <strong>Hilal Karappan</strong>
                </span>
              </h6>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</section>