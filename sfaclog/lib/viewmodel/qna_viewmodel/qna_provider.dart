import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/qna_repository.dart';
import 'package:sfaclog/model/answer_reply_model.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/qna_state.dart';

class QnaProvider extends StateNotifier<QnaState> {
  QnaProvider()
      : _qnaRepository = QnaReposotory(),
        super(QnaState.init());

  final QnaReposotory _qnaRepository;

  Future<void> getAllQna() async {
    try {
      final data = await _qnaRepository.getAllQna(sort: '-created');

      List<SFACQnaModel> result = data.map(
        (el) {
          return SFACQnaModel.fromJson(el.toJson());
        },
      ).toList();

      state = state.copyWith(
        allQnaList: result,
        qnaStatus: QnaStatus.success,
      );
    } catch (e) {
      state = state.copyWith(qnaStatus: QnaStatus.error);
      rethrow;
    }
  }

  Future<QnaAnswerModel> getAnswerById(String answerId) async {
    try {
      final result = await _qnaRepository.getAnswerById(answerId: answerId);
      QnaAnswerModel answer = QnaAnswerModel.fromJson(result.toJson());
      return answer;
    } catch (e) {
      state = state.copyWith(qnaStatus: QnaStatus.error);
      rethrow;
    }
  }

  Future<List<QnaAnswerModel>> getAnswerList(questionId) async {
    try {
      final data = await _qnaRepository.getAnswerList(questionId: questionId);
      List<QnaAnswerModel> resultList = data.items.map((res) {
        return QnaAnswerModel.fromJson(res.toJson());
      }).toList();
      return resultList;
    } catch (e) {
      state = state.copyWith(qnaStatus: QnaStatus.error);
      rethrow;
    }
  }

  Future<SFACQnaModel> getOneQna(qnaId) async {
    try {
      final data = await _qnaRepository.getOneQna(qnaId: qnaId);
      SFACQnaModel question = SFACQnaModel.fromJson(data.toJson());
      print(question);
      return question;
    } catch (e) {
      state = state.copyWith(qnaStatus: QnaStatus.error);
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
      state = state.copyWith(qnaStatus: QnaStatus.error);
      rethrow;
    }
  }
}

final qnaProvider = StateNotifierProvider<QnaProvider, QnaState>((ref) {
  final qnaProvider = QnaProvider();
  return qnaProvider;
});
