import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_state.dart';

class LogWriteNotifier extends StateNotifier<LogWriteState> {
  LogWriteNotifier() : super(const LogWriteState());

  void setLog(SFACLogModel logModel) {
    state = state.copyWith(logModel: logModel);
  }
}

final logwriteProvider =
    StateNotifierProvider<LogWriteNotifier, LogWriteState>((ref) {
  return LogWriteNotifier();
});
