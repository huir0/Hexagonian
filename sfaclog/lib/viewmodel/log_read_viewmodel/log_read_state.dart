// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogReadState extends Equatable {
  final int replyCnt;
  final SFACLogModel? sfacLogModel;
  const LogReadState({
    this.replyCnt = 0,
    this.sfacLogModel,
  });

  LogReadState copyWith({int? replyCnt, SFACLogModel? sfacLogModel}) {
    return LogReadState(
        replyCnt: replyCnt ?? this.replyCnt,
        sfacLogModel: sfacLogModel ?? this.sfacLogModel);
  }

  @override
  List<Object?> get props => [replyCnt, sfacLogModel];
}
