<?php

namespace App\Http\Controllers\Articles;

use App\Article;
use App\Http\Controllers\Controller;
use App\Tag;
use Illuminate\Http\Request;

class TagsController extends Controller
{
    public function showByTag($tagname){

        $tag=Tag::where('name',$tagname)->first();
        $articles=$tag->articles()->get();
        $galleries=$tag->galleries()->get();
        $images=$tag->images()->get();
        $blog=$tag->blogs()->get();

        $data=[
            'tags'=>$tag,
            'articles'=>$articles,
            'galleries'=>$galleries,
            'images'=>$images,
            'blogs'=>$blog
        ];

        return view('tag.showByTag', $data);
    }
    public static function addTag($tags_string, object $object)
    {

        if ($tags_string === null) {

            $object->tags()->detach();

        }else{

            $object->tags()->detach();

            $tags = explode(',', $tags_string);

//            add tags to gallery

            foreach ($tags as $single_tag) {
                $tag = new Tag();
                $check_tag = Tag::where('name', $single_tag)->first();

                if ($check_tag === null) {

                    $tag->name = $single_tag;
                    $tag->save();

                    $object->tags()->attach($tag);

                } else {
                    $object->tags()->attach($check_tag);

                }
            }
        }
    }
}
