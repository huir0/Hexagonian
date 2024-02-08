import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/viewmodel/log_search_viewmodel/log_search_state.dart';

class LogSearchNotifier extends StateNotifier<LogSearchState> {
  LogSearchNotifier() : super(const LogSearchState());

  Future<void> fetchData() async {
    try {
      RemoteDataSource remoteDataSource = RemoteDataSource();
      List<dynamic> data =
          await remoteDataSource.getTableData(tableName: 'skills');
      List<SkillModel> skillList =
          data.map((item) => SkillModel.fromJson(item.toJson())).toList();
      if (skillList.isNotEmpty) {
        // 데이터가 존재하는 경우
        state = state.copyWith(skillModel: skillList);
      } else {
        state = state.copyWith(skillModel: []);
      }
    } catch (e) {
      // 예외 처리
      state = state.copyWith(skillModel: []);
    }
  }
}

final logSearchProvider =
    StateNotifierProvider<LogSearchNotifier, LogSearchState>((ref) {
  return LogSearchNotifier();
});
