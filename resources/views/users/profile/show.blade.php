@extends('layouts.app')

@section('content')
    <div class="main">
        <div class="sidebar">
            <div class="profile mx-auto">
                <div class="avatar">
                    <img src="{{asset("storage/uploads/users/avatar/$user->avatar")}}"  class="avatar-image" alt="">
                </div>
                <div class="info">
                    <p class="name">{{$user->name}}</p>
                    <p>Role: <b>{{implode('',$user->roles()->get()->pluck('name')->toArray())}}</b></p>
                    <p>{{$user->birthday_date}}</p>
                    <p>{{$user->email}}</p>
                    <p>Joined: {{$user->created_at}}</p>
                    <p>Articles: {{$user->articles_amount}}</p>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="row justify-content-center">
                @foreach($articles as $article)
                    <div class="card" style="width: 100%;">
                        <div class="card-header">Articles</div>
                        <div class="card-body">
                            <h5 class="card-title"><a href="{{route('articles.show',$article)}}">{{$article->title}}</a></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{$article->created_at}}</h6>
                            <p class="card-text">{{$article->short_description}}</p>

                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection
