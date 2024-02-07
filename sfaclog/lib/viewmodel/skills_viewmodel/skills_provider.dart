import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/skills_repository.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/viewmodel/skills_viewmodel/skills_state.dart';

class SkillsProvider extends StateNotifier<SkillsState> {
  SkillsProvider() : super(SkillsState.init());

  void deleteSkill(SkillModel skill) async {
    try {
      state = state.copyWith(skillsStatus: SkillsStatus.select);

      List<SkillModel> newSelectedSkills = state.selectedSkills
          .where((element) => element.id != skill.id)
          .toList();

      state = state.copyWith(
        skillsStatus: SkillsStatus.success,
        selectedSkills: newSelectedSkills,
      );
    } catch (e) {
      state = state.copyWith(skillsStatus: SkillsStatus.error);
      rethrow;
    }
  }

  void addSkill(SkillModel skill) async {
    try {
      state = state.copyWith(skillsStatus: SkillsStatus.select);

      state = state.copyWith(
        skillsStatus: SkillsStatus.success,
        selectedSkills: [...state.selectedSkills, skill],
      );
    } catch (e) {
      state = state.copyWith(skillsStatus: SkillsStatus.error);
      rethrow;
    }
  }

  Future<void> getAllSkills() async {
    try {
      state = state.copyWith(skillsStatus: SkillsStatus.fetching);
      var skills = await SkillsReposotory().getAllSkills();
      List<SkillModel> result = skills.map((skill) {
        return SkillModel.fromJson(skill.toJson());
      }).toList();

      state = state.copyWith(
        allSkills: result,
        skillsStatus: SkillsStatus.success,
      );
    } catch (e) {
      state = state.copyWith(skillsStatus: SkillsStatus.error);
      rethrow;
    }
  }

  Future<void> searchSkills(String keyword) async {
    try {
      state = state.copyWith(skillsStatus: SkillsStatus.fetching);
      RecordModel result = await SkillsReposotory().searchSkills(
        keyword: keyword,
      );

      print('$keyword: $result');

      state = state.copyWith(
        skillsStatus: SkillsStatus.success,
      );
    } catch (e) {
      state = state.copyWith(skillsStatus: SkillsStatus.error);
      rethrow;
    }
  }
}

final skillsProvider =
    StateNotifierProvider<SkillsProvider, SkillsState>((ref) {
  final skillsProvider = SkillsProvider();
  skillsProvider.getAllSkills();

  ref.onDispose(() {
    skillsProvider.getAllSkills();
  });

  return skillsProvider;
});
