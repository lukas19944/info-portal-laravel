<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    public function articles(){
        return $this->belongsToMany('App\Article', 'tag_article');
    }
    public function galleries(){
        return $this->belongsToMany('App\Gallery');
    }
    public function images(){
        return $this->belongsToMany('App\Image','images_tag');
    }
    public function blogs(){
        return $this->belongsToMany('App\Blog');
    }
}
