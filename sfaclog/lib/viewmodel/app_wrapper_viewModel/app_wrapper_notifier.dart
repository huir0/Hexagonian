import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_state.dart';

class AppWrapperNotifier extends StateNotifier<AppWrapperState> {
  AppWrapperNotifier() : super(const AppWrapperState());

  void pageChanged(int page) {
    state = state.copyWith(page: page);
  }
}

final appwrapperProvider =
    StateNotifierProvider<AppWrapperNotifier, AppWrapperState>((ref) {
  return AppWrapperNotifier();
});
