<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class Article extends Model
{
    public function getRouteKeyName()
    {
        return 'title';
    }
    public function users(){
        return $this->belongsTo('App\User', 'user_id');
    }

    public function tags(){
        return $this->belongsToMany('App\Tag', 'tag_article');
    }
    public function hasTag($name){
        if ($this->tags()->where('name',$name)->first()){
            return true;
        }

    }
    public function galleries(){
        return $this->belongsToMany('App\Gallery', 'article_gallery');
    }


    public function groups(){
        return $this->belongsToMany('App\Group', 'group_article');
    }


}
