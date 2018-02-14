<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Session;
use DB;

class RolesMenu
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        $path =request()->path();
        $path = explode("/", $path); 
        $path = $path[0]; 
        //cek Role
        $id_user = Auth::user()->id;
        $cek_crud = DB::select("SELECT a.a_update, a.a_delete, a.a_create, d.scope_instansi FROM role_menu as a, menu as b, user_role as c, roles as d where b.url = '$path' and b.id_menu = a.id_menu 
        and c.id_role = a.id_role and  c.id_role = d.id_role and c.id_user = $id_user");
        if (count($cek_crud)==0){
            return response('Akses Menu Ditolak', 401);
        }else{
            $role = $cek_crud[0];
            Session::put('a_create', $role->a_create);
            Session::put('a_update', $role->a_update);
            Session::put('a_delete', $role->a_delete);
            Session::put('scope_instansi', $role->scope_instansi);
        }

        return $next($request);
    }
}
