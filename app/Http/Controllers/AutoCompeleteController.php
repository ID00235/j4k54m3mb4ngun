<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class AutoCompeleteController extends Controller
{
    //

    public function rekanan(Request $r){
    	$nama = trim($r->keyword);
    	$query = DB::table('rekanan')->select('id_rekanan as data','nama_perusahaan as value')->whereRaw("nama_perusahaan like '%$nama%'")->limit(6)->get();
    	$respon = array("suggestions"=>$query);
    	return json_encode($respon);
    }
}
