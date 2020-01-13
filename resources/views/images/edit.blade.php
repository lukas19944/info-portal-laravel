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
                    <div class="card-header">Edit Image</div>

                    <div class="card-body">
                        <form action="{{route('image.update', $image)}}" method="post">
                            @method('PUT')
                            {{-- {{method_field('PUT')}}    --}}
                            <div class="form-group row">
                                <label for="alt" class="col-md-2 col-form-label text-md-right">Description:</label>
                                <div class="col-md-8">
                                    <textarea name="alt" id="alt" class="form-control">{{$image->alt}}</textarea>
                                </div>
                            </div>


                            @csrf
                            <div class="form-group ">

                                <label for="tags" class="col-md-2 col-form-label text-md-right">Tags: </label>
                                <input type="text" name="tags" id="tags" data-role="tagsinput" class="col-md-8 form-control" value="{{implode(',',$image->tags()->get()->pluck('name')->toArray())}}">

                            </div>


                            <button type="submit" class="btn btn-primary float-right">Update</button>

                        </form>



                    </div>
                </div>
            </div>
        </div>

    </div>

@endsection

