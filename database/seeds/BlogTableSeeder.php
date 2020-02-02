<?php

use App\Blog;
use App\Tag;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class BlogTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Blog::truncate();

        DB::table('blog_tag')->truncate();
        $tag=new Tag();

        $tag_programowanie=Tag::create([
            'name'=>'programowanie'
        ]);
        $tag_php=Tag::create([
            'name'=>'php'
        ]);
        $tag_sql=Tag::create([
            'name'=>'sql'
        ]);
        $tag_arr=[
            0=>$tag_programowanie->id,
            1=>$tag_php->id,
            2=>$tag_sql->id
        ];
        for ($i=0;$i<10;$i++) {
            $php = Blog::create([
                'title' => 'Nauka PHP',
                'blog_content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'short_content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                'user_id' => 1
            ]);
            $php->slug=$php->id.'-'.Str::slug($php->title,'-');
            $php->save();
            $sql = Blog::create([
                'title' => 'Nauka SQl',
                'blog_content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                'short_content' => 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                'user_id' => 2
            ]);
            $sql->slug=$sql->id.'-'.Str::slug($sql->title,'-');
            $sql->save();

            $php->tags()->attach($tag_arr);
            $sql->tags()->attach($tag_arr);
        }
        }

}
