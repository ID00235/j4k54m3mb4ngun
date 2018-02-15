<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class AutoCompeleteController extends Controller
{
    //

    public function rekanan(Request $r){
    	$nama = trim($r->keyword);
    	$query = DB::table('rekanan')->select('id_rekanan as data',DB::raw("concat(nama_perusahaan,' - ',lpad(id_rekanan,3,'0')) as value"))->whereRaw("nama_perusahaan like '%$nama%'")->limit(6)->get();
    	$respon = array("suggestions"=>$query);
    	if (count($query)==0){
    		$respon = array("suggestions"=>[array("data"=>0, "value"=>"Not Found!")]);
    	}
    	return json_encode($respon);
    }

    public function konsultan(Request $r){
    	$nama = trim($r->keyword);
    	$query = DB::table('konsultan')->select('id_konsultan as data',DB::raw("concat(nama_konsultan,' - ',lpad(id_konsultan,3,'0')) as value"))->whereRaw("nama_konsultan like '%$nama%'")->limit(6)->get();
    	$respon = array("suggestions"=>$query);
    	if (count($query)==0){
    		$respon = array("suggestions"=>[array("data"=>0, "value"=>"Not Found!")]);
    	}
    	return json_encode($respon);
    }
}
