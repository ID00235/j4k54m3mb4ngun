@extends('app')
@section("title") Beranda @endsection
@section("pageheader")
<div class="media">
    <div class="pageicon pull-left">
        <i class="la la-home"></i>
    </div>
    <div class="media-body">
        <ul class="breadcrumb">
            <li><a href="{{app_url('home')}}"><i class="la la-home"></i></a> Beranda</li>
        </ul>
        <h5>Beranda</h5>
    </div>
</div>
@endsection