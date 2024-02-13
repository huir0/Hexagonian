import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogState extends Equatable {
  final List<SFACLogModel>? popularLogModel;
  final List<SFACLogModel>? logModelList;
  final String orderBy;
  const LogState(
      {this.popularLogModel, this.logModelList, this.orderBy = '-created'});

  LogState copyWith(
      {List<SFACLogModel>? popularLogModel,
      List<SFACLogModel>? logModelList,
      String? orderBy}) {
    return LogState(
        popularLogModel: popularLogModel ?? this.popularLogModel,
        logModelList: logModelList ?? this.logModelList,
        orderBy: orderBy ?? this.orderBy);
  }

  @override
  List<Object> get props => [popularLogModel!, logModelList!, orderBy];
}
