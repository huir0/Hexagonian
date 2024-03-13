import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/qna_repository.dart';
import 'package:sfaclog/model/answer_reply_model.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/reply_state.dart';

class ReplyProvider extends StateNotifier<ReplyState> {
  ReplyProvider()
      : _qnaRepository = QnaReposotory(),
        super(ReplyState.init());
  final QnaReposotory _qnaRepository;

  Future<void> createReply(
    String reply, {
    required String userId,
    required String answerId,
  }) async {
    try {
      final newReply = await _qnaRepository.createReply(
        reply: reply,
        authorId: userId,
        answerId: answerId,
      );

      print('댓글아이디: ${newReply.id}');

      await _qnaRepository.updateAnswer(
        answerId,
        userId: userId,
        replyId: newReply.id,
      );

      state = state.copyWith(replyStatus: ReplyStatus.success);
    } catch (e) {
      state = state.copyWith(replyStatus: ReplyStatus.error);
      rethrow;
    }
  }

  Future<List<AnswerReplyModel>> getAnswersReplyList(answerId) async {
    try {
      final data = await _qnaRepository.getAnswersReplyList(answerId: answerId);
      List<AnswerReplyModel> resultList = data.items.map((res) {
        return AnswerReplyModel.fromJson(res.toJson());
      }).toList();
      return resultList;
    } catch (e) {
      state = state.copyWith(replyStatus: ReplyStatus.error);
      rethrow;
    }
  }
}

final replyProvider = StateNotifierProvider<ReplyProvider, ReplyState>((ref) {
  final replyProvider = ReplyProvider();
  return replyProvider;
});
