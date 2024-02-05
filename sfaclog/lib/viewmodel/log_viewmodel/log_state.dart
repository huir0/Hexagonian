import 'package:equatable/equatable.dart';

class LogState extends Equatable {
  final List<dynamic>? popularLogModel;
  final List<dynamic>? logModelList;

  const LogState({this.popularLogModel, this.logModelList});

  LogState copyWith(
      {List<dynamic>? popularLogModel, List<dynamic>? logModelList}) {
    return LogState(
        popularLogModel: popularLogModel ?? this.popularLogModel,
        logModelList: logModelList ?? this.logModelList);
  }

  @override
  List<Object> get props => [popularLogModel!, logModelList!];
}
