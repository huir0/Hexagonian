import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog/viewmodel/skills_viewmodel/skills_provider.dart';
import 'package:sfaclog/viewmodel/skills_viewmodel/skills_state.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class SkillSection extends ConsumerStatefulWidget {
  const SkillSection({
    super.key,
  });

  @override
  SkillSectionState createState() => SkillSectionState();
}

class SkillSectionState extends ConsumerState<SkillSection> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final skillState = ref.watch(skillsProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);
    final onboardingState = ref.read(onboardingProvider);

    const String title = '스킬';
    const String description = '보유한 스킬들을 토대로 콘텐츠를 추천해드려요.';
    const String guide = '최소 2개 이상 선택';
    const String hintText = '스킬을 입력해주세요.';
    const String subtitle = '인기 스킬';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithCount(
            title: title,
            curIdx: onboardingState.currentPage + 1,
            total: onboardingState.totalPage),
        const SizedBox(height: 8),
        Text(
          description,
          style: SLTextStyle.Text_M_Regular?.copyWith(
            color: SLColor.neutral.shade30,
          ),
        ),
        Text(
          guide,
          style: SLTextStyle.Text_S_Regular?.copyWith(
            color: SLColor.neutral.shade50,
          ),
        ),
        const SizedBox(height: 45),
        SFACSearchBar(
          height: 38,
          width: double.infinity,
          hintText: hintText,
          active: true,
          controller: controller,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: SLColor.primary),
          ),
          onSubmitted: (value) {
            // 1. 화면: dropdown search list + overlay
            // 2. 기능: 클릭시 search skills + push selectedSkill
          },
        ),
        const SizedBox(height: 40),
        const SelectedSkillChips(),
        Text(
          subtitle,
          style: SLTextStyle.Text_M_Bold?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const AllSkills(),
        SLButton(
          text: '다음',
          isActive: onboardingState.isButtonEnabled,
          onTap: onboardingState.isButtonEnabled
              ? () async {
                  try {
                    if (2 <= skillState.selectedSkills.length) {
                      onboardingNotifier.uploadSkills(
                        skills: skillState.selectedSkills,
                      );
                    }
                    onboardingNotifier.moveNextSection();
                  } catch (e) {
                    print(e);
                  }
                }
              : null,
        ),
      ],
    );
  }
}

class SelectedSkillChips extends ConsumerWidget {
  const SelectedSkillChips({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillState = ref.watch(skillsProvider);
    final skillNotifier = ref.watch(skillsProvider.notifier);

    return Column(
      children: [
        Wrap(
          spacing: 12,
          children: skillState.selectedSkills
              .map(
                (skill) => SkillChip(
                  text: skill.name,
                  borderColor: SLColor.primary,
                  textStyle: SLTextStyle.Text_S_Bold,
                  svgIconWidget: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                    ),
                  ),
                  onPressed: () {
                    skillNotifier.deleteSkill(skill);
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AllSkills extends ConsumerWidget {
  const AllSkills({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillState = ref.watch(skillsProvider);
    final skillNotifier = ref.watch(skillsProvider.notifier);

    if (skillState.skillsStatus == SkillsStatus.fetching) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (skillState.skillsStatus == SkillsStatus.success) {
      List<SkillModel>? allSkills = skillState.allSkills ?? [];

      return Wrap(
        spacing: 12,
        children: allSkills
            .map(
              (skill) => SkillChip(
                text: skill.name,
                onPressed: () {
                  if (!skillState.selectedSkills.contains(skill)) {
                    skillNotifier.addSkill(skill);
                  } else {
                    skillNotifier.deleteSkill(skill);
                  }
                },
              ),
            )
            .toList(),
      );
    } else {
      return Center(
        child: Text('${skillState.skillsStatus}: Failed to fetch skills'),
      );
    }
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.text,
    this.suffixIcon,
    this.svgIconWidget,
    this.borderColor = Colors.transparent,
    this.textStyle,
    this.onPressed,
  });
  final String text;
  final IconData? suffixIcon;
  final Widget? svgIconWidget;
  final Color borderColor;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SFACSkillChip(
      text: Text(
        text,
        style: textStyle ?? SLTextStyle.Text_S_Medium,
      ),
      suffixIcon: suffixIcon,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      borderColor: borderColor,
      backgroundColor: SLColor.neutral.shade80,
      svgIconWidget: svgIconWidget,
      onPressed: onPressed,
    );
  }
}
