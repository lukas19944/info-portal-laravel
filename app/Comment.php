<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable=['contents','blog_id','user_id'];
    public function user(){
        return $this->belongsTo('App\User','user_id');
    }
    public function blog(){
        return $this->belongsTo('App\Blog');
    }
}
