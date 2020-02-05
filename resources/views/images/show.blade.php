@extends('layouts.app')

@section('content')
    <div class="gallery">
        <div class="title-block justify-content-between">
            @auth
                @can('owner-or-admin',$image->gallery->user_id)
                <div class="edit-link"><a href="{{route('image.edit', ['image'=>$image,'gallery_name'=>$image->gallery->name])}}">Edit Image</a></div>
                <div class="delete-link">
                    <form action="{{route('image.destroy', $image)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete image</button>
                    </form>
                </div>
                @endcan
            @endauth
        </div>


        <div class="image-part">
            <a href="{{route('gallery.show',$image->gallery)}}"><h1 class="title">Gallery: {{$image->gallery->name}}</h1></a>
            <a target="_blank" href="{{asset("storage/uploads/gallery/$image->title")}}"><img alt="picture-show" src="{{asset("storage/uploads/gallery/$image->title")}}" class="image"></a>
            <p>Created at: {{$image->created_at}} by: <a href="">{{$image->gallery->users->name}}</a></p>
            <div class="interaction pull-right">
                {{--            <a href="#" class="like" data-id="{{$blog->id}}">{!! Auth::user()->likes()->where('blog_id',$blog->id)->first() ?Auth::user()->likes()->where('blog_id',$blog->id)->first()->like==1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>'!!}Like</a>--}}
                <span onclick="auth({{Auth::user()}})" class="like" data-id="{{$image->id}}">{!! $like===1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>' !!}Like</span>
                <span onclick="auth({{Auth::user()}})" class="like" data-id="{{$image->id}}">{!! $like===0?'<i class="fa fa-thumbs-down" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>' !!}Like</span>

            </div>
            <div class="image-description">
                <p>{!! $image->alt !!}</p>
            </div>
            <div class="tags">
                {{--        {{dd($article->tags)}}--}}
                @foreach($image->tags as $tag)

                    <div class="tag" id="tag"><a href="{{route('articles.tag.showByTag', $tag->name)}}">{{$tag->name}}</a></div>
                @endforeach
            </div>
        </div>

@endsection
        @section('js')
            @parent
            <script src="{{asset('/js/like.js')}}"></script>
            <script type="text/javascript">
                var token="{{ csrf_token() }}";
                var urlLike = '{{route('image.like')}}';


            </script>
@stop
