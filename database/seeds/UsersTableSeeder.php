<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\User;
use App\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::truncate();
        DB::table('role_user')->truncate();

        $adminRole=Role::where('name','admin')->first();
        $authorRole=Role::where('name', 'author')->first();
        $moderatorRole=Role::where('name', 'moderator')->first();
        $userRole=Role::where('name', 'users')->first();

        $admin=User::create([
            'name'=>'Admin User',
            'email'=>'admin@admin.com',
            'password'=>Hash::make('password')
        ]);

        $author=User::create([
            'name'=>'Author User',
            'email'=>'author@admin.com',
            'password'=>Hash::make('password')
        ]);

        $moderator=User::create([
            'name'=>'Moderator User',
            'email'=>'moderator@admin.com',
            'password'=>Hash::make('password')
        ]);

        $user=User::create([
            'name'=>'User',
            'email'=>'users@admin.com',
            'password'=>Hash::make('password')
        ]);

        $admin->roles()->attach($adminRole);
        $author->roles()->attach($authorRole);
        $moderator->roles()->attach($moderatorRole);
        $user->roles()->attach($userRole);


    }
}
