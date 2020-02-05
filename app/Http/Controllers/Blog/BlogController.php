<?php

namespace App\Http\Controllers\Blog;

use App\Blog;
use App\Gallery;
use App\BlogLikes;
use App\Http\Controllers\Articles\TagsController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Gate;

class BlogController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth',['only'=>['create','store','edit','update','destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $blogs=Blog::orderBy('created_at','desc')->paginate(9);
        return view('blog.index')->with('blogs',$blogs);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('blog.create');
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
           'title'=>'required|max:60',
           'blog_content'=>'required',
           'tags'=>'string'

        ]);
        $request->request->add(['short_content'=>strip_tags(Str::limit($request->blog_content, 30)),'user_id'=>Auth::user()->getAuthIdentifier()]);

        $blog=Blog::create($request->only('title','blog_content','short_content','user_id'));
        $slug=$blog->id.'-'.Str::slug($blog->title,'-');
        $blog->slug=$slug;
        $blog->save();
        TagsController::addTag($request->tags,$blog);

        return redirect(route('blog.index'));

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Blog $blog)
    {

        $data=['blog'=>$blog];


        if ($blog->galleries->first()!==null) {
            $gallery=$blog->galleries()->first();
            $images = $gallery->images->take(4);
            $data=Arr::add($data,'gallery',$gallery);
            $data=Arr::add($data,'images',$images);

        }
        $like=Auth::user()?Auth::user()->bloglikes()->where('blog_id',$blog->id)->first() ? Auth::user()->bloglikes()->where('blog_id',$blog->id)->first()->like  :null:null;
        $data=Arr::add($data,'like',$like);
//        if ($blog->comments()->get()->isNotEmpty()){
            $data=Arr::add($data,'comments',$blog->comments()->get());

//        }


        return view('blog.show',$data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Blog $blog)
    {
        if (Gate::allows('owner-or-admin',$blog->user_id)) {

            $data = ['blog' => $blog];


            if (Gallery::where('user_id', $blog->users->id)->get() !== null) {
                $galleries = Gallery::where('user_id', $blog->users->id)->get();
                $data = ['blog' => $blog, 'galleries' => $galleries];
            }

            return view('blog.edit', $data);
        }
        return redirect()->back();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Blog $blog)
    {

        if (Gate::allows('owner-or-admin',$blog->user_id)){

            $request->validate([
                'title'=>'required|max:60',
                'blog_content'=>'required',
                'tags'=>'string'

            ]);
            $short_content=strip_tags(Str::limit($request->blog_content, 30));
//            TODO: propably you must change to update
            $blog->update(['title'=>$request->title, 'blog_content'=>$request->blog_content,'short_content'=>$short_content]);
            TagsController::addTag($request->tags,$blog);
            BlogController::addGallery($blog,$request->selected_gallery);

            return redirect(route('blog.show',$blog));
        }
        return redirect()->back();


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Blog $blog)
    {

//        TODO: nie usuwa
        if (Gate::allows('owner-or-admin',$blog->user_id)){
            $blog->tags()->detach();
            $blog->galleries()->detach();
            $blog->delete();
            return redirect(route('blog.index'));
        }
        return redirect()->back();

    }
    public static function addGallery(Blog $blog, $gallery_id){
        if ($blog->galleries()->first()!==null){
            $blog->galleries()->detach();
        }
        $blog->galleries()->attach($gallery_id);
    }

    public function addLike(Request $request)
    {

        if (Auth::user()) {
            $like = BlogLikes::where([
                ['blog_id', '=', $request->id],
                ['user_id', '=', Auth::user()->id],
            ])->first();

            if ($like === null) {
                BlogLikes::create([
                    'user_id' => Auth::user()->id,
                    'blog_id' => $request->id,
                    'like' => $request->isLike,
                ]);
            } else {

                if (isset($request->isLike) && $like->like != $request->isLike) {
                    $like->delete();

                    BlogLikes::create([
                        'user_id' => Auth::user()->id,
                        'blog_id' => $request->id,
                        'like' => $request->isLike,
                    ]);
                } else {

                    $like->delete();
                }
            }


        }
    }
}
