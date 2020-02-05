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
    public function addComment(Request $request){
        $request->validate([
            'contents'=>'required|string',
            'id'=>'integer'
        ]);
        $blog=Blog::where('id',$request->id)->first();

        if ($blog==null) {
            abort(404, 'Invalid request data');

        }
        $comment=Comment::create([
            'contents'=>$request->contents,
            'blog_id'=>$blog->id,
            'user_id'=>Auth::user()->id
        ]);


        return redirect()->back()->with('status','Comment added');

    }
    public function destroy(Comment $comment){
        if (Gate::allows('owner-or-admin',$comment->user_id)) {
            $comment->delete();
            return redirect()->back()->with('status','Comment delete');
        }
    }
}

