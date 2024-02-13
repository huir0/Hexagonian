import 'package:freezed_annotation/freezed_annotation.dart';

part 'sfac_log_model.freezed.dart';
part 'sfac_log_model.g.dart';

@freezed
class SFACLogModel with _$SFACLogModel {
  factory SFACLogModel({
    required String id,
    required String created,
    required String updated,
    required String collectionId,
    required String collectionName,
    required dynamic expand,
    required String body,
    required String category,
    required int favorite,
    required List<dynamic> images,
    required String public,
    required List<dynamic> tag,
    required String thumbnail,
    required String title,
    required String user,
    required int view,
    required int like,
    int? replyCnt,
  }) = _SFACLogModel;

  factory SFACLogModel.fromJson(Map<String, dynamic> json) =>
      _$SFACLogModelFromJson(json);
}
