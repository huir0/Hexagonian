import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_model.freezed.dart';
part 'link_model.g.dart';

@freezed
class LinkModel with _$LinkModel {
  factory LinkModel({
    required String id,
    required String created,
    required String updated,
    required String collectionId,
    required String collectionName,
    required String link,
    required String user,
    required String name,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);
}