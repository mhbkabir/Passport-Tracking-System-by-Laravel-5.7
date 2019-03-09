<?php

namespace App\Http\Controllers;

use App\Applicant;
use Carbon\Carbon;
use DateTime;
use NumberFormatter;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class PrintController extends Controller
{

    public static function convert_number_to_words($number)
    {

        $hyphen = '-';
        $conjunction = ' and ';
        $separator = ', ';
        $negative = 'negative ';
        $decimal = ' point ';
        $dictionary = array(
            0 => 'zero',
            1 => 'one',
            2 => 'two',
            3 => 'three',
            4 => 'four',
            5 => 'five',
            6 => 'six',
            7 => 'seven',
            8 => 'eight',
            9 => 'nine',
            10 => 'ten',
            11 => 'eleven',
            12 => 'twelve',
            13 => 'thirteen',
            14 => 'fourteen',
            15 => 'fifteen',
            16 => 'sixteen',
            17 => 'seventeen',
            18 => 'eighteen',
            19 => 'nineteen',
            20 => 'twenty',
            30 => 'thirty',
            40 => 'forty',
            50 => 'fifty',
            60 => 'sixty',
            70 => 'seventy',
            80 => 'eighty',
            90 => 'ninety',
            100 => 'hundred',
            1000 => 'thousand',
            1000000 => 'million',
            1000000000 => 'billion',
            1000000000000 => 'trillion',
            1000000000000000 => 'quadrillion',
            1000000000000000000 => 'quintillion',


        );

        if (!is_numeric($number)) {
            return false;
        }

        if (($number >= 0 && (int)$number < 0) || (int)$number < 0 - PHP_INT_MAX) {
            // overflow
            trigger_error(
                'convert_number_to_words only accepts numbers between -' . PHP_INT_MAX . ' and ' . PHP_INT_MAX,
                E_USER_WARNING
            );
            return false;
        }

        if ($number < 0) {
            return $negative . Self::convert_number_to_words(abs($number));
        }

        $string = $fraction = null;

        if (strpos($number, '.') !== false) {
            list($number, $fraction) = explode('.', $number);
        }

        switch (true) {
            case $number < 21:
                $string = $dictionary[$number];
                break;
            case $number < 100:
                $tens = ((int)($number / 10)) * 10;
                $units = $number % 10;
                $string = $dictionary[$tens];
                if ($units) {
                    $string .= $hyphen . $dictionary[$units];
                }
                break;
            case $number < 1000:
                $hundreds = $number / 100;
                $remainder = $number % 100;
                $string = $dictionary[$hundreds] . ' ' . $dictionary[100];
                if ($remainder) {
                    $string .= $conjunction . Self::convert_number_to_words($remainder);
                }
                break;
            default:
                $baseUnit = pow(1000, floor(log($number, 1000)));
                $numBaseUnits = (int)($number / $baseUnit);
                $remainder = $number % $baseUnit;
                $string = Self::convert_number_to_words($numBaseUnits) . ' ' . $dictionary[$baseUnit];
                if ($remainder) {
                    $string .= $remainder < 100 ? $conjunction : $separator;
                    $string .= Self::convert_number_to_words($remainder);
                }
                break;
        }

        if (null !== $fraction && is_numeric($fraction)) {
            $string .= $decimal;
            $words = array();
            foreach (str_split((string)$fraction) as $number) {
                $words[] = $dictionary[$number];
            }
            $string .= implode(' ', $words);
        }

        return $string;
    }


    public function index(Request $request)
    {


//print_r($request->accept); exit;
        $q = $request->input('q');
//         dd($q);
//        if (!empty($q)) {
        $todayDate = strtotime(date('Y-m-d'));
        $currentDate = date('j F Y', $todayDate);

        $authorities = DB::table('tbl_authority')->select('id', 'name', 'designation')->get();
        //dd($authorities);
        $count = DB::table('tbl_port_update')->where('approve_status', '=', 'Approved')->whereDate('approve_date', Carbon::today())->count('approve_status');
        if (!empty($q)) {

            $masterpp = DB::select("select MasterPP from tbl_port_update where passport='$q' AND approve_status='Pending'  AND  active = 1");

            if (!empty($masterpp)) {
                $mp = $masterpp[0]->MasterPP;
                $users = DB::select("select * from tbl_port_update where MasterPP='$mp' AND approve_status='Pending'  AND  active = 1");

            } else
                $users = Applicant::where('MasterPP', $q)->where('approve_status', 'Pending')->where('active', 1)->get();

        } else
            $users = "";

//        $users = DB::table("select * from tbl_port_update where approve_status='Pending'  AND  active = 1 AND MasterPP=(select MasterPP from tbl_port_update where passport='$q')");


//        dd($users);
        //echo $masterpp[0]->MasterPP;exit;
//dd($users);
        //$users =  DB::select( DB::raw("SELECT DISTINCT(MasterPP)  FROM `tbl_port_update` WHERE  (MasterPP = '$master' or passport = '$q')"));

//        $users = Applicant::where('MasterPP', $q)->where('approve_status', 'pending')->get();

//        $users = DB::table('tbl_port_update')->distinct('MasterPP')->orwhere(function ($query) use ($q) {
//            $query->where('MasterPP', $q)->where('passport', $q)
//        })->get();
//

//       dd($master->get());
//        echo '<pre>';
//        print_r($master);
//    exit();
//
//        $users = DB::table('tbl_port_update')->where(function ($query) use ($q) {
//            $query->where('MasterPP', '$q');
//        })->where( 'approve_status' , 'Pending')->get();

//       $users =  DB::select( DB::raw("SELECT * FROM `tbl_port_update` WHERE ( MasterPP = '$master' and approve_status = 'Pending')"))->toArray();
//dd($users);
        $address = Applicant::select(['serial_no', 'OldPort', 'NewPort', 'arrivalDate', 'departureDate', 'MasterPP'])->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();
        // dd($address);

        $applicant = Applicant::select(array('arrivalDate', 'departureDate', 'MasterPP', 'passport'))->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();

        // $q = Input::get('q');

        $mydate = strtotime($address['arrivalDate']);
        $arrived = date('j F', $mydate);

        $mydate2 = strtotime($address['departureDate']);
        $departure = date('j F Y', $mydate2);

        $datetime1 = new DateTime($applicant['arrivalDate']);
        // dd($datetime1);
        $datetime2 = new DateTime($applicant['departureDate']);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');//now do whatever you like with $days

        $new = $days + 1;
        $word = PrintController::convert_number_to_words($new);
        $id = DB::table('tbl_authority')->select('id')->first();
        $name = DB::table('tbl_authority')->select('id', 'name', 'designation')->get();
        // $name[0]->designation);

        return view('print.print', ['name' => $name, 'id' => $id, 'authorities' => $authorities, 'users' => $users, 'days' => $days, 'word' => $word, 'address' => $address, 'currentDate' => $currentDate, 'arrived' => $arrived, 'departure' => $departure, 'count' => $count, 'squery' => $q]);

//        } else {
//            return view('print.print', ['users' => '', 'days' => '', 'word' => '', 'address' => '', 'currentDate' => '', 'arrived' => '', 'departure' => '', 'count' => '']);
//
//        }
    }


    public function store(Request $request)
    {

        $posted_data = $_POST;
        $acceptData = array();
        $rejectData = array();
        foreach ($posted_data as $key => $value) {
            if ($value != 0) {
                array_push($acceptData, $value);
            }
            if ($value == 0) {
                $rejectValue = str_replace("accept", "", $key);
                if ($rejectValue != 0) {
                    array_push($rejectData, $rejectValue);
                }
            }
        }

        $q = $request->input('accept');


        $name = $request->name;
        $desi = $request->desi;
//       dd($request->name);
        $q = $request->masterpass;

//        dd($q);
//        $countPassport = $request->q;
//        dd($countPassport);
//        $allPassport = DB::table('Select*')

//        if (!empty($request->accept)) {
//            $approve_id = $request->accept;
//            dd($approve_id);
//
//            foreach ($approve_id as $chk) {
//                $id = (Input::has($chk)) ? true : false);
//            }

//        if (!empty($q)) {
//            $todayDate = strtotime(date('Y-m-d'));
//            $currentDate = date('j F Y', $todayDate);
//            foreach ($approve_id as $id) {
//
//                DB::table('tbl_port_update')
//                    ->where('serial_no', $id)
//                    ->update(['approve_status' => 'Approved']);
//
//            }


//        }

        $approve_id = $request->accept;
//        dd($approve_id);

        if (!empty($acceptData)) {
//
            foreach ($acceptData as $id) {
//
                $dateTime = Carbon::parse($request->recFrmHCI_time);
                DB::table('tbl_port_update')
                    ->where('serial_no', $id)
                    ->update(['approve_status' => 'Approved' ,'approve_by'=>$request->name ,'approve_date'=>Carbon::today()]);
//                 $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//                foreach ($payrolls as $payrolls) {
//
//                    $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                    $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                    $payrolls->approve_by = $request->name;
//                    $payrolls->save();
//                }

            }



        }
        if (!empty($rejectData)) {

            foreach ($rejectData as $id) {
//
//            if ($request->has('accept') && $request->accept = TRUE) {
                DB::table('tbl_port_update')
                    ->where('serial_no', $id)
                    ->update(['approve_status' => 'Rejected','approve_by'=>$request->name ,'approve_date'=>Carbon::today()]);

//                $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//                foreach ($payrolls as $payrolls) {
//
//                    $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                    $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                    $payrolls->approve_by = auth()->user()->name;
//                    $payrolls->save();
//                }
//            }

            }

//            $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//            foreach ($payrolls as $payrolls) {
//
//                $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                $payrolls->approve_by = auth()->user()->name;
//                $payrolls->save();
//            }


        }


        $todayDate = strtotime(date('Y-m-d'));
        $currentDate = date('j F Y', $todayDate);

//        $currentDate = date('j F Y', $todayDate);

        $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
//        dd($payrolls);
        foreach ($payrolls as $payrolls) {

            $dateTime = Carbon::parse($request->recFrmHCI_time);

            $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
            $payrolls->approve_by = auth()->user()->name;
            $payrolls->save();
        }

//        dd($currentDate);
//        DB::table('tablename')->distinct('name')->count('name');
        $count = DB::table('tbl_port_update')->whereDate('approve_date', Carbon::today())->where('approve_status', '=', 'Approved')->distinct('MasterPP')->count('MasterPP');

//            $users = Applicant::where('MasterPP', $q)->where('passport', '=', $q)->where('approve_status', 'pending')->get();
        $users = Applicant::whereIn('serial_no', $acceptData)->get();


        $address = Applicant::select(['area', 'OldPort', 'NewPort', 'mode', 'arrivalDate', 'departureDate', 'MasterPP'])->where('MasterPP', '=', $q)->first();
         //dd($address); exit;
        $applicant = Applicant::select(array('arrivalDate', 'departureDate', 'MasterPP', 'passport'))->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();

        // $q = Input::get('q');

        $mydate = strtotime($address['arrivalDate']);
        $arrived = date('j F', $mydate);

        $mydate2 = strtotime($address['departureDate']);
        $departure = date('j F Y', $mydate2);

        $datetime1 = new DateTime($applicant['arrivalDate']);
        // dd($datetime1);
        $datetime2 = new DateTime($applicant['departureDate']);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');//now do whatever you like with $days

        $new = $days + 1;
        $word = PrintController::convert_number_to_words($new);
        // dd($word);

        return view('print.printfinal', ['name' => $name, 'desi' => $desi, 'users' => $users, 'days' => $days, 'word' => $word, 'address' => $address, 'currentDate' => $currentDate, 'arrived' => $arrived, 'departure' => $departure, 'count' => $count]);


    }


    public function edit(Request $request)
    {

//print_r($request->accept); exit;
        $q = $request->input('q');
        // dd($q);
//        if (!empty($q)) {
        $todayDate = strtotime(date('Y-m-d'));
        $currentDate = date('j F Y', $todayDate);

        $authorities = DB::table('tbl_authority')->select('id', 'name', 'designation')->get();
        //dd($authorities);
        $count = DB::table('tbl_port_update')->where('approve_status', '=', 'Approved')->whereDate('approve_date', Carbon::today())->count('approve_status');
        if (!empty($q)) {

            $masterpp = DB::select("select MasterPP from tbl_port_update where passport='$q' AND approve_status !='Pending'  AND  active = 1");

            if (!empty($masterpp)) {
                $mp = $masterpp[0]->MasterPP;
                $users = DB::select("select * from tbl_port_update where MasterPP='$mp' AND approve_status !='Pending'  AND  active = 1");

            } else
                $users = Applicant::where('MasterPP', $q)->where('active', 1)->get();

        } else
            $users = "";
//            $users = DB::table("select * from tbl_port_update where approve_status='Pending'  AND  active = '1' AND MasterPP=(select MasterPP from tbl_port_update where passport='$q')");


//        $address = Applicant::select(['serial_no','OldPort', 'NewPort', 'arrivalDate', 'departureDate', 'MasterPP'])->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();
//        // dd($address);
//
//        $applicant = Applicant::select(array('arrivalDate', 'departureDate', 'MasterPP', 'passport'))->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();
//
//        // $q = Input::get('q');
//
//        $mydate = strtotime($address['arrivalDate']);
//        $arrived = date('j F', $mydate);
//
//        $mydate2 = strtotime($address['departureDate']);
//        $departure = date('j F Y', $mydate2);
//
//        $datetime1 = new DateTime($applicant['arrivalDate']);
//        // dd($datetime1);
//        $datetime2 = new DateTime($applicant['departureDate']);
//        $interval = $datetime1->diff($datetime2);
//        $days = $interval->format('%a');//now do whatever you like with $days
//
//        $new = $days + 1;
//
//        $word = PrintController::convert_number_to_words($new);
        $id = DB::table('tbl_authority')->select('id')->first();
        $name = DB::table('tbl_authority')->select('id', 'name', 'designation')->get();
        // $name[0]->designation);

        return view('print.edit', ['name' => $name, 'id' => $id, 'authorities' => $authorities, 'users' => $users, 'squery' => $q]);

    }

    public function update(Request $request)
    {

        $posted_data = $_POST;
        $acceptData = array();
        $rejectData = array();
        foreach ($posted_data as $key => $value) {
            if ($value != 0) {
                array_push($acceptData, $value);
            }
            if ($value == 0) {
                $rejectValue = str_replace("accept", "", $key);
                if ($rejectValue != 0) {
                    array_push($rejectData, $rejectValue);
                }
            }
        }


        $q = $request->masterpass;
        $ids = $request->accept;
        $selects = $request->select;

//        if (!empty($request->accept)) {
//
//            foreach ($ids as $id) {
//                DB::table('tbl_port_update')
//                    ->where('serial_no', $id)
//                    ->update(['approve_status' => 'Approved']);
//
//            }
//
//        }


        $name = $request->name;
        $desi = $request->desi;
//       dd($request->name);
//        $q = $request->masterpass;
//        if (!empty($request->accept)) {
//            $approve_id = $request->accept;   //echo   $q=
//
//
////        if (!empty($q)) {
////            $todayDate = strtotime(date('Y-m-d'));
////            $currentDate = date('j F Y', $todayDate);
//            foreach ($approve_id as $id) {
//
//                DB::table('tbl_port_update')
//                    ->where('serial_no', $id)
//                    ->update(['approve_status' => 'Approved']);
//
//            }
//
//
//        }

//        if (!empty($q)) {
        $todayDate = strtotime(date('Y-m-d'));
        $currentDate = date('j F Y', $todayDate);

 if (!empty($acceptData)) {
//
        foreach ($acceptData as $id) {
//
            $dateTime = Carbon::parse($request->recFrmHCI_time);
            DB::table('tbl_port_update')
                ->where('serial_no', $id)
                ->update(['approve_status' => 'Approved' ,'approve_by'=>$request->name ,'approve_date'=>Carbon::today()]);
//                 $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//                foreach ($payrolls as $payrolls) {
//
//                    $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                    $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                    $payrolls->approve_by = $request->name;
//                    $payrolls->save();
//                }

        }



    }
        if (!empty($rejectData)) {

            foreach ($rejectData as $id) {
//
//            if ($request->has('accept') && $request->accept = TRUE) {
                DB::table('tbl_port_update')
                    ->where('serial_no', $id)
                    ->update(['approve_status' => 'Rejected','approve_by'=>$request->name ,'approve_date'=>Carbon::today()]);

//                $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//                foreach ($payrolls as $payrolls) {
//
//                    $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                    $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                    $payrolls->approve_by = auth()->user()->name;
//                    $payrolls->save();
//                }
//            }

            }

//            $payrolls = Applicant::where("serial_no", $request->input('accept'))->get();
////        dd($payrolls);
//            foreach ($payrolls as $payrolls) {
//
//                $dateTime = Carbon::parse($request->recFrmHCI_time);
//
//                $payrolls->approve_date = $dateTime->format('Y-m-d H:i:s');
//                $payrolls->approve_by = auth()->user()->name;
//                $payrolls->save();
//            }


        }
//        dd($currentDate);
//        DB::table('tablename')->distinct('name')->count('name');
        $count = DB::table('tbl_port_update')->whereDate('approve_date', Carbon::today())->where('approve_status', '=', 'Approved')->distinct('MasterPP')->count('MasterPP');

//            $users = Applicant::where('MasterPP', $q)->where('passport', '=', $q)->where('approve_status', 'pending')->get();
        $users = Applicant::whereIn('serial_no', $request->accept)->get();

//dd($users);
        $address = Applicant::select(['area', 'OldPort', 'NewPort', 'mode', 'arrivalDate', 'departureDate', 'MasterPP'])->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();
//        dd($address);
        $applicant = Applicant::select(array('arrivalDate', 'departureDate', 'MasterPP', 'passport'))->where('MasterPP', '=', $q)->orderBy('arrivalDate', 'DES')->first();

        // $q = Input::get('q');

        $mydate = strtotime($address['arrivalDate']);
        $arrived = date('j F', $mydate);


//        dd($arrived);
        $mydate2 = strtotime($address['departureDate']);
        $departure = date('j F Y', $mydate2);

        $datetime1 = new DateTime($applicant['arrivalDate']);
        // dd($datetime1);
        $datetime2 = new DateTime($applicant['departureDate']);
        $interval = $datetime1->diff($datetime2);
        $days = $interval->format('%a');

//        dd($days);

        $new = $days + 1;
        $word = PrintController::convert_number_to_words($new);
        // dd($word);

        return view('print.editPrint', ['name' => $name, 'desi' => $desi, 'users' => $users, 'days' => $days, 'word' => $word, 'address' => $address, 'currentDate' => $currentDate, 'arrived' => $arrived, 'departure' => $departure, 'count' => $count]);


    }


    public function destroy(Applicant $ticket)
    {
        // dd($id);
        //  $ticket = Applicant::find($id);
//        $ticket= Applicant::where('serial_no', $id);

        $ticket->delete();

        return redirect('/print');
    }

    public function ajax($request)
    {


        $data = DB::table('tbl_authority')->select('designation', 'name')->where('id', $request)->get();
//       return  $data[0]->designation;
        return response()->json($data);

    }


}
