// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/log_reply_model.dart';

class LogReplyState extends Equatable {
  final List<LogReplyModel>? replyList;
  final List<LogReplyModel>? nestedReplyList;
  final String parentReplyId; // 이 필드의 초기화가 생성자에서 올바르게 이루어져야 합니다.

  const LogReplyState({
    this.replyList,
    this.nestedReplyList,
    this.parentReplyId = '', // 올바른 기본값 할당
  });

  LogReplyState copyWith({
    List<LogReplyModel>? replyList,
    List<LogReplyModel>? nestedReplyList,
    String? parentReplyId, // 올바른 파라미터 타입과 이름
  }) {
    return LogReplyState(
      replyList: replyList ?? this.replyList,
      nestedReplyList: nestedReplyList ?? this.nestedReplyList,
      parentReplyId: parentReplyId ?? this.parentReplyId, // 수정된 부분
    );
  }

  @override
  List<Object?> get props =>
      [replyList, nestedReplyList, parentReplyId]; // Nullable 리스트를 올바르게 처리
}
