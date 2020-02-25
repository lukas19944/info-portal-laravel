<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    public function getRouteKeyName()
    {
        return 'slug';
    }
    public function articles(){
        return $this->belongsToMany('App\Article', 'article_gallery');
    }
    public function tags(){
        return $this->belongsToMany('App\Tag');
    }
    public function images(){
        return $this->hasMany('App\Image');
    }
    public function users(){
        return $this->belongsTo('App\User','user_id');
    }
}
