import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_reply_model.freezed.dart';
part 'answer_reply_model.g.dart';

@freezed
class AnswerReplyModel with _$AnswerReplyModel {
  factory AnswerReplyModel({
    String? id,
    required String content,
    required String answerId,
    required int like,
    required String author,
    required String created,
    required String updated,
  }) = _AnswerReplyModel;

  factory AnswerReplyModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerReplyModelFromJson(json);
}
