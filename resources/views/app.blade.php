<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>@section("title") @show | TP4D Batang Hari</title>
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="{{asset('chain/css/style.default.css')}}" rel="stylesheet">
        <link href="{{asset('plugins/line-awesome/css/line-awesome.min.css')}}" rel="stylesheet">
        <link href="{{asset('css/select2.min.css')}}" rel="stylesheet">
        <link href="{{asset('css/select2-bootstrap.min.css')}}" rel="stylesheet">
        <link href="{{asset('css/bootstrap-datepicker3.standalone.css')}}" rel="stylesheet">
    </head>

    <body>
        
        <header>
            <div class="headerwrapper">
                <div class="header-left">
                    <a href="{{app_url('home')}}" class="logo">
                        <img src="{{asset('images/logo.png')}}" class="hidden-md hidden-sm hidden-lg" alt="" height="30" /> 
                        <img src="{{asset('images/logo-big.png')}}" class="hidden-xs" alt="" height="30" /> 
                    </a>
                    <div class="pull-right">
                        <a href="#" class="menu-collapse">
                            <i class="la la-bars"></i>
                        </a>
                    </div>
                </div><!-- header-left -->
                
                <div class="header-right">
                    <div class="pull-left hidden-xs">
                        <img src="{{asset('images/label.png')}}" height="36">
                    </div>
                    <div class="pull-right">                                                
                        <div class="btn-group btn-group-list btn-group-messages">
                            <h6 class="yellow">{{Auth::user()->nama_pengguna}} &nbsp;</h6>                        
                        </div><!-- btn-group -->
                        
                        <div class="btn-group btn-group-option">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                              <i class="la la-caret-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right" role="menu">
                              <li><a href="{{app_url('user-setting')}}"><i class="la la-user"></i> Setting</a></li>
                              <li><a href="{{app_url('petunjuk')}}"><i class="la la-question"></i> Petunjuk</a></li>
                              <li class="divider"></li>
                              <li><a href="{{url('logout')}}"><i class="la la-power-off"></i> Logout</a></li>
                            </ul>
                        </div><!-- btn-group -->
                        
                    </div><!-- pull-right -->
                    
                </div><!-- header-right -->
                
            </div><!-- headerwrapper -->
        </header>
        
        <section>
            <div class="mainwrapper">
                <div class="leftpanel">
                    @include("app.sidebar")
                </div><!-- leftpanel -->
                
                <div class="mainpanel">
                    <div class="pageheader">
                        @section("pageheader")
                        <div class="media">
                            <div class="pageicon pull-left">
                                <i class="la la-home"></i>
                            </div>
                            <div class="media-body">
                                <ul class="breadcrumb">
                                    <li><a href="{{app_url('home')}}"><i class="la la-home"></i></a> Beranda</li>
                                </ul>
                                <h4>Beranda</h4>
                            </div>
                        </div>
                        @show
                    </div>
                    
                    <div class="contentpanel">  
                        @section("content")
                        @show
                    </div>
                    
                </div>
            </div><!-- mainwrapper -->
        </section>


        <script src="{{asset('chain/js/jquery-1.11.1.min.js')}}"></script>
        <script src="{{asset('chain/js/jquery-migrate-1.2.1.min.js')}}"></script>
        <script src="{{asset('chain/js/bootstrap.min.js')}}"></script>
        <script src="{{asset('chain/js/modernizr.min.js')}}"></script>
        <script src="{{asset('chain/js/pace.min.js')}}"></script>
        <script src="{{asset('chain/js/retina.min.js')}}"></script>
        <script src="{{asset('chain/js/jquery.cookies.js')}}"></script>
        <script src="{{asset('chain/js/custom.js')}}"></script>
        <script src="{{asset('js/select2.min.js')}}"></script>
        <script src="{{asset('js/jquery.mask.min.js')}}"></script>
        <script src="{{asset('js/jquery.autocomplete.min.js')}}"></script>

        <script type="text/javascript">
            $(function(){
                $(".select2").select2({theme: "bootstrap"});
                $('.datepicker').mask("0000-00-00");
            })
        </script>
        @section('javascript')
        @show
    </body>
</html>
