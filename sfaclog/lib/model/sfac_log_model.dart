import 'package:freezed_annotation/freezed_annotation.dart';

part 'sfac_log_model.freezed.dart';
part 'sfac_log_model.g.dart';

@freezed
class SFACLogModel with _$SFACLogModel {
  factory SFACLogModel({
    required String title,
    required String category,
    required String body,
    required List<dynamic> imgList,
    required String thumbNail,
    required String public,
    required List<String> tag,
    required String user,
    required int view,
    required int like,
  }) = _SFACLogModel;

  factory SFACLogModel.fromJson(Map<String, dynamic> json) =>
      _$SFACLogModelFromJson(json);
}
