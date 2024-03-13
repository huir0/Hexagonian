import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/qna_repository.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/create_qna_state.dart';

class CreateQnaProvider extends StateNotifier<CreateQnaState> {
  CreateQnaProvider()
      : _qnaRepository = QnaReposotory(),
        super(CreateQnaState.init());

  final QnaReposotory _qnaRepository;

  Future<void> setQna({
    required String title,
    required String content,
    List<String>? tag,
    required String userId,
  }) async {
    try {
      await _qnaRepository.createQuestion(
        title: title,
        content: content,
        tag: tag ?? [],
        userId: userId,
      );
    } catch (e) {
      print('Qna setting error: $e');
    }
  }
}

final createQnaProvider =
    StateNotifierProvider<CreateQnaProvider, CreateQnaState>((ref) {
  final qnaProvider = CreateQnaProvider();
  return qnaProvider;
});
