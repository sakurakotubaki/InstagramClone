import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/common/page_type.dart';
import 'package:instagram_clone/repository/navigation.dart';
import 'package:instagram_clone/screen/home_page.dart';
import 'package:instagram_clone/screen/settings_page.dart';

/// [Notifierの場合]
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SNS UI',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomNavigationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage == PageType.Home ? "Home" : "Settings"),
      ),
      body:
          currentPage == PageType.Home ? const HomePage() : const SettingPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage == PageType.Home ? 0 : 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          final pageType = index == 0 ? PageType.Home : PageType.Settings;
          ref
              .read(bottomNavigationNotifierProvider.notifier)
              .changePage(pageType);
        },
      ),
    );
  }
}
