import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/qna_repository.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/answer_state.dart';

class AnswerProvider extends StateNotifier<AnswerState> {
  AnswerProvider()
      : _qnaRepository = QnaReposotory(),
        super(AnswerState.init());

  final QnaReposotory _qnaRepository;

  Future<void> createAnswer({
    required String answer,
    required String qnaId,
    required String userId,
  }) async {
    try {
      await _qnaRepository.createAnswer(
        answer: answer,
        qnaId: qnaId,
        respondentId: userId,
      );

      state = state.copyWith(
        answer: answer,
        answerStatus: AnswerStatus.success,
      );
    } catch (e) {
      print('create answer error: $e');
      state = state.copyWith(
        answerStatus: AnswerStatus.error,
      );
    }
  }

  void setAnswer(
    String answer,
  ) {
    try {
      state = state.copyWith(
        answer: answer,
        answerStatus: AnswerStatus.pending,
      );
    } catch (e) {
      state = state.copyWith(
        answerStatus: AnswerStatus.error,
      );
    }
  }
}

final answerProvider =
    StateNotifierProvider<AnswerProvider, AnswerState>((ref) {
  final answerProvider = AnswerProvider();
  return answerProvider;
});
