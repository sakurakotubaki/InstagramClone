import 'package:flutter/material.dart';
import 'package:instagram_clone/util/bubble_stories.dart';
import 'package:instagram_clone/util/user_posts.dart';

class UserHome extends StatelessWidget {
  UserHome({Key? key}) : super(key: key);

  final List people = ['JboyHashimoto', '鈴木二郎さん', 'Kboy', 'Konbu師匠', 'yuiyui'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 背景色を透過
        elevation: 0, // 影をなくす
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 両端に配置
          children: [
            Text('Instagram', style: TextStyle(color: Colors.black)),
            Row(children: [
              Icon(Icons.add),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.favorite),
              ),
              Icon(Icons.share),
            ])
          ],
        ),
      ),
      body: Column(
        children: [
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
          // 投稿
          UserPosts(name: 'JboyHashimoto'),
        ],
      ),
    );
  }
}
