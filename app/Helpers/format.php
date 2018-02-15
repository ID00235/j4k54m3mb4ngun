<?php

function format_money($data){
	$data = str_replace("Rp ", "", $data);
	$data = str_replace(".", "", $data);
	$data = str_replace(",", ".", $data);
	return $data;
}

function format_rupiah($data){
	return  number_format($data,0,".","");
}

function tgl_system($data){
	$tgl = explode("/",$data);
	if(count($tgl)==3){
		return $tgl[2]."-".$tgl[1]."-".$tgl[0];
	}else{
		return "";
	}
}

function tgl_indo($data){
	$tgl = explode("-",$data);
	if(count($tgl)==3){
		return $tgl[2]."-".$tgl[1]."-".$tgl[0];
	}else{
		return "";
	}
}

function selish_hari($tgl_awal, $tgl_akhir){
	$tanggal1 = new DateTime($tgl_awal);
	$tanggal2 = new DateTime($tgl_akhir);
	 
	$selisih = $tanggal2->diff($tanggal1)->format("%a");
	return $selisih;
}