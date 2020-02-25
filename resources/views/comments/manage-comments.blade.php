@extends('layouts.app')
@section('title',' - Manage Comments')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <a href="{{route('comment.list')}}">All comments</a>
                <a href="{{route('comment.list',['confirmed'=>'0'])}}">Not confirmed</a>
                <a href="{{route('comment.list',['confirmed'=>'1'])}}">Confirmed</a>


                <div class="card">
                    <div class="card-header">List of not confirm comments</div>

                    <div class="card-body">

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Owner</th>
                                <th scope="col">Blog</th>
                                <th scope="col">Contents</th>
                                <th scope="col">Confirmed</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($comments as $comment)
                                <tr>
                                    <th scope="row">{{$comment->id}}</th>
                                    <td>{{$comment->user()->first()?$comment->user->name:$comment->nick}}</td>
                                    <td><a href="{{route('blog.show',$comment->blog()->first())}}">{{$comment->blog->title}}</a></td>
                                    <td>{{$comment->contents}}</td>
                                    <td>{{$comment->confirmed==1?'Yes':'No'}}</td>
                                    <td class="row">
                                        @if($comment->confirmed==0)
                                            <a href="{{route('comment.confirm', $comment)}}"><button type="button" class="btn btn-success"><i class="fa fa-check-square" aria-hidden="true"></i></button></a>
                                            @endif
                                            <form action="{{route('comment.destroy',[$comment,'blog'=>$comment->blog->id])}}" method="POST" >
                                            @csrf
                                            {{ method_field('DELETE') }}
                                            <button type="submit" class="btn btn-danger"><i class="fa fa-window-close" aria-hidden="true"></i></button>
                                        </form>
                                    </td>
                                </tr>

                            @endforeach


                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
