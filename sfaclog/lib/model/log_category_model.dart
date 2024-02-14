import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_category_model.freezed.dart';
part 'log_category_model.g.dart';

@freezed
class LogCategoryModel with _$LogCategoryModel {
  factory LogCategoryModel({
    required String name,
    required String log,
    required String? user,
    required String public,
    String? created,
  }) = _LogCategoryModel;

  factory LogCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$LogCategoryModelFromJson(json);
}
