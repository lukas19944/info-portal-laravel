@extends('layouts.app')
@section('title', " - $gallery->name")
@section('meta')
    <meta name="description" content="Galeria: {{$gallery->name}}"/>
    @foreach($gallery->tags as $keywords)
        <meta name="keywords" content="{!!$keywords->name!!}"/>
    @endforeach
@stop
@section('content')
    <div class="gallery">
        <div class="title-block">
            <h1 class="title">{{$gallery->name}}</h1>
            @auth
                @can('owner-or-admin',$gallery->user_id)
                <div class="edit-link"><a href="{{route('gallery.addimage', $gallery)}}">Add image</a></div>
                <div class="delete-link">
                    <form action="{{route('gallery.destroy', $gallery)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete gallery</button>
                    </form>
                </div>
                @endcan
            @endauth
        </div>
            <p>Created at: {{$gallery->created_at}} by: <a href="">{{$gallery->users->name}}</a></p>


            <div class="row col-md-12">
                @foreach($gallery->images as $image)
                    <figure class="col-md-3">
                        <a href="{{route('image.show',['image'=>$image,'slug'=>$image->gallery])}}"><img alt="picture" src="{{asset("storage/uploads/gallery/$image->title")}}" class="gallery-image"></a>
                    </figure>
                @endforeach

            </div>
    </div>
        <div class="tags">
{{--            TODO: Tag bad redirect--}}
            @foreach($gallery->tags as $tag)

                <div class="tag" id="tag"><a href="{{route('articles.tag.showByTag', $tag->name)}}">{{$tag->name}}</a></div>
            @endforeach
        </div>


@endsection
