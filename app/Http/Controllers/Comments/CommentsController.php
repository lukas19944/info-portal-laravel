<?php

namespace App\Http\Controllers\Comments;

use App\Blog;
use App\Comment;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Gate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;




class CommentsController extends Controller
{
    public function __construct()
    {
        $this->middleware('hasrole:admin,moderator',['only'=>['commentList','confirmComment']]);
    }

    public function commentList(Request $request){
        if (!$request->all()) {
            $comments = Comment::all();
        }else{

            $comments=Comment::where(key($request->all()),current($request->all()))->get();
        }


        return view('comments.manage-comments')->with('comments',$comments);
    }
    public function confirmComment(Comment $comment){

        $comment->update(['confirmed'=>1]);
        return redirect(route('comment.list'));
    }

    public function addComment(Request $request){

        $request->validate([
            'nick'=>'string|max:24',
            'contents'=>'required|string',
            'id'=>'integer'
        ]);
        $blog=Blog::where('id',$request->id)->first();

        if ($blog==null) {
            abort(404);

        }
        if (Auth::check()) {
            $request->validate([
                'contents'=>'required|string',
                'id'=>'integer'
            ]);
            $comment = Comment::create([
                'contents' => $request->contents,
                'blog_id' => $blog->id,
                'user_id' => Auth::user()->id,
                'confirmed'=>1,
            ]);
            return redirect()->back()->with('status','Comment added');

        }else {
            $request->validate([
                'nick'=>'string|required|max:24',
                'contents'=>'required|string',
                'id'=>'integer'
            ]);
            $comment = Comment::create([
                'contents' => $request->contents,
                'blog_id' => $blog->id,
                'nick' => $request->nick,
                'confirmed'=>0,
            ]);
            return redirect()->back()->with('status','Comment expect for confirm');
        }


    }
    public function destroy(Comment $comment,Request $request){
            $blog=Blog::where(['id',$request->blog]);
            if (!$blog){
                abort(404);
            }
            if (Gate::denies('delete-comments',[$blog->user_id,$comment->user_id])){
                abort(401,'Unauthorized');
            }
            $comment->delete();
            return redirect()->back()->with('status','Comment delete');

    }
}

