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
            expand: 'tag, answer',
          );
      return record;
    } catch (_) {
      rethrow;
    }
  }
}
