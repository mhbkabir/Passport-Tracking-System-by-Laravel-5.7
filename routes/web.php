<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', 'HomeController@index');
Route::get('/port', 'portController@add_port');
Route::post('/port/save', 'portController@save_port');
Route::post('first-user', [ 'as' => 'first-user', 'uses' => 'UserController@save_first_user']);

Route::group(['middleware' => ['auth']], function () {

    Route::get('rap/pap', 'rappapController@index');
    Route::post('rap/pap/save', 'rappapController@save');
    Route::get('rap/listview', 'rappapController@listview');

    /*New added*/

    Route::post('/store-user', 'HomeController@store')->name('store');

    Route::get('/create', 'HomeController@create');
    Route::get('/user-list', 'HomeController@user_list');
    Route::get('/search-center-name', 'HomeController@search_center_name');
    Route::get('/search-menu-permission', 'HomeController@search_menu_permission');
    Route::get('/delete_user/{a}', 'HomeController@delete_user');
    Route::get('/edit_user/{a}', 'HomeController@edit_user');
    Route::post('/update_user', 'HomeController@update_user');
    Route::get('/change-password', 'HomeController@change_password');
    Route::post('/password-changed', 'HomeController@password_changed');

    Route::get('menu/index', 'MenuController@index');

    Route::get('menu/create', 'MenuController@create');
    Route::post('menu/store', 'MenuController@store')->name('store');

//ADDITIONAL SERVICES
    Route::get('/search', 'ApplicantController@index');
    Route::post('search', 'ApplicantController@search');
    Route::post('/store', 'ApplicantController@store')->name('updateSearch');


    //RapPap approval, edit page and final report

    Route::get('/print', 'PrintController@index')->name('print');
    Route::post('/accept', 'PrintController@store')->name('approval');
    Route::post('/ajax/{id}', 'PrintController@ajax');
    Route::get('/edit', 'PrintController@edit')->name('rap.edit');
    Route::post('/update', 'PrintController@update');
    Route::post('/rePrint', 'PrintController@rePrint');
    Route::get('/delete/passport/{serial_no}', 'PrintController@destroy')->name('user.delete');


    /*New added*/

    Route::get('approve/report', 'RappapController@approveview')->name('report');

    Route::post('approve/detail', 'RappapController@approvedetail');

    /*Export-Import*/
    Route::get('export/data', 'exportimportController@export');

    Route::get('import/data', 'exportimportController@import');
    /*Export-Import*/

    Route::post('importExcel', 'exportimportController@importExcel');
    Route::post('data/export', 'exportimportController@excel');


    //Summary Report
    Route::get('/port-update-report', 'ReportsController@port_update_report_view_page');
    Route::post('/port-update-report-result', 'ReportsController@port_update_report_result');

    //    sticker
    Route::get('/sticker', 'StickerController@index');
    Route::post('/store-sticker', 'StickerController@store');
    Route::get('/sticker-list', 'StickerController@sticker_view');
    Route::get('/delete_sticker/{id}', 'StickerController@destroy');
    Route::get('/edit_sticker/{id}', 'StickerController@edit');
    Route::post('/update-sticker', 'StickerController@update');

//    rap-pap
    Route::get('rap/pap/{a}/{b}/{c}/{d}/','rappapController@index');
    Route::post('rap/pap/save','rappapController@save');

    /*Edit Rap/Pap*/
    Route::get('rap/pap/edit/{a}/{b}', 'rappapController@edit');
    Route::post('rap/pap/edit/action', 'rappapController@edit_action');

    Route::post('rap/pap/edit/save/{a}', 'rappapController@edit_save');

    Route::get('rap/pap/delete/{a}/{b}', 'rappapController@delete_rappap');

    /*Receive Report*/
    Route::get('rappap/report', 'RappapController@viewreport')->name('report');

    Route::post('rappap/detail', 'RappapController@report_detail');

    /*Receive summary Report*/
    Route::get('/receive-summary-report', 'ReportController@receive_summary_report_view_page');
    Route::post('/receive-summary-report-result', 'ReportController@receive_summary_report_result');

    /*Designation start*/
    Route::get('/designation/add','DesignationController@add');
    Route::post('designation/add/save','DesignationController@save');
    Route::get('/edit_designation/{id}', 'DesignationController@edit_designation');
    Route::get('/update_designation', 'DesignationController@update_designation');
    Route::get('/delete_designation/{id}', 'DesignationController@delete_designation');

    //    sticker
    Route::get('/sticker', 'StickerController@index');
    Route::post('/store-sticker', 'StickerController@store');
    Route::get('/delete_sticker/{id}', 'StickerController@destroy');
    Route::get('/edit_sticker/{id}', 'StickerController@edit');
    Route::post('/update-sticker', 'StickerController@update');
    Route::get('/search-center-for-region', 'StickerController@search_center');

    //  entry / exit port
    Route::get('/entry-exit-port', 'EntryExitController@index');
    Route::post('/entry-exit-port/store', 'EntryExitController@store');
    Route::get('/port-delete/{id}', 'EntryExitController@destroy');
    Route::get('/edit-entry-exit-port/{id}', 'EntryExitController@edit');
    Route::post('/entry-exit-port/update', 'EntryExitController@update');

//  area
    Route::get('/area', 'AreaController@index');
    Route::post('/area/store', 'AreaController@store');
    Route::get('/area-port-delete/{id}', 'AreaController@destroy');
    Route::get('/edit-area-port/{id}', 'AreaController@edit');
    Route::post('/area/update', 'AreaController@update');

//    mode
    Route::get('/mode', 'ModeController@index');
    Route::post('/mode/store', 'ModeController@store');
    Route::get('/mode-port-delete/{id}', 'ModeController@destroy');
    Route::get('/edit-mode-port/{id}', 'ModeController@edit');
    Route::post('/mode/update', 'ModeController@update');


//    create menu
    Route::get('/search-sub-menu', 'MenuController@search_sub_menu');

//    center
    Route::get('/center-add', 'CenterController@index');
    Route::post('/store-center-name', 'CenterController@store');
    Route::get('/edit-center/{a}', 'CenterController@edit');
    Route::post('/update-center', 'CenterController@update');
    Route::get('/delete-center/{a}', 'CenterController@destroy');

//    center type
    Route::get('/center-type-add', 'CenterController@center_type_add');
    Route::post('/store-center-type', 'CenterController@store_center_type');
    Route::get('/edit-center-type/{a}', 'CenterController@edit_center_type');
    Route::post('/update-center-type', 'CenterController@update_center_type');
    Route::get('/delete-center-type/{a}', 'CenterController@destroy_center_type');

    //Basic print page
    Route::get('hci/basic/print','PrintController@basic')->name('basic');
    Route::post('/hci/basic/printPage', 'PrintController@basicStore');

});