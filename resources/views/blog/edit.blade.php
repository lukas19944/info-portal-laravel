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
                    <div class="card-header">Create article</div>

                    <div class="card-body">
                        <form action="{{route('blog.store')}}" method="post">

                            <div class="form-group row">
                                <label for="title" class="col-md-2 col-form-label text-md-right">Title:</label>
                                <div class="col-md-8">
                                    <input type="text" id="title" name="title" class="form-control">
                                </div>
                            </div>


                            <div class="form-group" >
                                <textarea name="blog_content"></textarea>
                            </div>
                            @csrf

                            <div class="form-group ">
                                <label for="tags" class="col-md-2 col-form-label text-md-right">Tags: </label>
                                <input type="text" name="tags"  id="tags" data-role="tagsinput" class="col-md-8 form-control" >

                            </div>

                            <button type="submit" class="btn btn-primary float-right">Create Article</button>

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
        CKEDITOR.replace('blog_content');
    }
    document.addEventListener("DOMContentLoaded", function () {
        editor();
    });
</script>
