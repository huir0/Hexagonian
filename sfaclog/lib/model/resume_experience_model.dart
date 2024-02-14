import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_experience_model.freezed.dart';

@freezed
class ExperienceModel with _$ExperienceModel {
  const factory ExperienceModel({
    required String id,
    required String collectionId,
    required String collectionName,
    required String created,
    required String updated,
    required String company,
    required String title,
    required String startDate,
    required String endDate,
    required String content,
    required String user,
    List<dynamic>? skills,
    required bool working,
    List<dynamic>? links,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
  return ExperienceModel(
    id: json['id'] as String? ?? '',
    collectionId: json['collectionId'] as String? ?? '',
    collectionName: json['collectionName'] as String? ?? '',
    created: json['created'] as String? ?? '',
    updated: json['updated'] as String? ?? '',
    company: json['company'] as String? ?? '',
    title: json['title'] as String? ?? '',
    startDate: json['startDate'] as String? ?? '',
    endDate: json['endDate'] as String? ?? '',
    content: json['content'] as String? ?? '',
    user: json['user'] as String? ?? '',
    skills: (json['skills'] as List<dynamic>?)?.toList() ?? [],
    working: json['working'] as bool? ?? false,
    links: (json['links'] as List<dynamic>?)?.toList() ?? [],
  );
}

}
