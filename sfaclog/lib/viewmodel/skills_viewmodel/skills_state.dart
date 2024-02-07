// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/skill_model.dart';

enum SkillsStatus {
  init,
  fetching,
  select,
  success,
  error,
}

class SkillsState extends Equatable {
  final SkillsStatus skillsStatus;
  final List<SkillModel> allSkills;
  final List<SkillModel> selectedSkills;

  const SkillsState({
    required this.skillsStatus,
    required this.allSkills,
    required this.selectedSkills,
  });

  factory SkillsState.init({
    List<SkillModel>? allSkills,
  }) {
    return const SkillsState(
      skillsStatus: SkillsStatus.init,
      allSkills: [],
      selectedSkills: [],
    );
  }

  @override
  List<Object> get props => [skillsStatus, allSkills];

  SkillsState copyWith({
    SkillsStatus? skillsStatus,
    List<SkillModel>? allSkills,
    List<SkillModel>? selectedSkills,
  }) {
    return SkillsState(
      skillsStatus: skillsStatus ?? this.skillsStatus,
      allSkills: allSkills ?? this.allSkills,
      selectedSkills: selectedSkills ?? this.selectedSkills,
    );
  }
}
