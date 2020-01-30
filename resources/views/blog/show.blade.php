@extends('layouts.app')

@section('content')

    <div class="article">
        <div class="title-block">
        <h1 class="title">{{$article->title}}</h1>
            @auth
                @can('owner-or-admin',$article->user_id)
        <div class="edit-link"><a href="{{route('articles.edit', $article)}}">Edit</a></div>
                <div class="delete-link">
                    <form action="{{route('articles.destroy', $article)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete article</button>
                    </form>
                </div>
                @endcan
            @endauth
        </div>
        <p>Created at: {{$article->created_at}} by <a href="{{route('users.profile.showProfile',$article->users->name)}}">{{$article->users->name}}</a></p>
        <div class="article-content">{!!$article->content!!}</div>
    </div>
    @isset($gallery))
    <div class="gallery">

        <div class="row col-sm-12">

        @foreach($images as $image)
            <figure class="col-sm-3">
                <a href="{{route('image.show',['image'=>$image,'gallery_name'=>$image->gallery->name])}}"><img alt="picture" src="{{asset("storage/uploads/gallery/$image->title")}}" class="gallery-image"></a>
            </figure>
        @endforeach

        </div>
        <p><a href="{{route('gallery.show',$gallery)}}">See more images</a></p>
    </div>
    @endisset
    <div class="tags">

        @foreach($article->tags as $tag)

        <div class="tag" id="tag"><a href="{{route('articles.tag.showByTag', $tag->name)}}">{{$tag->name}}</a></div>
            @endforeach
    </div>

@endsection
