import 'package:flutter/material.dart';
import 'package:instagram_clone/account.dart';
import 'package:instagram_clone/pages/home.dart';
import 'package:instagram_clone/pages/reels.dart';
import 'package:instagram_clone/pages/search.dart';
import 'package:instagram_clone/pages/shop.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // indexを指定
  int _selectedIndex = 0;
  // タップしたらindexを変更するメソッド
  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // タブごとにページを表示するリスト
  final List<Widget> _children = [
    // それぞれのページを表示
    UserHome(),
    UserSearch(),
    Userreels(),
    UserShop(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex], // タブごとにページを表示。[]の中はindexを指定
      // bodyの下に配置
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed, // これを指定しないと5つ以上のアイコンが表示されない
        onTap: _navigateBottomNavBar,// タップしたらindexを変更するメソッド
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'video'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'account'),
        ],
      ),
    );
  }
}
