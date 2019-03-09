@extends('admin.master')
<!--Page Title-->
@section('page-title')
    Edit Center
@endsection

<!--Page Header-->
@section('page-header')
    Edit Center
@endsection

<!--Page Content Start Here-->
@section('page-content')
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="main_part">
                    <br>
                    @if(Session::has('message'))
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4 alert {{ Session::get('alert-class', 'alert-info') }}">{{ Session::get('message') }}</div>
                        </div>
                @endif
                <!-- Code Here.... -->
                    <div class="row">
                        <div class="col-md-4">
                            <div class="change_passport_body" style="width: 100% !important;">
                                <p class="form_title_center">
                                    <i>-Edit Center Name-</i>
                                </p>
                                <form action="{{URL::to('/update-center')}}" method="POST">
                                    <input type="hidden" name="id" value="{{$names->id}}" >
                                    {{ csrf_field() }}
                                    <div class="form-group">
                                        <label for="form_date"><i>Center Type:</i></label>
                                        <select class="form-control" name="center_type" required>
                                            <option value="">Select Item</option>
                                            @foreach ($centers as $center)
                                                <option value="{{ $center->center_type }}" <?php if ($center->center_type == $names->center_type){ echo 'selected'; } ?>> {{ $center->center_type }} </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="form_date"><i>Center:</i></label>
                                        <input type="text" class="form-control" name="center_name" value="{{$names->center_name}}" autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="form_date"><i>Region:</i></label>
                                        <input type="text" class="form-control" name="region" value="{{$names->region}}" autocomplete="off">
                                    </div>
                                    <hr>
                                    <div class="footer-box">
                                        <button type="reset" class="btn btn-danger">RESET</button>
                                        <button type="submit" id="submit" class="btn btn-info pull-right">STORE</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-8">

                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </section>
@endsection
<!--Page Content End Here--