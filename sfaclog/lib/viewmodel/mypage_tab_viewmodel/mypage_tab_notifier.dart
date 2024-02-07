import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'mypage_tab_state.dart';

class MyPageNotifier extends StateNotifier<MyPageState> {
  MyPageNotifier() : super(const MyPageState());

  void tabChanged(int tab) {
    state = state.copyWith(tab: tab);
  }
}

final myPageProvider =
    StateNotifierProvider<MyPageNotifier, MyPageState>((ref) {
  return MyPageNotifier();
});

class MyFollowPageNotifier extends StateNotifier<MyFollowPageState> {
  MyFollowPageNotifier() : super(const MyFollowPageState());

  void tabChanged(int tab) {
    state = state.copyWith(tab: tab);
  }
}

final myFollowPageProvider =
    StateNotifierProvider<MyFollowPageNotifier, MyFollowPageState>((ref) {
  return MyFollowPageNotifier();
});
