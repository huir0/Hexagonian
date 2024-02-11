import 'package:freezed_annotation/freezed_annotation.dart';

part 'sfac_log_category_model.freezed.dart';
part 'sfac_log_category_model.g.dart';

@freezed
class SFACLogCategoryModel with _$SFACLogCategoryModel {
  factory SFACLogCategoryModel({
    required String name,
    required List<dynamic> log,
    required String users,
    required String public,
  }) = _SFACLogCategoryModel;

  factory SFACLogCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SFACLogCategoryModelFromJson(json);
}
