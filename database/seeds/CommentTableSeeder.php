<?php

use App\Comment;
use Illuminate\Database\Seeder;

class CommentTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Comment::truncate();

        for ($i=1;$i<20;$i++) {

            $comment1 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 1,
                'confirmed'=>1,

            ]);
            $comment2 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 2,
                'confirmed'=>1,

            ]);
            $comment3 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 3,
                'confirmed'=>1,

            ]);
            $comment4 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 4,
                'confirmed'=>1,

            ]);
            $comment5=Comment::create([
                'contents'=>'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz',
                'blog_id'=>$i,
                'nick'=>'luki',
                'confirmed'=>0,
            ]);
        }
    }
}
