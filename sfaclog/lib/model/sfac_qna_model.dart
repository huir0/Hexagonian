import 'package:freezed_annotation/freezed_annotation.dart';

part 'sfac_qna_model.freezed.dart';
part 'sfac_qna_model.g.dart';

@freezed
class SFACQnaModel with _$SFACQnaModel {
  factory SFACQnaModel({
    required String id,
    required String created,
    required String updated,
    required String collectionId,
    required String collectionName,
    required String content,
    required int like,
    required List<dynamic> tag,
    required String title,
    required String user,
    required int view,
  }) = _SFACQnaModel;

  factory SFACQnaModel.fromJson(Map<String, dynamic> json) =>
      _$SFACQnaModelFromJson(json);
}
