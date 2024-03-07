import 'package:pocketbase/pocketbase.dart';

class QnaReposotory {
  final pb = PocketBase('http://43.202.59.218:8090');
  QnaReposotory();

  Future<List<RecordModel>> getAllQna({
    String? sort,
  }) async {
    try {
      final resultList = await pb.collection('qna').getFullList(
            sort: sort,
            expand: 'tag, answer',
          );
      return resultList;
    } catch (_) {
      rethrow;
    }
  }

  Future<RecordModel> getOneQna({
    required String qnaId,
  }) async {
    try {
      final record = await pb.collection('qna').getOne(
            qnaId,
            expand: 'tag, user',
          );
      return record;
    } catch (_) {
      rethrow;
    }
  }

  Future<RecordModel> getAnswerById({
    required String answerId,
  }) async {
    try {
      final record = await pb.collection('qna_answer').getOne(
            answerId,
            expand: 'user',
          );
      return record;
    } catch (_) {
      rethrow;
    }
  }

  Future<ResultList<RecordModel>> getAnswersReplyList({
    int? page,
    String? sort,
    required String answerId,
  }) async {
    try {
      final resultList = await pb.collection('answer_reply').getList(
            page: page ?? 1,
            perPage: 5,
            filter: 'answerId="$answerId"',
            expand: 'author',
          );
      return resultList;
    } catch (_) {
      rethrow;
    }
  }
}
