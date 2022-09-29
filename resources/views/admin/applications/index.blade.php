@extends('layouts.backend.app')
@push('header')
<link rel="stylesheet" href="{{asset('backend/vendors/datatables.net-bs4/css/dataTables.bootstrap4.min.css')}}" />
<link rel="stylesheet" href="{{asset('backend/vendors/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css')}}" />
<link rel="stylesheet" href="http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
@endpush
@section('content')
    <div id="right-panel" class="right-panel">
        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Dashboard</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Dashboard</a></li>
                            <li>
                                <a href="#" class="active">Applications Table</a>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Applications Table</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table-export" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID #</th>
                                            <th>Name</th>
                                            <th>Content</th>                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($applications as $key => $application)
                                        <tr>
                                            <td>{{$key+1}}</td>
                                            <td>{{$application->name}}</td>
                                            <td>{{$application->content}}</td>                                        
                                            <td>
                                                <!-- Button trigger modal -->
                                              <button type="button" class="btn btn-primary mb-1" data-toggle="modal"
                                                    data-target="#viewModal-{{$application->id}}">
                                                    <i class="fa fa-eye"></i>
                                                </button>

                                              
                                                <button type="button" class="btn btn-danger mb-1" data-toggle="modal"
                                                    data-target="#deleteModal-{{$application->id}}">
                                                    <i class="fa fa-trash-o"></i>
                                                </button> 
                                            </td>
                                        </tr>
                                        @endforeach

                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {{-- <!-- .animated -->
            <div class="animated">
               @foreach ($applications as $application)
               <div class="modal fade" id="viewModal-{{$user->id}}" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel"
                data-backdrop="static" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mediumModalLabel">View</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <p class="form-control-static">{{$application->name}}</p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Content</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <p class="form-control-static">{{$application->content}}</p>
                                </div>
                            </div>
                          
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Created At</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <p class="form-control-static">{{$application->created_at}}</p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3"><label class=" form-control-label">Updated At</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <p class="form-control-static">{{$application->updated_at}}</p>
                                </div>
                            </div>
                          
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="editModal-{{$application->id}}" tabindex="-1" role="dialog" aria-labelledby="mediumModalLabel"
                data-backdrop="static" aria-hidden="true" style="display: none;">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="mediumModalLabel">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="{{route('admin.user.update', $application->id)}}" method="post" id="editUser-{{$user->id}}" enctype="multipart/form-data" class="form-horizontal">
                                @csrf
                                @method('PUT')
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <p class="form-control-static">{{$application->name}}</p>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">User Id</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <p class="form-control-static">{{$application->content}}</p>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">Role</label>
                                    </div>
                                    <div class="col col-md-9">
                                        <div class="form-check">
                                            @foreach ($roles as $role)
                                            <div class="radio">
                                                <label for="radio1" class="form-check-label ">
                                                    <input type="radio" id="radio1" name="role" value="{{$role->id}}"
                                                        class="form-check-input" {{$user->role->id == $role->id ? 'checked' : "" }}>{{$role->name}}
                                                </label>
                                            </div>
                                            @endforeach

                                        </div>
                                    </div>
                                </div>
                               
                            </form>
                        </div>
                    </div>
                </div>
            </div>
     
               @endforeach


                <!-- .content -->
            </div>

 --}}
<!-- .content -->
@endsection

@push('footer')

<script src="{{asset('backend/vendors/datatables.net/js/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('backend/vendors/jszip/dist/jszip.min.js')}}"></script>
<script src="{{asset('backend/vendors/pdfmake/build/pdfmake.min.js')}}"></script>
<script src="{{asset('backend/vendors/pdfmake/build/vfs_fonts.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('backend/vendors/datatables.net-buttons/js/buttons.colVis.min.js')}}"></script>
<script src="{{asset('backend/assets/js/init-scripts/data-table/datatables-init.js')}}">
    <script>
        $(document).ready(function () {

            (function ($) {

                $('#filter').keyup(function () {

                    var rex = new RegExp($(this).val(), 'i');
                    $('.searchable tr').hide();
                    $('.searchable tr').filter(function () {
                        return rex.test($(this).text());
                    }).show();

                })

            }(jQuery));

        });
    </script>
    <script src="http://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
        <script src="http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
        {!! Toastr::message() !!}
@endpush
