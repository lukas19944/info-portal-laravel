<?php

use App\Tag;
use Illuminate\Database\Seeder;

class TagTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Tag::truncate();
        Tag::create(['name'=>'zdrowie']);
        Tag::create(['name'=>'sport']);
        Tag::create(['name'=>'odżywianie']);
        Tag::create(['name'=>'nowości']);
        Tag::create(['name'=>'wakacje']);


    }
}
