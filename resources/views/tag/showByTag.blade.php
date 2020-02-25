@extends('layouts.app')

@section('content')

    <div class="main">
        <div class="nav">
            <a class="link" href="{{route('articles.index')}}">Articles</a>
            <a class="link" href="{{route('gallery.index')}}">Gallery</a>
            <a class="link" href="{{route('home')}}">Home</a>
        </div>
        <div class="content">
            <div class="card">
                <div class="card-header">Search by tag: {{$tags->name}}</div>
                    @foreach($articles as $article)
                        <div class="card" style="width: 100%;">
                            <div class="card-body">
                                <h5 class="card-title"><a href="{{route('articles.show',$article)}}">{{$article->title}}</a></h5>
                                <h6 class="card-subtitle mb-2 text-muted">{{$article->created_at}}</h6>
                                <p class="card-text">{{$article->short_description}}</p>

                            </div>
                        </div>
                    @endforeach
                @foreach($galleries as $gallery)
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title"><a href="{{route('gallery.show',$gallery)}}">Gallery: {{$gallery->name}}</a></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{$gallery->created_at}}</h6>
                        </div>
                    </div>
                @endforeach
                @foreach($images as $image)
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title"> <a href="{{route('image.show',['image'=>$image,'gallery_name'=>$image->gallery->name])}}">Picture</a></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{$image->created_at}}</h6>
                            <a href="{{route('image.show',['image'=>$image,'gallery_name'=>$image->gallery->name])}}"><img class="small-thumbnail" src="{{asset("storage/uploads/gallery/$image->title")}}" alt="{{$image->alt}}"></a>



                        </div>
                    </div>
                @endforeach
                @foreach($blogs as $blog)
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <h5 class="card-title"> <a href="{{route('blog.show',$blog)}}">{{$blog->title}}</a></h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{$blog->created_at}}</h6>




                        </div>
                    </div>
                @endforeach

            </div>
        </div>
    </div>

@endsection
