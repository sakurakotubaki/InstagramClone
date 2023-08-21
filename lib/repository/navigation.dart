import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/common/page_type.dart';

class BottomNavigationNotifier extends Notifier<PageType> {
  @override
   build() {
    return PageType.Home;// 最初に表示するページを設定
  }
  // タブが切り替わった時に呼ばれる
  void changePage(PageType pageType) {
    state = pageType;
  }
}

final bottomNavigationNotifierProvider = NotifierProvider<BottomNavigationNotifier, PageType>(BottomNavigationNotifier.new);