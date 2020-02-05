@extends('layouts.app')

@section('content')

    <div class="blog-show">
        <div class="title-block">
        <h1 class="title">{{$blog->title}}</h1>
            @auth
                @can('owner-or-admin',$blog->user_id)
        <div class="edit-link"><a href="{{route('blog.edit', $blog)}}">Edit</a></div>
                <div class="delete-link">
                    <form action="{{route('blog.destroy', $blog)}}" method="POST">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger">Delete article</button>
                    </form>
                </div>
                @endcan
            @endauth
        </div>
        <p>Created at: {{$blog->created_at}} by <a href="{{route('users.profile.showProfile',$blog->users->name)}}">{{$blog->users->name}}</a></p>
        <div class="article-content">{!!$blog->blog_content!!}</div>

    @isset($gallery)
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

        @foreach($blog->tags as $tag)

        <div class="tag" id="tag"><a href="{{route('articles.tag.showByTag', $tag->name)}}">{{$tag->name}}</a></div>
            @endforeach
    </div>
        <div class="interaction">
{{--            <a href="#" class="like" data-id="{{$blog->id}}">{!! Auth::user()->likes()->where('blog_id',$blog->id)->first() ?Auth::user()->likes()->where('blog_id',$blog->id)->first()->like==1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>'!!}Like</a>--}}
            <span onclick="auth({{Auth::user()}})" class="like" data-id="{{$blog->id}}">{!! $like===1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>' !!}Like</span>
            <span onclick="auth({{Auth::user()}})" class="like" data-id="{{$blog->id}}">{!! $like===0?'<i class="fa fa-thumbs-down" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>' !!}Like</span>

        </div>
        <div class="comment">
            <div class="row bootstrap snippets">
                <div class="col-md-6 col-md-offset-2 col-sm-12">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="comment-wrapper">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <p>Comments</p>
                            </div>
                            <div class="panel-body">
                            @auth()
                                <form action="{{route('comment.add',['id'=>$blog->id])}}" method="post">
                                        <textarea class="form-control" name="contents" placeholder="write a comment..." rows="3"></textarea>
                                        <br>
                                    @csrf
                                        <button type="submit" class="btn btn-info pull-right">Post</button>
                                </form>
                            @endauth
                                <div class="clearfix"></div>

                                <ul class="media-list">
                            @foreach($comments as $comment)
                                <hr>
                                    <li class="media">
                                        <a href="#" class="pull-left">
                                            <img src="{{asset("storage/uploads/users/avatar/".$comment->user->avatar)}}" alt="" class="img-circle">
                                        </a>
                                        <div class="media-body">
                                    <span class="text-muted pull-right">
                                        <small class="text-muted">{{$comment->created_at}}</small>
                                        @can('owner-or-admin', $comment->user_id)
                                        <div class="delete-link">
                                            <form action="{{route('comment.destroy', $comment)}}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger pull-right">X</button>
                                            </form>
                                        </div>
                                            @endcan
                                    </span>
                                            <strong class="text-success">{{$comment->user->name}}</strong>
                                            <p>
                                                {{$comment->contents}}
                                            </p>
                                        </div>
                                    </li>

                                @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>



    </div>
@endsection
@section('js')
    @parent
    <script src="{{asset('/js/like.js')}}"></script>
    <script type="text/javascript">
        var token="{{ csrf_token() }}";
        var urlLike = '{{route('blog.like')}}';


    </script>
@stop
