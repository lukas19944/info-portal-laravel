<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;


class Blog extends Model
{
    public $table = "blog";
    protected $fillable=['title','blog_content','short_content','user_id'];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function users(){
        return $this->belongsTo('App\User','user_id');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag');
    }
    public function galleries(){
        return $this->belongsToMany('App\Gallery');
    }
    public function likes(){
        return $this->belongsTo('App\Like','like');
    }
}
