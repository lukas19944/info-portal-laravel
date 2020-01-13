<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){
        $user=Auth::user();
        return view('users.profile.profile', $user);
    }

    public function update(Request $request){

        $user = Auth::user();


        $request->validate([
            'avatar'  => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'name' => 'string| min:3| max:20',
            'birthday' => 'date_format:Y-m-d',
        ]);

        if($request->hasFile('avatar')){
            $file=$request->file('avatar');
            $extension=$file->getClientOriginalExtension();
            $filename=time().'.'.$extension;
            $file->storeAs('public/uploads/users/avatar', $filename);
            $user->avatar=$filename;
        }
        $user->birthday_date=$request->birthday;
        $user->save();

        return redirect()->route('users.profile.index',$user->name);


    }
    public function changePassword(Request $request)
    {
        $user = Auth::user();
        $request->validate([
            'password'=> ['required', 'string', 'min:8', 'confirmed'],
        ]);
        if (Hash::check($request->old_password, $user->password) ) {
            $pass=Hash::make($request->password);
            $user->password=$pass;
            $user->save();
            return redirect()->route('users.profile.index',$user->name)->with('status', "Password has been changed");
        }
        return redirect()->route('users.profile.index',$user->name)->with('status', "Wrong data");

    }
    public function showProfile( $user_name){
        $user=User::where('name',$user_name)->first();
        $articles=$user->articles()->get();
        $user['articles_amount']=count($articles);
        return view('users.profile.show')
            ->with('user',$user)
            ->with('articles',$articles);
    }

}
