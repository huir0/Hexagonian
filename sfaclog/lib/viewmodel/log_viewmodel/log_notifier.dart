import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_state.dart';

class LogNotifier extends StateNotifier<LogState> {
  LogNotifier() : super(const LogState());
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<dynamic>> getPopularLog() async {
    List<dynamic> logList = await getLogDataOrderBy('-view');
    List<dynamic> tempPopularLogList = [];
    for (var log in logList) {
      if (tempPopularLogList.length >= 3) {
        break;
      }
      var logData = SFACLogModel.fromJson(jsonDecode(log.toString()));
      tempPopularLogList.add(logData);
    }
    return tempPopularLogList;
  }

  Future<List<dynamic>> getLogDataOrderBy(String orderBy) async {
    List<dynamic> logList = await _remoteDataSource.getTableData(
        tableName: 'log', orderBy: orderBy);

    return logList;
  }

  void setPopularLog(List<dynamic>? logModel) {
    state = state.copyWith(popularLogModel: logModel);
  }

  void setLog(List<dynamic>? logModel) {
    state = state.copyWith(logModelList: logModel);
  }
}

final logProvider = StateNotifierProvider<LogNotifier, LogState>((ref) {
  return LogNotifier();
});
