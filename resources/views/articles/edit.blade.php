@extends('layouts.app')
@section('js')
@parent
<script src="{{asset('js/bootstrap-tagsinput.js')}}"></script>
<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>
@stop
@section('css')
    @parent
    <link href="{{asset('css/bootstrap-tagsinput.css')}}" rel="stylesheet">
    @stop

@section('content')

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Edit article</div>

                    <div class="card-body">
                        <form action="{{route('articles.update', $article)}}" method="post">
                                                        @method('PUT')
{{--                                                        {{method_field('PUT')}}--}}
                            <div class="form-group row">
                                <label for="title" class="col-md-2 col-form-label text-md-right">Title:</label>
                                <div class="col-md-8">
                                    <input type="text" id="title" name="title" class="form-control" value="{{$article->title}}">
                                </div>
                            </div>


                            <div class="form-group" >
                                <textarea name="article_content">{{$article->content}}</textarea>
                            </div>
                            @csrf
                            <div class="form-group ">
                                <label for="tags" class="col-md-2 col-form-label text-md-right">Tags: </label>
                                <input type="text" name="tags" id="tags" data-role="tagsinput" class="col-md-8 form-control" value="{{implode(',',$article->tags()->get()->pluck('name')->toArray())}}">

                            </div>
                            <div class="form-group">
                                <label for="for-registered" class="col-md-4 col-form-label text-md-right">Only for registered users</label>
                                <input type="hidden" value="0" name="only-for_registered">
                                <input type="checkbox" name="only_for_registered" id="for-registered" @if($article->is_auth===1) checked @endif>
                            </div>

                            <div class="form-group row">
                                <label for="gallery" class="col-md-2 col-form-label">Select gallery: </label>

                                <div class="col-md-8">
                                    <select name="selected_gallery" class="custom-select">
                                        <option value="" selected>Choose...</option>
                                        @isset($galleries)
                                            @foreach($galleries as $gallery)
                                                <option value="{{$gallery->id}}">{{$gallery->name}}</option>
                                            @endforeach
                                        @endisset
                                    </select>
                                </div>
                            </div>


                            <button type="submit" class="btn btn-primary float-right">Update</button>

                        </form>



                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection
<script type="text/javascript">
    // setTimeout(function() {
    //     CKEDITOR.replace('content');
    // },100);
    function editor() {
        CKEDITOR.replace('article_content');
    }
    document.addEventListener("DOMContentLoaded", function () {
        editor();
    });
</script>
