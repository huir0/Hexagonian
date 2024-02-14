import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/liked_posts_model.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/my_qna_viewmodel/my_qna_state.dart';
import '../../data/datasource/remote_datasource.dart';
import '../../model/sfac_qna_model.dart';

class MyPageQnaNotifier extends StateNotifier<MyPageQnaState> {
  MyPageQnaNotifier() : super(MyPageQnaState(qnaList: [], qnaAnswerList: []));

  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<dynamic>> getUserQnas(String userId) async {
    try {
      List<dynamic> qnaList = await _remoteDataSource.getTableData(
          tableName: 'qna', filter: 'user.id = "$userId"');
      List<dynamic> userQnas = qnaList
          .map((qna) => SFACQnaModel.fromJson(jsonDecode(qna.toString())))
          .toList();
      return userQnas;
    } catch (e) {
      print('getUserQnas $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getUserQnaAnswers(String userId) async {
    try {
      List<dynamic> qnaList = await _remoteDataSource.getTableData(
          tableName: 'qna_answer', filter: 'user.id = "$userId"');

      List<Future<QnaAnswerModel>> userAnswersFutures =
          qnaList.map((qna) async {
        QnaAnswerModel answer =
            QnaAnswerModel.fromJson(jsonDecode(qna.toString()));
        RecordModel record =
            await _remoteDataSource.getOneRecord('qna', answer.qna);
        return answer.copyWith(qnaTitle: record.data['title']);
      }).toList();

      List<QnaAnswerModel> userAnswers = await Future.wait(userAnswersFutures);

      return userAnswers;
    } catch (e) {
      print('getUserQnaAnswers $e');
      rethrow;
    }
  }
}

final myPageQnaProvider =
    StateNotifierProvider<MyPageQnaNotifier, MyPageQnaState>((ref) {
  return MyPageQnaNotifier();
});
