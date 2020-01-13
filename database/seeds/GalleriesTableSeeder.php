<?php

use App\Article;
use App\Gallery;
use App\Tag;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GalleriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Gallery::truncate();
        DB::table('gallery_tag')->truncate();
        DB::table('article_gallery')->truncate();

        $sportTag=Tag::where('name','sport')->first();
        $zdrowieTag=Tag::where('name','zdrowie')->first();
        $wakacjeTag=Tag::where('name','wakacje')->first();

        $sportArticle=Article::where('title','Sport to zdrowie')->first();
        $zdrowieArticle=Article::where('title','Nowości w zdrowym odżywianiu%')->first();
        $wakacjeArticle=Article::where('title','Cwiczenia codzienne')->first();

        $sportGallery=Gallery::create([
           'name'=>'Sport',
           'user_id'=>1,
        ]);
        $zdrowieGallery=Gallery::create([
           'name'=>'Zdrowie',
           'user_id'=>2,
        ]);
        $wakacjeGallery=Gallery::create([
           'name'=>'Wakacje',
            'user_id'=>3,
        ]);

        $sportGallery->tags()->attach($sportTag);
        $zdrowieGallery->tags()->attach($zdrowieTag);
        $wakacjeGallery->tags()->attach($wakacjeTag);

        $sportGallery->articles()->attach($sportArticle);
        $zdrowieGallery->articles()->attach($zdrowieGallery);
        $wakacjeGallery->articles()->attach($wakacjeGallery);
    }
}
