<?php

use App\Article;
use App\Tag;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ArticlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Article::truncate();
        DB::table('tag_article')->truncate();

        $zdrowieTag=Tag::where('name','zdrowie')->first();
        $sportTag=Tag::where('name','sport')->first();
        $odzywianieTag=Tag::where('name','odżywianie')->first();
        $nowosciTag=Tag::where('name','nowości')->first();



        $first=Article::create([
           'title'=>'Sport to zdrowie',
           'short_description'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz',
           'content'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker',
           'is_auth'=>0,
           'user_id'=>1,
        ]);
        $second=Article::create([
           'title'=>'Nowości w zdrowym odżywianiu',
           'short_description'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz',
           'content'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker',
           'is_auth'=>0,
           'user_id'=>2,
        ]);
        $third=Article::create([
           'title'=>'Cwiczenia codzienne',
           'short_description'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz',
           'content'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker',
           'is_auth'=>0,
           'user_id'=>3,
        ]);
        $first->tags()->attach([
            0=>$sportTag->id,
            1=>$zdrowieTag->id
        ]);

        $second->tags()->attach([
            0=>$zdrowieTag->id,
            1=>$odzywianieTag->id,
            2=>$nowosciTag->id
        ]);
        $third->tags()->attach($sportTag);

    }
}
