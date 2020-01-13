<?php

use App\Gallery;
use App\Image;
use App\Tag;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ImagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Image::truncate();
        DB::table('images_tag')->truncate();

        $sportGallery=Gallery::where('name','Sport')->first();
        $zdrowieGallery=Gallery::where('name','Zdrowie')->first();
        $wakacjeGallery=Gallery::where('name','Wakacje')->first();

        $sportTag=Tag::where('name','sport')->first();
        $zdrowieTag=Tag::where('name','zdrowie')->first();
        $wakacjeTag=Tag::where('name','wakacje')->first();

        $sportImage=Image::create([
            'title'=>'football.jpg',
            'alt'=>'There are many variations of passages of Lorem Ipsum available,',
            'gallery_id'=>$sportGallery->id,
        ]);
        $zdrowieImage=Image::create([
            'title'=>'diet.jpg',
            'alt'=>'There are many variations of passages of Lorem Ipsum available,',
            'gallery_id'=>$zdrowieGallery->id,
        ]);
        $wakacjeImage=Image::create([
            'title'=>'holiday.jpg',
            'alt'=>'There are many variations of passages of Lorem Ipsum available,',
            'gallery_id'=>$wakacjeGallery->id,
        ]);

        $sportImage->tags()->attach($sportTag);
        $zdrowieImage->tags()->attach($zdrowieTag);
        $wakacjeImage->tags()->attach($wakacjeTag);
    }
}
