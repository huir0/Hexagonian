import 'package:freezed_annotation/freezed_annotation.dart';

part 'qna_answer_model.freezed.dart';
part 'qna_answer_model.g.dart';

@freezed
class QnaAnswerModel with _$QnaAnswerModel {
  const factory QnaAnswerModel({
    required String id,
    required String title,
    required String user,
    required String content,
    required String collectionName,
    required String qna,
    required dynamic expand,
    required int like,
    required List<dynamic> reply,
    required String created,
    required String updated,
    String? qnaTitle,
  }) = _QnaAnswerModel;

  factory QnaAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$QnaAnswerModelFromJson(json);
}
