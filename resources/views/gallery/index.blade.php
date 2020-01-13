@extends('layouts.app')

@section('content')

    <div class="main">
        <div class="nav">
            <a class="link" href="{{route('gallery.index')}}">Gallery</a>
            @auth
                <a class="link" href="{{route('gallery.create')}}">Create gallery</a>
            @endauth
            <a class="link" href="{{route('home')}}">Home</a>
        </div>
        <div class="content">
            <div class="row justify-content-center">
                @foreach($galleries as $gallery)
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title"><a href="{{route('gallery.show', $gallery)}}">{{$gallery->name}}</a></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{$gallery->created_at}}</h6>

                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>



@endsection

