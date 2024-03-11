import 'package:pocketbase/pocketbase.dart';

class QnaReposotory {
  final pb = PocketBase('http://43.202.59.218:8090');
  QnaReposotory();

  Future<void> createAnswer({
    required String answer,
    required String qnaId,
    required String respondentId,
  }) async {
    try {
      final data = {
        "content": answer,
        "qna": qnaId,
        "user": respondentId,
      };

      final newAnswer = await pb.collection('qna_answer').create(body: data);

      await updateQuestion(qnaId, userId: respondentId, answerId: newAnswer.id);
    } catch (_) {
      rethrow;
    }
  }

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
            expand: 'tag, user, answer',
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

  Future<ResultList<RecordModel>> getAnswerList({
    required String questionId,
    int? page,
  }) async {
    try {
      final resultList = await pb.collection('qna_answer').getList(
            page: page ?? 1,
            perPage: 5,
            filter: 'qna="$questionId"',
            expand: 'author',
          );
      return resultList;
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

  ///create qna
  Future<void> createQuestion({
    required String title,
    required String content,
    required List<String> tag,
    required String userId,
  }) async {
    try {
      final body = <String, dynamic>{
        "title": title,
        "user": userId,
        "tag": tag,
        "content": content
      };
      await pb.collection('qna').create(
            body: body,
          );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateQuestion(
    String questionId, {
    required String userId,
    String? title,
    String? content,
    List<String>? tag,
    String? answerId,
  }) async {
    try {
      var curData = await getOneQna(qnaId: questionId);

      final body = <String, dynamic>{
        "user": userId,
        if (title != null) "title": title,
        if (tag != null) "tag": tag,
        if (content != null) "content": content,
        if (answerId != null)
          "answer": [
            answerId,
            ...curData.data['answer'],
          ],
      };

      await pb.collection('qna').update(questionId, body: body);
    } catch (_) {
      rethrow;
    }
  }
}
