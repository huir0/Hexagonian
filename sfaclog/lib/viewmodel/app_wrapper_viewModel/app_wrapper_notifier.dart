import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_state.dart';

class AppWrapperNotifier extends StateNotifier<AppWrapperState> {
  AppWrapperNotifier() : super(const AppWrapperState());

  void pageChanged(int page) {
    state = state.copyWith(page: page);
  }

  void isFabVisible(int page) {
    List<int> fabVisiblePage = [0, 1, 2];
    if (fabVisiblePage.contains(page)) {
      state = state.copyWith(fabVisible: true);
    } else {
      state = state.copyWith(fabVisible: false);
    }
  }

  void handleFabTap(BuildContext context, int currentPage) {
    switch (currentPage) {
      case 0: // '홈'
      case 2: // '로그'
        context.push('/log/write');
        break;
      case 1: // '커뮤니티'
        print('커뮤니티 쓰기 페이지 이동');
        break;
      // 기타 케이스
    }
  }
}

final appwrapperProvider =
    StateNotifierProvider<AppWrapperNotifier, AppWrapperState>((ref) {
  return AppWrapperNotifier();
});
