<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class EmailController extends Controller
{
    //

    function send_aktivasi_akun($crypt){

			$email = "irwanka.email@gmail.com";
			$nama = "Irwan Kurniawan";
			$username = "irwanka22";
			$link = "http://tp4dbatanghari.com/aktivasi-akun/".Crypt::encrypt(date("YmdHis").rand(13,2100));

			try {
	            $data = array("username"=>$username,"link"=>$link, "nama"=>$nama);
	            Mail::send('email.aktivasi-akun', $data, function($message) use ($email, $nama) {
	                $message->to($email, $nama)->subject('Aktivasi Akun');
	            });
	        }catch (Exception $ex) {
	           	  $message =  "Gagal Mengirim Email.";
	              $status = "error";
	             return array("status"=>$status, "message"=>$message);
	        }

	        $message =  "E-TP4D Telah Mengirimakan Tautan Aktivasi Akun ke Email Anda ($email). Segera Cek Kotak Masuk (Inbox) Email dan Melakukan Aktivasi Melalui Tombol Aktivasi. <small>Periksa bagian Spam Jika Email Tidak Ditemukan Pada Kotak Masuk (Inbox).  </small>";
	        $status = "sukses";
	        return array("status"=>$status, "message"=>$message);
	}
}
