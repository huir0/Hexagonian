import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/answer_reply_model.dart';

enum ReplyStatus {
  init,
  error,
  success,
}

class ReplyState extends Equatable {
  final ReplyStatus replyStatus;
  final List<AnswerReplyModel>? replyList;

  const ReplyState({
    required this.replyStatus,
    this.replyList,
  });

  factory ReplyState.init({
    List<AnswerReplyModel>? replyList,
  }) {
    return const ReplyState(
      replyStatus: ReplyStatus.init,
      replyList: [],
    );
  }

  @override
  List<Object?> get props => [replyStatus, replyList];

  ReplyState copyWith({
    ReplyStatus? replyStatus,
    String? reply,
    List<AnswerReplyModel>? replyList,
  }) {
    return ReplyState(
      replyStatus: replyStatus ?? this.replyStatus,
      replyList: replyList ?? this.replyList,
    );
  }
}
