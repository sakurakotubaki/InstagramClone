// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram_clone/util/bubble_stories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List people = [
      'JboyHashimoto',
      '鈴木二郎さん',
      'Kboy',
      'Konbu師匠',
      'yuiyui'
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Instagram Clone', style: TextStyle(fontSize: 20)),
              Spacer(),
              Icon(Icons.add),
              SizedBox(width: 10),
              Icon(Icons.favorite),
              SizedBox(width: 10),
              Icon(Icons.share),
            ],
          ),
        ),
        // ストーリー
        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // 横スクロール
            itemCount: people.length,
            itemBuilder: (context, index) {
              return BubbleStories(text: people[index]);
            },
          ),
        ),
        // imagesフォルダの画像を１枚だけ表示する
        Container(
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('images/sample.jpg', fit: BoxFit.cover),
              ),
              Container(
                width: 300,
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 10),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 10),
                    Icon(Icons.send),
                    SizedBox(width: 10),
                    Icon(Icons.bookmark_border),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
