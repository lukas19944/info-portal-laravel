<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class HasRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, ...$roles)
    {

        $user=Auth::user();

        if (!(Auth::check() && in_array($user->getRole(),$roles))){
            return redirect()->back();
        }


        return $next($request);
    }
}
