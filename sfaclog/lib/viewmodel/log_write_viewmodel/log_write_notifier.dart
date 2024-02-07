import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_state.dart';

class LogWriteNotifier extends StateNotifier<LogWriteState> {
  LogWriteNotifier() : super(LogWriteState());

  void setLog(SFACLogModel logModel) {
    state = state.copyWith(logModel: logModel);
  }

  void addCategory(String value) {
    final newList = List<String>.from(state.categoryList)..add(value);
    state = state.copyWith(categoryList: newList);
  }

  void setCategory(List<String> categoryList) {
    state = state.copyWith(categoryList: categoryList);
  }
}

final logwriteProvider =
    StateNotifierProvider<LogWriteNotifier, LogWriteState>((ref) {
  return LogWriteNotifier();
});
