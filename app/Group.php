<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    public function articles(){
        return $this->belongsToMany('App\Articles', 'group_article');
}
}
