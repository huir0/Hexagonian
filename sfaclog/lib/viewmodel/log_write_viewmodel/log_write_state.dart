import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/log_category_model.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogWriteState extends Equatable {
  final SFACLogModel? logModel;
  final List<LogCategoryModel> categoryList;

  LogWriteState({this.logModel, List<LogCategoryModel>? categoryList})
      : categoryList = categoryList ??
            [
              LogCategoryModel(
                  name: '선택안함', log: '', user: '', public: 'public')
            ];

  LogWriteState copyWith(
      {SFACLogModel? logModel, List<LogCategoryModel>? categoryList}) {
    return LogWriteState(
      logModel: logModel ?? this.logModel,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [logModel, categoryList];
}
