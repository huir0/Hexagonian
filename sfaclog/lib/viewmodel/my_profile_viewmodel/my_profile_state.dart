import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/resume_experience_model.dart';

class MyPageProfileState extends Equatable {
  final List<dynamic> experiences;
  final List<dynamic> educations;
  final List<dynamic> links;

  const MyPageProfileState({
    required this.experiences,
    required this.educations,
    required this.links,
  });

  @override
  List<Object?> get props => [
        experiences,
        educations,
        links,
      ];

  MyPageProfileState copyWith({
    List<dynamic>? experiences,
    List<dynamic>? educations,
    List<dynamic>? links,
  }) {
    return MyPageProfileState(
      experiences: experiences ?? this.experiences,
      educations: educations ?? this.educations,
      links: links ?? this.links,
    );
  }
}
