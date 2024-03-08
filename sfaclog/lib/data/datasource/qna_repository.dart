import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;

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
            // files: [
            //   http.MultipartFile.fromString(
            //     'content',
            //     content,
            //   ),
            // ],
          );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateQuestion({
    required String questionId,
    required String title,
    required String content,
    required List<String> tag,
  }) async {
    try {
      final body = <String, dynamic>{
        "title": title,
        "user": pb.authStore.model.id,
        "tag": tag,
        "content": content,
      };

      await pb.collection('qna').update(questionId, body: body);
    } catch (_) {
      rethrow;
    }
  }
}
