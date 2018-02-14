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
				<span class="title"><i class="la la-plus"></i> Tambah Proyek Baru</span>
				<div class="row mb-20">
					<div class="col-md-offset-1 col-md-10">
					Mohon Isi Data Proyek Dengan Lengkap
					<hr>
					</div>
					<form action="{{url('manajemen-proyek/submit-baru')}}" method="post">
						<div class="col-md-offset-1 col-md-5">
							<div class="form-group">
								<label>Nama Proyek</label>
								<input type="text" class="form-control" name="nama_proyek" required value="" placeholder="Masukan Nama Proyek">
							</div>
							<div class="form-group">
								<label>Nama Pekerjaan</label>
								<input type="text" class="form-control" name="nama_pekerjaan" required value="" placeholder="Masukan Nama Pekerjaan">
							</div>
							<div class="form-group">
								<label>Jenis Proyek</label>
								<?php
								$jenis_proyek = DB::table('jenis_proyek')->get();
								?>
								<select class="select2 form-control" required>
									<option>Pilih Jenis Proyek</option>
									@foreach($jenis_proyek as $j)
									<option value="{{$j->id_jenis_proyek}}">{{$j->nama_jenis_proyek}}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group">
								<label>Sumber Dana</label>
								<?php
								$sumber_dana = DB::table('sumber_dana')->get();
								?>
								<select class="select2 form-control" required>
									<option>Pilih Sumber Dana</option>
									@foreach($sumber_dana as $j)
									<option value="{{$j->id_sumber_dana}}">{{$j->nama_sumber_dana}}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group">
								<label>Nilai Proyek</label>
								<input type="text" class="form-control" name="nilai_proyek" required value="" placeholder="Masukan Nilai Proyek">
							</div>
						</div>
						<div class="col-md-5">

							<div class="form-group">
								<label>Tanggal Mulai</label>
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" name="tgl_mulai" placeholder="yyyy-mm-dd">
									<div class="input-group-addon">
								        <span class="glyphicon glyphicon-th"></span>
								    </div>
							    </div>
							</div>

							<div class="form-group">
								<label>Tanggal Selesai</label>
								<div class="input-group date" data-provide="datepicker">
									<input type="text" class="form-control datepicker" name="tgl_selesai" 
									placeholder="yyyy-mm-dd">
									<div class="input-group-addon">
								        <span class="glyphicon glyphicon-th"></span>
								    </div>
							    </div>
							</div>

							<div class="form-group">
								<label>Rekanan Pelaksana</label>
								<div class="input-group date">
									<input type="text" id="autocomplete-rekanan" class="form-control" name="id_rekanan" 
									placeholder="Cari Rekanan...">
									<div class="input-group-addon">
								        <span class="la la-search" id="autocomplete-rekanan-status"></span>
								    </div>
							    </div>
							</div>

							<div class="form-group">
								<label>Konsultan Pengawas</label>
								<div class="input-group date">
									<input type="text" id="autocomplete-konsultan" class="form-control" name="id_rekanan" 
									placeholder="Cari Konsultan...">
									<div class="input-group-addon">
								        <span class="la la-search" id="autocomplete-konsultan-status"></span>
								    </div>
							    </div>
							</div>

							<div class="form-group">
								<label>Keterangan</label>
								<textarea name="keterangan" class="form-control"></textarea>
							</div>

						</div>
					</form>
				</div>
			</div>
			<div class="panel-footer">

			</div>
		</div>
	</div>
</div>
@endsection
@section('javascript')
<script type="text/javascript">
	
	$(function(){
		$('#autocomplete-rekanan').on('blur', function(){
			$(this).val('');
		})
		
		$('#autocomplete-rekanan').autocomplete({
			serviceUrl: "{{url('autocomplete/rekanan')}}",
		    paramName: 'keyword',
		    minChars: 3,
		    onSearchStart: function(){
		    	$("#autocomplete-rekanan-status").addClass('la-ellipsis-h')
		    	$("#autocomplete-rekanan-status").removeClass('la-search')
		    },
		    onSearchComplete: function(){
		    	$("#autocomplete-rekanan-status").addClass('la la-search')
		    	$("#autocomplete-rekanan-status").removeClass('la-ellipsis-h')
		    },
		    onSelect: function(suggestion){
		    	
		    	$("#autocomplete-rekanan-status").removeClass('la-search');
		    	$("#autocomplete-rekanan-status").addClass('la-check');
		    }
		})

		$('#autocomplete-konsultan').autocomplete({
			serviceUrl: "{{url('autocomplete/konsultan')}}",
		    paramName: 'keyword',
		    minChars: 3,
		    onSearchStart: function(){
		    	$("#autocomplete-konsultan-status").addClass('la-ellipsis-h')
		    	$("#autocomplete-konsultan-status").removeClass('la-search')
		    },
		    onSearchComplete: function(){
		    	$("#autocomplete-konsultan-status").addClass('la la-search')
		    	$("#autocomplete-konsultan-status").removeClass('la-ellipsis-h')
		    },
		    onSelect: function(suggestion){
		    	alert(suggestion.data);
		    	$("#autocomplete-konsultan-status").removeClass('la-search');
		    	$("#autocomplete-konsultan-status").addClass('la-check');
		    }
		})

	})
</script>
@endsection