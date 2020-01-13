<?php

namespace App\Http\Controllers\Articles;

use App\Gallery;
use App\Http\Controllers\Controller;
use App\Article;
use App\Tag;
use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Gate;



class ArticlesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth',['only'=>['create','edit','update','store','destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        if (Auth::check()){
            $articles=Article::where('is_activ',1)->get();
            return view('articles.index')->with('articles',$articles);
        }else{
            $articles=Article::where('is_activ',1)
                ->where('is_auth', 0)->get();
            return view('articles.index')->with('articles',$articles);
        }

    }

    /**
     * Show the form for creating a new resource.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function create(){

            return view('articles.create');

        }


    public function store(Request $request){


            $request->validate([
                'title'=>'required|max:60',
                'article_content'=>'required',
                'tags'=>'max:20'
            ]);

            $article = new Article();
            $tag = new Tag();
            $article->title = $request->title;
            $article->content = $request->article_content;
            $article->short_description = strip_tags(Str::limit($request->article_content, 30));
            $article->user_id = Auth::id();
            $article->is_auth=isset($request->only_for_registered) ? 1 :0;
            $article->save();

            TagsController::addTag($request->tags,$article);

            return redirect(route('articles.index'));

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function show(Article $article)
    {
        $data=['article'=>$article];

        if ($article->galleries->first()!==null) {
            $gallery = $article->galleries()->first();
            $images = $gallery->images->take(4);
            $data=[
                'article'=>$article,
                'gallery'=>$gallery,
                'images'=>$images
            ];
        }

        return view('articles.show',$data);
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Article $article)
    {

        if(Gate::allows('owner-or-admin',$article->users()->pluck('id')->first())){

            $request->validate([
                'title'=>'required|max:60',
                'article_content'=>'required',
                'tags'=>''
            ]);
        $article->title = $request->title;
        $article->content = $request->article_content;
        $article->short_description = strip_tags(Str::limit($request->article_content, 30));
        $article->is_auth=isset($request->only_for_registered) ? 1 : 0;
        $article->user_id = Auth::id();
        $article->save();

        TagsController::addTag($request->tags,$article);

        if (isset($request->selected_gallery)){

            ArticlesController::addGallery($article,$request->selected_gallery);
        }
        return redirect(route('articles.index'));
    }
    return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Article  $article
     * @return \Illuminate\Http\Response
     */
    public function destroy(Article $article)
    {
        if(Gate::allows('owner-or-admin',$article->users()->pluck('id')->first())){


            $article->is_activ = 0;
            $article->save();
            return redirect(route('articles.index'));
        }
        return redirect()->back();
    }
    public static function addGallery(Article $article,int $gallery_id){
        if ($article->galleries()->first()!==null){
            $article->galleries()->detach();
        }
        $article->galleries()->attach($gallery_id);
    }
}
