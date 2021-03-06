<?php

namespace App\Http\Controllers\Gallery;

use App\Gallery;
use App\Http\Controllers\Articles\TagsController;
use App\Http\Controllers\Controller;
use App\Image;
use App\Tag;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use mysql_xdevapi\Exception;


class GalleriesController extends Controller
{
    public function __construct()
    {

        $this->middleware('hasrole:admin,author',['only'=>['create','store','edit','update','destroy','addImage']]);

    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $this->middleware('hasrole:admin');
        $galleries=Gallery::all();
        return view('gallery.index')->with('galleries',$galleries);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("gallery.create");

    }

        /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {


            $request->validate([
                'name'=>'required|max:60',
                'images.*'=>'mimes:jpg,jpeg,bmp,png,gif|max:5000',
                'tags'=>'max:20',
            ]);

            $gallery = new Gallery();

            $gallery->name = $request->name;
            $gallery->user_id = Auth::id();
            $gallery->save();

//            add tags to gallery
            TagsController::addTag($request->tags,$gallery);

            // save images

                foreach ($request->file('images') as $image) {
                    $image=ImagesController::add($request,$image, $gallery->id);

//            add tags to images (inherited from the gallery)

                    TagsController::addTag($request->tags, $image);

                }

            return redirect(route('gallery.index'));

    }



    /**
     * Display the specified resource.
     *
     * @param  \App\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function show(Gallery $gallery)
    {

        return view('gallery.show')->with('gallery', $gallery);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function edit(Gallery $gallery)
    {
        if(Gate::allows('owner-or-admin',$gallery->user_id)){

            return view('images.edit')->with('gallery', $gallery);
        }
        return redirect()->back();

    }



    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Gallery  $gallery
     * @return \Illuminate\Http\Response
     */
    public function destroy(Gallery $gallery)
    {
        if (!Gate::allows('owner-or-admin', $gallery->user_id)){
            abort(401,'You do not have permission');
        }
        $images=$gallery->images()->get();
        $directory="public/uploads/gallery/";


        foreach ($images as $image) {
            $image->tags()->detach();
            $image->imagelikes()->delete();

            $filenames[]=$directory.$image->title;
        }

        Storage::delete($filenames);

        $gallery->images()->delete();
        $gallery->tags()->detach();
        $gallery->delete();
        return redirect(route('gallery.index'));
    }
    public function addImage($gallery){

        $id=strstr($gallery,'-',true);
        $gallery = Gallery::where('id', $id)->first();

        if (!$gallery){
            abort(404);

        }
        if (!Gate::allows('owner-or-admin', $gallery->user_id)){
            abort(401,'You do not have permission');
        }


        return view('images.add')
            ->with('gallery', $gallery);




    }
}
