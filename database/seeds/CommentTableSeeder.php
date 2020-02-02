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

        for ($i=0;$i<23;$i++) {

            $comment1 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 1,

            ]);
            $comment2 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 2,

            ]);
            $comment3 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 3,

            ]);
            $comment4 = Comment::create([
                'contents' => 'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.',
                'blog_id' => $i,
                'user_id' => 4,

            ]);
        }
    }
}
