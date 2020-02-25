<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BlogLikes extends Model
{
    protected $fillable=['user_id', 'blog_id','like'];

    public function user(){
        return $this->belongsTo('App\User');

    }
    public function blog(){
        return $this->belongsTo('App\Blog');

    }
}
