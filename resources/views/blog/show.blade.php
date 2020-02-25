@extends('layouts.app')
@section('title', " - $blog->title")
@section('meta')
    <meta name="description" content="{{$blog->short_content}}"/>
    @foreach($blog->tags as $keywords)
    <meta name="keywords" content="{!!$keywords->name!!}"/>
    @endforeach
@stop
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
        <div class="like-counter row">
            <p class="likes">Like: {{$likes}}</p>
            <p class="dislikes">Dislike: {{$dislikes}}</p>
        </div>
        <div class="interaction">
{{--            <a href="#" class="like" data-id="{{$blog->id}}">{!! Auth::user()->likes()->where('blog_id',$blog->id)->first() ?Auth::user()->likes()->where('blog_id',$blog->id)->first()->like==1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>'!!}Like</a>--}}
            <span class="like" data-id="{{$blog->id}}">{!! $like===1?'<i class="fa fa-thumbs-up" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>' !!}Like</span>
            <span class="like" data-id="{{$blog->id}}">{!! $like===0?'<i class="fa fa-thumbs-down" aria-hidden="true"></i>':'<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>' !!}Like</span>
{{--            onclick="addLike()"--}}
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
                                <form action="{{route('comment.add',['id'=>$blog->id])}}" method="post">
                                    @guest()
                                        <input name="nick" type="text" class="form-control" placeholder="Your nick">
                                    @endguest
                                        <textarea class="form-control" name="contents" placeholder="write a comment..." rows="3"></textarea>
                                        <br>
                                    @csrf
                                        <button type="submit" class="btn btn-info pull-right">Post</button>

                                </form>
                                <div class="clearfix"></div>

                                <ul class="media-list">
                            @foreach($comments as $comment)

                                <hr>
                                    <li class="media">
                                        <a href="#" class="pull-left">
                                            @if($comment->user()->first())
                                            <img src="{{asset("storage/uploads/users/avatar/".$comment->user->avatar)}}" alt="" class="img-circle">
                                            @else
                                                <img src="{{asset("storage/uploads/users/avatar/users.png")}}" alt="" class="img-circle">
                                            @endif
                                        </a>
                                        <div class="media-body">
                                            @can('delete-comments', [$blog->user_id,$comment->user_id])
                                    <span class="text-muted pull-right">
                                        <small class="text-muted">{{$comment->created_at}}</small>

                                        <div class="delete-link">
                                            <form action="{{route('comment.destroy', [$comment,'blog'=>$blog->id])}}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger pull-right">X</button>
                                            </form>
                                        </div>

                                    </span>
                                            @endcan
                                            @if($comment->user()->first())
                                                <a href=""><strong class="text-success">{{$comment->user->name}}</strong></a>
                                            @else
                                                <strong class="text-success">{{$comment->nick}}</strong>
                                            @endif
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
        var auth_user='{{Auth::user()}}';


    </script>
@stop
