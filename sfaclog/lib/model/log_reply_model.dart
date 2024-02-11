import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_reply_model.freezed.dart';
part 'log_reply_model.g.dart';

@freezed
class LogReplyModel with _$LogReplyModel {
  factory LogReplyModel({
    String? id,
    required String content,
    required String log,
    required String parentReplyId,
    required int like,
    required String user,
    List<LogReplyModel>? nestedReplies,
    String? created,
  }) = _LogReplyModel;

  factory LogReplyModel.fromJson(Map<String, dynamic> json) =>
      _$LogReplyModelFromJson(json);
}
