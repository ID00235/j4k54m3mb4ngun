<?php
$path =request()->path();
$path = explode("/", $path); 
$path = $path[0]; //$path[0]='app';
$menu = json_decode(Session::get('session_menu'));
?>

<div class="media profile-left">
    <a class="pull-left profile-thumb" href="profile.html">
        <img class="img-circle" src="{{asset('images/profile3.png')}}" alt="">
    </a>
    <div class="media-body">
        <h4 class="media-heading">{{Auth::user()->username}}</h4>
        <small class="text-muted">{{Auth::user()->nama_pengguna}}</small>
    </div>
</div><!-- media -->
<ul class="nav nav-pills nav-stacked">
    <li @if($path=='home') class="active" @endif>
        <a href="{{url('home')}}"><i class="la la-home"></i> <span>Beranda</span></a>
    </li>
</ul>
<?php $group_menu=""; $no=1;?>
@foreach($menu as $m)
@if($group_menu !=$m->group_menu && $no>1)
</ul>
@endif
@if($group_menu !=$m->group_menu)
<?php $group_menu=$m->group_menu;?>
<h5 class="leftpanel-title">{{strtoupper($group_menu)}}</h5>
<ul class="nav nav-pills nav-stacked">
@endif
    <li @if($m->url==$path) class="active" @endif>
        <a href="{{url($m->url)}}">
            <i class="{{$m->icon}}"></i> <span>{{$m->nama_menu}}</span>
            @if($m->url=='konsultasi')
            <!--
            <span class="pull-right badge">12</span>
            -->
            @endif
            @if($m->url=='warning-proyek')
            <!--
            <span class="pull-right badge">12</span>
            -->
            @endif
        </a>
    </li>      
<?php $no++;?>
@endforeach
</ul>

