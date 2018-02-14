<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

use Auth;
use App\User;
use Session;
use Crypt;
use DB;

class LoginController extends Controller
{
    //
    function login(){
    	return view('login');
    }

    function logout(){
    	Session::flush();
    	return redirect('login');
    }

    function submit_login(Request $r){
    	$username = $r->username;
    	$password = $r->password;

    	$user = User::where('username',$username)->first();
    	if($user){
    		if (Auth::attempt(['username'=>$username, 'password'=>$password])){
    			$this->get_session_menu();
    			Auth::login($user);
    			return redirect(url('home'));
    		}
    	}
    	return redirect('login')->with('alert',"Username dan Password tidak sesuai!");
    } 

    function get_session_menu(){
    	$id_user = Auth::user()->id;

    	$menu = DB::table('menu as a')->select('a.*')
    			->join('role_menu as b', 'b.id_menu','=','a.id_menu')
    			->join('user_role as c', function($on) use($id_user){
    				$on->on('c.id_role','=','b.id_role')
    					->where('c.id_user','=',$id_user);
    			})
                ->groupby('a.id_menu')
                ->groupby('a.nama_menu')
                ->groupby('a.url')
                ->groupby('a.icon')
    			->groupby('a.group_menu')
                ->orderby('a.id_menu')
                ->orderby('a.group_menu')
    			->orderby('a.url')    			
    			->get();

    	$menu = json_encode($menu);
    	Session::put('session_menu',$menu);
    }
}
