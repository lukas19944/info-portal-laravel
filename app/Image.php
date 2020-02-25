<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{

    public function gallery(){
        return $this->belongsTo('App\Gallery');
    }

    public function tags(){
        return $this->belongsToMany('App\Tag','images_tag');
    }
    public function imagelikes(){
        return $this->hasMany('App\ImageLikes');
    }
}
