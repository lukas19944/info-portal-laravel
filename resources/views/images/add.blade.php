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
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="card">
                    <div class="card-header">Add image to gallery </div>

                    <div class="card-body">
                        <form action="{{route('image.store')}}" method="post" enctype="multipart/form-data">


                            <div class="form-group row">
                                <label class="col-md-2 col-form-label ">Select images:</label>

                                <input type="file" name="images[]" class="col-md-8 " multiple>

                            </div>
                            <div class="form-group">
                                <div>
                                    <label for="alt" class=" col-form-label">Add short inscription for images:</label>
                                </div>
                                <textarea name="alt" id="alt" class="form-control"  rows="3"></textarea>
                            </div>



                            @csrf

                            <div class="form-group row ">

                                <label for="tags" class="col-md-2 col-form-label ">Tags: </label>
                                <input type="text" name="tags"  id="tags" data-role="tagsinput" class="col-md-8 form-control" >

                            </div>
                            <input type="hidden" name="gallery_id" value="{{$gallery->id}}">

                            <button type="submit" class="btn btn-primary float-right">Create gallery</button>

                        </form>



                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection

