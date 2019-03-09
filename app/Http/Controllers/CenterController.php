<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\User;
use Session;

class CenterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = array();
        $data['centers'] = DB::table('tbl_center_type')->get();
        $data['names'] = DB::table('tbl_center')->get();
        return view('center.add_center', $data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $center_type = $request->input('center_type');
        $center_name = $request->input('center_name');
        $region = $request->input('region');

        $inserted = DB::table('tbl_center')->insert(
            [   'center_name' => $center_name,
                'center_type' => $center_type,
                'region' => $region,
                'created_at' => date('Y-m-d H:i:s')
            ]);

        if ($inserted){
            Session::flash('message', 'Successfully Added Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Added Data !');
            Session::flash('alert-class', 'btn-danger');
        }

        return redirect('/center-add');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $data = array();
        $data['centers'] = DB::table('tbl_center')
            ->get();
        return view('center.center_list', $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = array();
        $data['centers'] = DB::table('tbl_center_type')->get();
        $data['names'] = DB::table('tbl_center')->where('id', $id)->first();
        return view('center.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $id = $request->input('id');
        $name = $request->input('center_name');
        $center_typee = $request->input('center_type');
        $region = $request->input('region');
        $updated = DB::table('tbl_center')
            ->where('id', $id)
            ->update([
                'center_name' => $name,
                'center_type' => $center_typee,
                'region' => $region,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);

        if ($updated){
            Session::flash('message', 'Successfully Updated Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Update Data !');
            Session::flash('alert-class', 'btn-danger');
        }
        return redirect('/center-add');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = DB::table('tbl_center')
            ->where('id', $id)
            ->delete();

        if ($data){
            Session::flash('message', 'Successfully Deleted Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Delete Data !');
            Session::flash('alert-class', 'btn-danger');
        }
        return redirect('/center-add');
    }

//    start center type
    public function center_type_add(){
        $data = array();
        $data['centers'] = DB::table('tbl_center_type')->get();
        return view('center.add_center_type', $data);
    }

    public function store_center_type(Request $request){
        $center_type = $request->input('center_type');

        $inserted = DB::table('tbl_center_type')->insert(
            [   'center_type' => $center_type,
                'created_at' => date('Y-m-d H:i:s')
            ]);

        if ($inserted){
            Session::flash('message', 'Successfully Added Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Added Data !');
            Session::flash('alert-class', 'btn-danger');
        }
        return redirect('/center-type-add');
    }

    public function edit_center_type($id){
        $data = array();
        $data['centers'] = DB::table('tbl_center_type')->where('id', $id)->first();
        return view('center.edit_center_type', $data);
    }

    public function update_center_type(Request $request){
        $id = $request->input('id');
        $center_typee = $request->input('center_type');
        $updated = DB::table('tbl_center_type')
            ->where('id', $id)
            ->update([
                'center_type' => $center_typee,
                'updated_at' => date('Y-m-d H:i:s'),
            ]);

        if ($updated){
            Session::flash('message', 'Successfully Updated Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Update Data !');
            Session::flash('alert-class', 'btn-danger');
        }
        return redirect('/center-type-add');
    }

    public function destroy_center_type($id){
        $data = DB::table('tbl_center_type')
            ->where('id', $id)
            ->delete();

        if ($data){
            Session::flash('message', 'Successfully Deleted Data !');
            Session::flash('alert-class', 'btn-info');
        }else{
            Session::flash('message', 'Fail to Delete Data !');
            Session::flash('alert-class', 'btn-danger');
        }
        return redirect('/center-type-add');
    }



}
