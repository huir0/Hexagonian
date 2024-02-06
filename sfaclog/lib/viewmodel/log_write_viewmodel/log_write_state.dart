import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_log_model.dart';

class LogWriteState extends Equatable {
  final SFACLogModel? logModel;
  const LogWriteState({this.logModel});

  LogWriteState copyWith({SFACLogModel? logModel}) {
    return LogWriteState(logModel: logModel ?? this.logModel);
  }

  @override
  List<Object> get props => [logModel!];
}
