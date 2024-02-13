// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/log_reply_model.dart';

class LogReplyState extends Equatable {
  final List<LogReplyModel>? replyList;
  final List<LogReplyModel>? nestedReplyList;
  final String parentReplyId;
  final bool isLoading;

  const LogReplyState(
      {this.replyList,
      this.nestedReplyList,
      this.parentReplyId = '',
      this.isLoading = false});

  LogReplyState copyWith({
    List<LogReplyModel>? replyList,
    List<LogReplyModel>? nestedReplyList,
    String? parentReplyId,
    bool? isLoading,
  }) {
    return LogReplyState(
        replyList: replyList ?? this.replyList,
        nestedReplyList: nestedReplyList ?? this.nestedReplyList,
        parentReplyId: parentReplyId ?? this.parentReplyId,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [
        replyList,
        nestedReplyList,
        parentReplyId,
        isLoading
      ]; // Nullable 리스트를 올바르게 처리
}
