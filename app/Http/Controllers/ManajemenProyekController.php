<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use Auth;
use App\User;
use Session;
use Crypt;


class ManajemenProyekController extends Controller
{
    //
    function index(){
    	return view('app.manajemen-proyek.index');
    }

    function baru(){
    	if (Session::get('a_create')!='1'){
    		return redirect('manajemen-proyek');
    	}
    	return view('app.manajemen-proyek.baru');
    }
}
