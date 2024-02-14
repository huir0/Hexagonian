import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_state.dart';

class LogNotifier extends StateNotifier<LogState> {
  LogNotifier() : super(const LogState());
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<SFACLogModel>> getPopularLog() async {
    try {
      List<SFACLogModel> logList = await getLogDataOrderBy('-like');
      return logList.take(3).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<SFACLogModel>> getLogDataOrderBy(String orderBy) async {
    try {
      List<dynamic> logList = await _remoteDataSource.getTableData(
          tableName: 'log', orderBy: orderBy);
      List<SFACLogModel> tempList = [];
      for (var log in logList) {
        log = SFACLogModel.fromJson(jsonDecode(log.toString()));
        final thumbnail = await getThumbNailUrl(log.id);
        final replyCnt = await getReplyCnt(log.id);
        SFACLogModel updatedLog =
            log.copyWith(thumbnail: thumbnail, replyCnt: replyCnt);
        tempList.add(updatedLog);
      }
      return tempList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<SFACLogModel>> getLogDataFilter(String filter) async {
    try {
      List<dynamic> logList = await _remoteDataSource.getTableData(
          tableName: 'log', filter: filter);
      List<SFACLogModel> tempList = [];
      for (var log in logList) {
        log = SFACLogModel.fromJson(jsonDecode(log.toString()));
        final thumbnail = await getThumbNailUrl(log.id);
        final replyCnt = await getReplyCnt(log.id);
        SFACLogModel updatedLog =
            log.copyWith(thumbnail: thumbnail, replyCnt: replyCnt);
        tempList.add(updatedLog);
      }
      return tempList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> getReplyCnt(String tagId) async {
    var data = await _remoteDataSource.getTableData(
        tableName: 'log_reply', filter: 'log="$tagId"');
    int replyCnt = data.length;

    return replyCnt;
  }

  Future<String> getThumbNailUrl(String tagId) async {
    String imageUrl = await _remoteDataSource.getThumbNailURL('log', tagId, 0);
    return imageUrl;
  }

  Future<String> getAvatarUrl(String tagId) async {
    String imageUrl =
        await _remoteDataSource.getAvatarURL('user', tagId, 'picture');
    return imageUrl;
  }

  Future<dynamic> getUserInfo(String tagId) async {
    RecordModel data = await _remoteDataSource.getDataOne(
        'log', tagId, 'user.skill,user.profile');
    var userData = jsonDecode(jsonEncode(data.expand["user"]));
    return userData[0];
  }

  // StateNotifier 내부
  void setOrderBy(String newOrderBy, Function callback) {
    // 상태 업데이트 로직
    state = state.copyWith(orderBy: newOrderBy);
    // 상태 업데이트 후 콜백 실행
    callback();
  }

  void setPopularLog(List<SFACLogModel> logModel) {
    state = state.copyWith(popularLogModel: logModel);
  }

  void setLog(List<SFACLogModel> logModel) {
    state = state.copyWith(logModelList: logModel);
  }

  void setAvatarUrl(String avatarUrl) {
    state = state.copyWith(avatarUrl: avatarUrl);
  }

  void setUserInfo(dynamic userInfo) {
    state = state.copyWith(userInfo: userInfo);
  }
}

final logProvider = StateNotifierProvider<LogNotifier, LogState>((ref) {
  return LogNotifier();
});
