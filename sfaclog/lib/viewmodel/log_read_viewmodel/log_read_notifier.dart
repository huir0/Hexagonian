import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_read_viewmodel/log_read_state.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_state.dart';

class LogReadNotifier extends StateNotifier<LogReadState> {
  LogReadNotifier(this.ref) : super(const LogReadState());
  final Ref ref;
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  SFACLogModel? findLog(String tagId) {
    var logState = ref.watch(logProvider);
    SFACLogModel data =
        logState.logModelList!.firstWhere((log) => log.id == tagId);
    return data;
  }

  void setLogModel(SFACLogModel sfacLogModel) {
    state = state.copyWith(sfacLogModel: sfacLogModel);
  }

  Future<void> updateReplyCount(String logId, int newReplyCnt) async {
    var updatedModel = state.sfacLogModel!.copyWith(replyCnt: newReplyCnt);
    setLogModel(updatedModel);
  }

  Future<void> updateViewCount(int view, String tagId) async {
    try {
      int currentViewCount = view;

      await _remoteDataSource.updateTableData(
        'log',
        tagId,
        {'view': currentViewCount + 1},
      );
    } catch (e) {
      print("Failed to update view count: $e");
    }
  }
}

final logReadProvider =
    StateNotifierProvider<LogReadNotifier, LogReadState>((ref) {
  return LogReadNotifier(ref);
});
