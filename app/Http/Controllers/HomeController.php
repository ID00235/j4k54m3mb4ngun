<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use Auth;
use App\User;
use Session;
use Crypt;


class HomeController extends Controller
{
    //

    function index(){
    	return view('app.home.index');
    }
}
