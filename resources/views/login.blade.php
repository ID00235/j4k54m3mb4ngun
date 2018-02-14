<!DOCTYPE html>
<html lang="en">
    
<!-- Mirrored from steelcoders.com/space/demo/theme/templates/admin2/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Jan 2018 12:56:29 GMT -->
<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Responsive Admin Dashboard Template">
        <meta name="keywords" content="admin,dashboard">
        <meta name="author" content="stacks">
        <!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        
        <!-- Title -->
        <title>Login Pengguna - TP4D Kab. Batang Hari</title>

        <!-- Styles -->
        <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
        <link href="{{asset('plugins/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
        <link href="{{asset('plugins/line-awesome/css/line-awesome.min.css')}}" rel="stylesheet">      
        <!-- Theme Styles -->
        <link href="{{asset('css/space.min.css')}}" rel="stylesheet">
        <link href="{{asset('css/admin2.css')}}" rel="stylesheet">
        <link href="{{asset('css/custom.css')}}" rel="stylesheet">
    </head>
    <body>
        <!-- Page Container -->
        <div class="page-container">
                <!-- Page Inner -->
                <div class="page-inner login-page">
                    <div id="main-wrapper" class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 col-md-3 login-box polaroid-right">
                                <center>
                                <img src="{{asset('images/tp4d.png')}}" class="img img-responsive">
                                </center>
                                <hr>
                                <p class="text-center text-line">Silahkan Login Menggunakan Akun TP4D</p>
                                <form method="post" action="{{url('submit-login')}}">
                                    {{csrf_field()}}
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Username</label>
                                        <input type="text" name="username" required placeholder="Masukan Username" class="form-control" id="exampleInputEmail1">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" required placeholder="Masukan Password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <center>
                                    <button type="submit" class="btn btn-primary"><i class="la la-key"></i> Login</button>
                                    <hr>
                                    <a href="{{url('lupa-password')}}">Lupa password</a> | 
                                    <a href="{{url('panduan')}}">Panduan Aplikasi</a>
                                    </center>
                                    <p>&nbsp;</p>
                                </form>
                            </div>
                        </div>
                    </div>
            </div><!-- /Page Content -->
        </div><!-- /Page Container -->
        
        
        <!-- Javascripts -->
        <script src="{{asset('plugins/jquery/jquery-3.1.0.min.js')}}" ></script>
        <script src="{{asset('plugins/bootstrap/js/bootstrap.min.js')}}" ></script>
        <script src="{{asset('plugins/bootbox/bootbox.min.js')}}" ></script>
        <script src="{{asset('js/space.min.js')}}" ></script>
        <script type="text/javascript">
            $(function(){
                @if(Session::has('alert'))
                        bootbox.alert({
                            message: "{{Session::get('alert')}}",
                            backdrop: true,
                            title:"<error>Terjadi Kesalahan!</error>"
                        });
                @endif
            })
        </script>
    </body>
</html>