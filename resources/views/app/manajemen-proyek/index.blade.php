@extends('app')
@section("title") Proyek @endsection
@section("pageheader")
<div class="media">
    <div class="pageicon pull-left">
        <i class="la la-home"></i>
    </div>
    <div class="media-body">
        <ul class="breadcrumb">
            <li><a href="{{app_url('home')}}">Beranda</a></li>
            <li><a href="{{app_url('proyek')}}">Proyek</a></li>
        </ul>
        <h5>Proyek</h5>
    </div>
</div>
@endsection

@section("content")
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<span class="title">Data Proyek</span>
				<div class="row mb-20">
					<div class="col-md-9">
					@if(Session::get('a_create')=='1')
						<a href="{{url('manajemen-proyek/baru')}}" class="btn btn-primary btn-metro btn-sm"><i class="la la-plus"></i> Proyek Baru</a>
					@endif
					</div>
					<div class="col-md-3">
					@if(Session::get('scope_instansi')=='semua')
						<select class="select2 form-control">
							<option>Pilih Jenis Instansi</option>
							<option value="semua">Semua</option>
							<option value="opd">OPD</option>
							<option value="desa">Desa</option>
						</select>
					@endif
					</div>
				</div>
				<table class="table table-condensed table-striped table-bordered table-hover" width="100%">
					<thead>
						<tr>
							<td valign="middle" align="center" rowspan="2">Nomor</td>
							<td valign="middle" align="center" rowspan="2">Nama Proyek</td>
							<td valign="middle" align="center" rowspan="2">Instansi</td>
							<td align="center" colspan="4">Jumlah Dokumen Tahapan Proyek</td>
						</tr>
						<tr>
							<td align="center">Pra Lelang</td>
							<td align="center">Lelang</td>
							<td align="center">Pelaksanaan</td>
							<td align="center">Total</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">001</td>
							<td><a href="">Pembangunan Jalan Lingkar I</a></td>
							<td>Dinas PU</td>
							<td align="center" class="warning">6</td>
							<td align="center" class="danger">5</td>
							<td align="center" class="danger">4</td>
							<td align="center">15</td>
						</tr>
						<tr>
							<td align="center">002</td>
							<td><a href="">Pembangunan Gedung Serba Guna</a></td>
							<td>Dinas PU</td>
							<td align="center" class="success">4</td>
							<td align="center" class="warning">6</td>
							<td align="center" class="success">6</td>
							<td align="center">16</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="panel-footer">

			</div>
		</div>
	</div>
</div>
@endsection