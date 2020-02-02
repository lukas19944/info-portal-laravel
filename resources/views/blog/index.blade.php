@extends('layouts.app')

@section('content')
    <div class="blog-nav">
        <a class="blog-link" href="{{route('blog.create')}}">Create article</a>
        <a class="blog-link" href="{{route('home')}}">Home</a>
    </div>
            <div class="blog-main">
                <div class="blog-index">
                    @foreach($blogs as $blog)
                    <div class="card" style="width: 100%;">
                        <a href="{{route('blog.show',$blog)}}">
                            <div class="card-body">
                                <h5 class="card-title">{{$blog->title}}</h5>
                                <h6 class="card-subtitle mb-2 text-muted">{{$blog->created_at}}</h6>
                                <p class="card-text">{{$blog->short_content}}</p>
                            </div>
                        </a>
                    </div>
                    @endforeach

                </div>
                <div class="d-flex">
                    <div class="pagination mx-auto ">{{$blogs->links()}}</div>
                </div>
            </div>






@endsection
