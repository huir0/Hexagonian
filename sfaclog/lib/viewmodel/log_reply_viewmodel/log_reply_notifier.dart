import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/viewmodel/log_reply_viewmodel/log_reply_state.dart';
import 'package:sfaclog/viewmodel/log_search_viewmodel/log_search_state.dart';

class LogReplyNotifier extends StateNotifier<LogReplyState> {
  LogReplyNotifier() : super(const LogReplyState());
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<void> getReply(String tagId) async {
    List<LogReplyModel> replyList = [];
    var data = await _remoteDataSource.getTableData(
        tableName: 'log_reply',
        filter: 'log="$tagId"&&parentReplyId=""'); // 상위 댓글만 불러옵니다.
    for (var item in data) {
      // 댓글 객체 생성
      LogReplyModel reply = LogReplyModel.fromJson(item.toJson());

      // 대댓글 불러오기
      var nestedData = await _remoteDataSource.getTableData(
          tableName: 'log_reply',
          filter: 'parentReplyId="${reply.id}"'); // 대댓글을 불러옵니다.
      List<LogReplyModel> nestedReplies = nestedData
          .map((nestedItem) => LogReplyModel.fromJson(nestedItem.toJson()))
          .toList();

      reply = reply.copyWith(nestedReplies: nestedReplies);
      replyList.add(reply);
    }
    state = state.copyWith(replyList: replyList);
  }

  Future<void> getNestedReply(String parentReplyId) async {
    List<LogReplyModel> replyList = [];
    var data = await _remoteDataSource.getTableData(
        tableName: 'log_reply', filter: 'parentReplyId="$parentReplyId"');
    for (var item in data) {
      LogReplyModel temp = LogReplyModel.fromJson(item.toJson());
      replyList.add(temp);
    }
    state = state.copyWith(replyList: replyList);
  }

  void setParentReplyId(String parentReplyId) {
    final currentState = state;
    final newState = currentState.copyWith(
      parentReplyId: parentReplyId,
    );
    state = newState;
  }

  void addReply(LogReplyModel reply) {
    final newList = List<LogReplyModel>.from(state.replyList!)..add(reply);
    state = state.copyWith(replyList: newList);
  }

  void setReply(List<LogReplyModel> replyList) {
    state = state.copyWith(replyList: replyList);
  }

  void setNestedReply(List<LogReplyModel> nestedReplyList) {
    state = state.copyWith(nestedReplyList: nestedReplyList);
  }
}

final logReplyProvider =
    StateNotifierProvider<LogReplyNotifier, LogReplyState>((ref) {
  return LogReplyNotifier();
});
