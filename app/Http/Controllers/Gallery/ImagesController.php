<?php

namespace App\Http\Controllers\Gallery;

use App\Gallery;
use App\Http\Controllers\Articles\TagsController;
use App\Http\Controllers\Controller;
use App\Image;
use App\ImageLikes;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;


class ImagesController extends Controller
{
    public function __construct()
    {
        $this->middleware('hasrole:admin,author',['only'=>['store','edit','update','destroy']]);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function show($gallery_name, Image $image)
    {
        $data=['image'=>$image];
        $like=Auth::user()?Auth::user()->imagelikes()->where('image_id',$image->id)->first() ? Auth::user()->imagelikes()->where('image_id',$image->id)->first()->like  :null:null;
        $data=Arr::add($data,'like',$like);

        return view('images.show',$data);
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function edit($slug,Image $image)
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
                'images'=>'required',
                'images.*'=>'mimes:jpg,jpeg,bmp,png,gif|max:5000',
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
    public function addLike(Request $request)
    {

        if (Auth::user()) {
            $like = ImageLikes::where([
                ['image_id', '=', $request->id],
                ['user_id', '=', Auth::user()->id],
            ])->first();

            if ($like === null) {
                ImageLikes::create([
                    'user_id' => Auth::user()->id,
                    'image_id' => $request->id,
                    'like' => $request->isLike,
                ]);
            } else {

                if (isset($request->isLike) && $like->like != $request->isLike) {
                    $like->delete();

                    ImageLikes::create([
                        'user_id' => Auth::user()->id,
                        'image_id' => $request->id,
                        'like' => $request->isLike,
                    ]);
                } else {

                    $like->delete();
                }
            }


        }
    }

}
