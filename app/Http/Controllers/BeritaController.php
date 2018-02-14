<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class BeritaController extends Controller
{
    //
    function index(){
    	return view('app.berita.index');
    }
}
