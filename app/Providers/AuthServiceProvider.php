<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use function foo\func;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('manage-users',function ($user){
            return $user->hasRole('admin');
        });


        Gate::define('owner-or-admin',function ($user,$user_id_of_element){
            return $user->id===$user_id_of_element || $user->hasRole('admin');
        });
        // Delete comments can admin user, blog owner and comment owner
        Gate::define('delete-comments',function ($user, $blog_owner, $comment_owner=null){
            return $user->id==$comment_owner || $user->id==$blog_owner || $user->hasRole('admin');
        });

        Gate::define('manage-comments',function ($user){
            return $user->hasRole('admin') || $user->hasRole('moderator');
        });

    }
}
