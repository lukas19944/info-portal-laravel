@extends('layouts.app')

@section('content')
    <div class="main">
        <div class="nav">
            <a class="link" href="{{route('articles.index')}}">Articles</a>
            @auth
            <a class="link" href="{{route('articles.create')}}">Create article</a>
            @endauth
            <a class="link" href="{{route('home')}}">Home</a>
        </div>
        <div class="content">
            <div class="row justify-content-center">
                @foreach($articles as $article)
                    <div class="card" style="width: 100%;">
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
