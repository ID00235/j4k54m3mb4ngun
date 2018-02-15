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

Route::get('/', function () {
    return redirect('home');
});


//halaman login
Route::get('/login', 'LoginController@login');
Route::get('/logout','LoginController@logout');
Route::post('/submit-login','LoginController@submit_login');


Route::group(['middleware'=>'auth'], function(){
	Route::get('/home', 'HomeController@index');

	Route::group(['middleware'=>'rolesmenu'], function(){

		Route::group(['prefix'=>'manajemen-proyek'], function(){
			Route::get('/', 'ManajemenProyekController@index');
			Route::get('/baru', 'ManajemenProyekController@baru');
		});

	});

	//autocomplete
	Route::group(['prefix'=>'autocomplete'], function(){
		Route::get('/rekanan', 'AutoCompeleteController@rekanan');
		Route::get('/konsultan', 'AutoCompeleteController@konsultan');
	});
	
});



Route::group(['prefix'=>'mail'], function(){
	Route::get('/send-aktivasi/{crypt}','EmailController@send_aktivasi_akun');
});



