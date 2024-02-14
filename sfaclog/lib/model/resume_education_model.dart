import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_education_model.freezed.dart';

@freezed
class EducationModel with _$EducationModel {
  const factory EducationModel({
    required String id,
    required String collectionId,
    required String collectionName,
    required String created,
    required String updated,
    required String institute,
    required String major,
    required String startDate,
    required String endDate,
    required String content,
    required String user,
    required bool studying,
    List<dynamic>? links,
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) {
  return EducationModel(
    id: json['id'] as String? ?? '',
    collectionId: json['collectionId'] as String? ?? '',
    collectionName: json['collectionName'] as String? ?? '',
    created: json['created'] as String? ?? '',
    updated: json['updated'] as String? ?? '',
    institute: json['institute'] as String? ?? '',
    major: json['major'] as String? ?? '',
    startDate: json['startDate'] as String? ?? '',
    endDate: json['endDate'] as String? ?? '',
    content: json['content'] as String? ?? '',
    user: json['user'] as String? ?? '',
    studying: json['studying'] as bool? ?? false,
    links: (json['links'] as List<dynamic>?)?.toList() ?? [],
  );
}

}
