import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogWriteState extends Equatable {
  final SFACLogModel? logModel;
  final List<String> categoryList;

  LogWriteState({this.logModel, List<String>? categoryList})
      : categoryList = categoryList ?? ['선택 안함'];

  LogWriteState copyWith({SFACLogModel? logModel, List<String>? categoryList}) {
    return LogWriteState(
      logModel: logModel ?? this.logModel,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [logModel, categoryList];
}
