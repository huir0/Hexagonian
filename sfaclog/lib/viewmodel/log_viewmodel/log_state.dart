import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogState extends Equatable {
  final List<SFACLogModel>? popularLogModel;
  final List<SFACLogModel>? logModelList;
  final String orderBy;
  final dynamic userInfo;
  final String avatarUrl;
  const LogState(
      {this.popularLogModel,
      this.logModelList,
      this.orderBy = '-created',
      this.userInfo,
      this.avatarUrl = ''});

  LogState copyWith(
      {List<SFACLogModel>? popularLogModel,
      List<SFACLogModel>? logModelList,
      String? orderBy,
      dynamic userInfo,
      String? avatarUrl}) {
    return LogState(
        popularLogModel: popularLogModel ?? this.popularLogModel,
        logModelList: logModelList ?? this.logModelList,
        orderBy: orderBy ?? this.orderBy,
        userInfo: userInfo ?? this.userInfo,
        avatarUrl: avatarUrl ?? this.avatarUrl);
  }

  @override
  List<Object> get props =>
      [popularLogModel!, logModelList!, orderBy, userInfo, avatarUrl];
}
