@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    @if (session('status'))
                        <div class="alert alert-primary" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                    @endif
                    <div class="card-header">Profil</div>

                    <div class="card-body">
                        <form action="{{ action('Users\ProfileController@update')}}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-group row">
                                <div class="avatar mx-auto">
                                <img src="{{asset("storage/uploads/users/avatar/$avatar")}}" alt="" class="avatar-image" id="avatar">
                                </div>
                            </div>
                            <div class="form-group row ">

                                <label for="avatar-file" class="col-md-6 col-form-label text-md-right">Change avatar:</label>
                                <div class="col-md-6">
                                <input type="file" name="avatar" id="avatar-file">
                                </div>
                            </div>
                            <div class="form-group row ">

                                <label for="name" class="col-md-6 col-form-label text-md-right">Name:</label>
                                <div class="col-md-6">
                                    <input type="text" name="name" id="name" value="{{$name}}" >
                                </div>

                            </div>
                            <div class="form-group row ">

                                <label for="birthday" class="col-md-6 col-form-label text-md-right">Birthday:</label>
                                <div class="col-md-6">
                                    <input type="date" name="birthday" id="birthday" value="{{$birthday_date}}" >
                                </div>

                            </div>


                        <button type="submit" class="btn btn-primary float-right">OK</button>
                        </form>
                    </div>
                    <div class="card-header">Change Password</div>
                    <div class="card-body">
                        <form action="{{ action('Users\ProfileController@changePassword')}}" method="POST" enctype="multipart/form-data">
                        @csrf
                            <div class="form-group row ">

                                <label for="old-password" class="col-md-6 col-form-label text-md-right">Old Password:</label>
                                <div class="col-md-6">
                                    <input type="password" name="old_password" id="old-password" required>

                                </div>
                            </div>
                            <div class="form-group row ">

                                <label for="new-password" class="col-md-6 col-form-label text-md-right">New Password:</label>
                                <div class="col-md-6">
                                    <input type="password" name="password" id="new-password" required>

                                </div>
                            </div>
                            <div class="form-group row ">

                                <label for="confirm-password" class="col-md-6 col-form-label text-md-right">confirm Password:</label>
                                <div class="col-md-6">
                                    <input type="password" name="password_confirmation" id="confirm-password" required>

                                </div>
                            </div>
                            <button type="submit" class="btn btn-danger float-right">Change Password</button>

                        </form>
                    </div>
                </div>



                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
