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

    function submit_baru(Request $r){
        loadHelper('format');
        $nama_proyek = $r->nama_proyek;
        $nama_pekerjaan = $r->nama_pekerjaan;
        $lokasi_pekerjaan = $r->lokasi_pekerjaan;
        $id_jenis_proyek = $r->id_jenis_proyek;
        $id_sumber_dana = $r->id_sumber_dana;
        $nilai_proyek = $r->nilai_proyek;
        $tgl_selesai = $r->tgl_selesai;
        $tgl_mulai = $r->tgl_mulai;
        $id_rekanan = $r->id_rekanan;
        $id_konsultan = $r->id_konsultan;
        $keterangan = $r->keterangan;
        $cari_konsultan = $r->cari_konsultan;
        $cari_rekanan = $r->cari_rekanan;

        $data = array(
            'nama_proyek'=>$nama_proyek,
            'nama_pekerjaan'=>$nama_pekerjaan,
            'lokasi_pekerjaan'=>$lokasi_pekerjaan,
            'id_jenis_proyek'=>$id_jenis_proyek,
            'id_sumber_dana'=>$id_sumber_dana,
            'nilai_proyek'=>format_money($nilai_proyek),
            'tgl_mulai'=>tgl_system($tgl_mulai),
            'tgl_selesai'=>tgl_system($tgl_selesai),
            'id_konsultan'=>$id_konsultan,
            'id_rekanan'=>$id_rekanan,
            'keterangan'=>$keterangan,
        );
       
        $selisih =  selish_hari($data['tgl_mulai'], $data['tgl_selesai']);
        $data['jumlah_hari_kalender'] = $selisih;

        if ($selisih<=0){
            Session:put('form_data', json_encode($data));
            return redirect('manajemen-proyek/baru');
        }

        DB::table('proyek')->insert()


    }
}
