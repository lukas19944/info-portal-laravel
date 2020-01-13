<?php

namespace App\Http\Controllers\Gallery;

use App\Gallery;
use App\Http\Controllers\Articles\TagsController;
use App\Http\Controllers\Controller;
use App\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;


class ImagesController extends Controller
{

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function show($gallery_name, Image $image)
    {

        return view('images.show')->with('image',$image);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function edit($gallery_name,Image $image)
    {

        return view('images.edit')->with('image', $image);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Image $image)
    {

        $image->alt=$request->alt;
        $image->save();

        TagsController::addTag($request->tags,$image);

        return redirect(route('gallery.index'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function destroy(Image $image)
    {
        Storage::delete("public/uploads/gallery/$image->title");
        $image->tags()->detach();
        $image->delete();


        return redirect(route('gallery.show',$image->gallery()->first()));
    }

    public function store(Request $request){

            $request->validate([
                'images.*'=>'required|mimes:jpg,jpeg,bmp,png,gif|max:5000',
                'tags'=>'max:20',
            ]);

            foreach ($request->file('images') as $image) {

                $image = ImagesController::add($request,$image,$request->gallery_id);

                TagsController::addTag($request->tags, $image);
            }


        return redirect(route('gallery.index'));
    }
//    Add images to the database and save them. Actually function save single image, not array.
    public static function add(Request $request, $image, $gallery_id){

            $newimage = new Image();
            $extension = $image->getClientOriginalExtension();
            $filename = rand(10000000, 99999999) . '.' . $extension;
            $image->storeAs('public/uploads/gallery', $filename);
            $newimage->title = $filename;
            $newimage->alt = $request->alt;
            $newimage->gallery_id = $gallery_id;
            $newimage->save();
            return $newimage;
        }

}
