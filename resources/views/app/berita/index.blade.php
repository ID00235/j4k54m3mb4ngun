@extends('app')
@section("title") Proyek @endsection
@section("pageheader")
<div class="media">
    <div class="pageicon pull-left">
        <i class="la la-newspaper-o"></i>
    </div>
    <div class="media-body">
        <ul class="breadcrumb">
            <li><a href="{{app_url('home')}}">Beranda</a></li>
            <li><a href="{{app_url('berita')}}">Berita</a></li>
        </ul>
        <h5>Berita</h5>
    </div>
</div>
@endsection

@section("content")
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<span class="title">Daftar Berta TP4D</span>
				<table class="table table-condensed table-striped table-bordered table-hover" width="100%">
					<thead>
						<tr>
							<td valign="middle" align="center" width="1%">No.</td>
							<td valign="middle" align="center" width="70%">Judul Berita</td>
							<td valign="middle" align="center" style="width: 120px;">Update</td>
							<td valign="middle" align="center" style="width: 120px;">Aksi</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center">1</td>
							<td><a href="">Sosialisasi Aplikasi TP4D</a></td>
							<td align="center">12-Jan-17</td>
							<td align="center">
								<a href="" class="btn btn-sm btn-success">Edit</a>
								<a href="" class="btn btn-sm btn-danger">Hapus</a>
							</td>
						</tr>
						<tr>
							<td align="center">2</td>
							<td><a href="">Contoh Berit</a></td>
							<td align="center">12-Jan-17</td>
							<td align="center">
								<a href="" class="btn btn-sm btn-success">Edit</a>
								<a href="" class="btn btn-sm btn-danger">Hapus</a>
							</td>
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