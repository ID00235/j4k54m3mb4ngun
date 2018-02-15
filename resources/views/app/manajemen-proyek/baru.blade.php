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
			<form id="form-proyek" action="{{url('manajemen-proyek/submit-baru')}}" method="post">
			{{csrf_field()}}
			<div class="panel-body">
				<span class="title"><i class="la la-plus"></i> Tambah Proyek Baru</span>
				<div class="row mb-20">
					<div class="col-md-offset-1 col-md-10">
					Mohon Isi Data Proyek Dengan Lengkap
					<hr>
					</div>
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
								<label>Lokasi Pekerjaan</label>
								<input type="text" class="form-control" name="lokasi_pekerjaan" required value="" placeholder="Masukan Lokasi Pekerjaan">
							</div>
							<div class="form-group">
								<label>Jenis Proyek</label>
								<?php
								$jenis_proyek = DB::table('jenis_proyek')->get();
								?>
								<select name="id_jenis_proyek" class="select2 form-control" required>
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
								<select name="id_sumber_dana" class="select2 form-control" required>
									<option>Pilih Sumber Dana</option>
									@foreach($sumber_dana as $j)
									<option value="{{$j->id_sumber_dana}}">{{$j->nama_sumber_dana}}</option>
									@endforeach
								</select>
							</div>
							<div class="form-group">
								<label>Nilai Proyek</label>
								<input type="text" class="money form-control" name="nilai_proyek" required value="" placeholder="Masukan Nilai Proyek">
							</div>
						</div>
						<div class="col-md-5">

							<div class="form-group">
								<label>Tanggal Mulai</label>
								<input type="text" class="form-control datepicker" name="tgl_mulai" placeholder="dd/mm/yyyy">
							</div>

							<div class="form-group">
								<label>Tanggal Selesai</label>
								<input type="text" class="form-control datepicker" name="tgl_selesai" 
									placeholder="dd/mm/yyyy">
							</div>

							<div class="form-group">
								<label>Rekanan Pelaksana</label>
								<input type="text" id="autocomplete-rekanan"   name="cari_rekanan" 
								   class="form-control"  
									placeholder="Cari Rekanan...">
								<input id="id_rekanan" type="hidden" name="id_rekanan">
							</div>

							<div class="form-group">
								<label>Konsultan Pengawas</label>
								<input type="text" id="autocomplete-konsultan" name="cari_konsultan" class="form-control" 
									placeholder="Cari Konsultan...">
								<input id="id_konsultan" type="hidden" name="id_konsultan">
							</div>

							<div class="form-group">
								<label>Keterangan (Catatan)</label>
								<textarea name="keterangan" class="form-control"></textarea>
							</div>

						</div>
					
				</div>
			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col-md-8 col-md-offset-1">
					Periksa Kembali Isian Data Proyek, klik tombol simpan untuk melanjutkan.
					<br>
					</div>
					<div class="col-md-2">
						<button type="submit" class="pull-right btn btn-sm btn-primary"> <i class="fa fa-save"></i> Simpan</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
@endsection
@section('javascript')
<script type="text/javascript">
	
	$(function(){


		var $validator_form_proyek = $('#form-proyek').validate({  
            rules: {
              nama_proyek: {
                required: true,
                minlength:5
              },
              nama_pekerjaan: {
                required: true,
                minlength:5
              },
              lokasi_pekerjaan: {
                required: true,
                minlength:4
              },
              id_jenis_proyek: {
                required: true,
              },
              id_sumber_dana: {
                required: true,
              },
              nilai_proyek: {
                required: true,
              },
              tgl_selesai: {
                required: true,
              },
              tgl_mulai: {
                required: true,
              },
              id_rekanan: {
                required: true,
                min:1
              },
              cari_rekanan: {
                required: true,
              },
              id_konsultan: {
                required: true,
                min:1
              },
              cari_konsultan: {
                required: true,
              }
            }
      });

		$('#autocomplete-rekanan').on('blur', function(){
			$(this).val('');
			$("#id_rekanan").val.val('');
		});

		$('#autocomplete-konsultan').on('blur', function(){
			$(this).val('');
			$("#id_konsultan").val.val('');
		})
		
		$('#autocomplete-rekanan').autocomplete({
			serviceUrl: "{{url('autocomplete/rekanan')}}",
		    paramName: 'keyword',
		    minChars: 3,
		    noSuggestionNotice: 'Nama Rekanan Tidak Ditemukan!',
		    onSelect: function(suggestion){
		    	$("#id_konsultan").val(suggestion.value);
		    }
		})

		$('#autocomplete-konsultan').autocomplete({
			serviceUrl: "{{url('autocomplete/konsultan')}}",
		    paramName: 'keyword',
		    minChars: 3,
		    noSuggestionNotice: 'Nama Konsultan Tidak Ditemukan!',
		    onSelect: function(suggestion){
		    	$("#id_konsultan").val(suggestion.value);
		    }
		})

	})
</script>
@endsection