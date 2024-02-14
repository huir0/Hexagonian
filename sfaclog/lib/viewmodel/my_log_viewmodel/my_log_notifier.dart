import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/liked_posts_model.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import '../../data/datasource/remote_datasource.dart';
import '../../model/log_category_model.dart';
import '../../model/sfac_qna_model.dart';
import 'my_log_state.dart';

class MyPageLogNotifier extends StateNotifier<MyPageLogState> {
  MyPageLogNotifier()
      : super(const MyPageLogState(
          userLogs: [],
          likedPosts: [],
          bookmarkedLogs: [],
          replies: 0,
          categoryList: [],
          category: '전체로그',
          categoryIndex: 0,
        ));
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<dynamic>> getUserLogs(
      {required String userId, String? expand, String? filter}) async {
    try {
      // 사용자의 로그를 가져오는 비동기 함수를 호출합니다.
      String finalFilter = 'user.id = "$userId"';
      if (filter != '') {
        finalFilter += "&&$filter";
      }
      List<dynamic> logList = await _remoteDataSource.getExpandedTableData(
        tableName: 'log',
        expand: expand,
        filter: finalFilter,
      );
      // 가져온 로그 데이터를 MyLogModel로 변환합니다.
      List<dynamic> userLogs = logList
          .map((log) => SFACLogModel.fromJson(jsonDecode(log.toString())))
          .toList();
      return userLogs;
    } catch (e) {
      // 오류 처리 로직을 추가합니다.
      rethrow;
    }
  }

  Future<List<dynamic>> getLikedPosts(String userId) async {
    try {
      // 사용자의 좋아요를 누른 게시물을 가져오는 비동기 함수를 호출합니다.
      RecordModel postList = await _remoteDataSource.getFilteredRecord(
          'liked_posts', 'user.id = "$userId"', '' // 특정 사용자의 게시물만 가져오도록 필터링합니다.
          );
      LikedPostModel postModel = LikedPostModel.fromJson(postList.data);

      List<Future<dynamic>> logFutures = postModel.logs?.map((logId) async {
            return await _remoteDataSource.getOneRecord('log', logId);
          }).toList() ??
          [];

      List<Future<dynamic>> qnaFutures = postModel.qnas?.map((qnaId) async {
            return await _remoteDataSource.getOneRecord('qna', qnaId);
          }).toList() ??
          [];

      List<dynamic> logDataList = await Future.wait(logFutures);
      List<dynamic> qnaDataList = await Future.wait(qnaFutures);
      List<dynamic> likedLogs = logDataList
          .map((data) => SFACLogModel.fromJson(jsonDecode(data.toString())))
          .toList();

      List<dynamic> likedQnas = qnaDataList
          .map((data) => SFACQnaModel.fromJson(jsonDecode(data.toString())))
          .toList();
      List<dynamic> likedPosts = [...likedLogs, ...likedQnas];
      return likedPosts;
    } catch (e) {
      // 오류 처리 로직을 추가합니다.
      print('getLikedPosts $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getBookmaredLogs(String userId) async {
    try {
      RecordModel loglist = await _remoteDataSource.getFilteredRecord(
          'bookmark', 'user.id = "$userId"', 'log,log.user');
      List<dynamic> bookmarkedLogs = loglist.expand['log']!
          .map((log) => SFACLogModel.fromJson(jsonDecode(log.toString())))
          .toList();
      return bookmarkedLogs;
    } catch (e) {
      print('getBookmaredLogs $e');
      rethrow;
    }
  }

  Future<int> getLogReplies(String logId) async {
    try {
      // 사용자의 로그를 가져오는 비동기 함수를 호출합니다.
      List<dynamic> replyIdList = await _remoteDataSource.getTableData(
        tableName: 'log_reply',
        filter: 'log.id = "$logId"', // 특정 사용자의 로그만 가져오도록 필터링합니다.
      );
      return replyIdList.length;
    } catch (e) {
      // 오류 처리 로직을 추가합니다.
      rethrow;
    }
  }

  // 사용자가 작성한 로그 설정
  void setUserLogs(List<dynamic> userLogs) {
    state = state.copyWith(userLogs: userLogs);
  }

  // 좋아요한 로그 설정
  void setlikedPosts(List<dynamic> likedPosts) {
    state = state.copyWith(likedPosts: likedPosts);
  }

  // 북마크한 로그 설정
  void setBookmarkedLogs(List<dynamic> bookmarkedLogs) {
    state = state.copyWith(bookmarkedLogs: bookmarkedLogs);
  }

  void setLogReplies(int replies) {
    state = state.copyWith(replies: replies);
  }

  void setCategoryList(List<LogCategoryModel> categoryList) {
    state = state.copyWith(categoryList: categoryList);
  }

  void setCategory(String category) {
    state = state.copyWith(category: category);
  }

  void setCategoryIndex(int index) {
    state = state.copyWith(categoryIndex: index);
  }
}

final myPageLogProvider =
    StateNotifierProvider<MyPageLogNotifier, MyPageLogState>((ref) {
  return MyPageLogNotifier();
});
