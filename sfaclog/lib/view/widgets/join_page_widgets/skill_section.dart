import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/textfields/sl_search_bar.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = '스킬';
    const String description = '보유한 스킬들을 토대로 콘텐츠를 추천해드려요.';
    const String guide = '최소 2개 이상 선택';
    const String hintText = '스킬을 입력해주세요.';
    const String subtitle = '인기 스킬';

    int curIdx = 4;
    int total = 5;
    List<String> selectedSkills = [
      'Javascript',
      'React',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithCount(title: title, curIdx: curIdx, total: total),
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
        const SFACSearchBar(
          height: 38,
          width: double.infinity,
          hintText: hintText,
        ),
        const SizedBox(height: 40),
        // Selected Skills section
        if (selectedSkills != [])
          Column(
            children: [
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: selectedSkills
                    .map(
                      (skill) => Chip(
                        label: Text(
                          skill,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        Text(
          subtitle,
          style: SLTextStyle.Text_M_Bold?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        // Popular Skills section
        const SFACTag(text: Text('javascript')),
      ],
    );
  }
}
