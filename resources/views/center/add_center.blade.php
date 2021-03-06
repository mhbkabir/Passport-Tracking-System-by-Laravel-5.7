@extends('admin.master')
<!--Page Title-->
@section('page-title')
    Add Center
@endsection

<!--Page Header-->
@section('page-header')
    Add Center
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
                                    <i>-Add Center Name-</i>
                                </p>
                                <form action="{{URL::to('/store-center-name')}}" method="POST">
                                    {{ csrf_field() }}
                                    <div class="form-group">
                                        <label for="form_date"><i>Center Type:</i></label>
                                        <select class="form-control" name="center_type" required>
                                            <option value="">Select Item</option>
                                            @foreach ($centers as $center)
                                                <option value="{{ $center->center_type }}"> {{ $center->center_type }} </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="form_date"><i>Center:</i></label>
                                        <input type="text" class="form-control" name="center_name" value="" autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="form_date"><i>Region:</i></label>
                                        <input type="text" class="form-control" name="region" value="" autocomplete="off">
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
                            <div class="table_view" style="padding: 10px">
                                <div class="panel-body">
                                    <table width="80%" class="table-bordered table" style="font-size:14px;">
                                        <thead style="background:#ddd">
                                        <tr>
                                            <th scope="col">SL</th>
                                            <th scope="col">Center Name</th>
                                            <th scope="col">Center Tye</th>
                                            <th scope="col">Region</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php $i = 0; ?>
                                        @foreach($names as $center)
                                            <?php $i++; ?>
                                            <tr>
                                                <th scope="row">{{$i}}</th>
                                                <td>{{$center->center_name}}</td>
                                                <td>{{$center->center_type}}</td>
                                                <td>{{$center->region}}</td>
                                                <td>
                                                <a href="{{URL::to('/edit-center/'.$center->id)}}"><button class="btn btn-warning">Edit </button></a>
                                                <a href="{{URL::to('/delete-center/'.$center->id)}}"><button class="btn btn-danger">Delete</button></a>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                    <!-- /.table-responsive -->

                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </section>
@endsection
<!--Page Content End Here--