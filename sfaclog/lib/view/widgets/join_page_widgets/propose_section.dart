import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';

class ProposeSection extends StatelessWidget {
  const ProposeSection({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = '제안';
    const String description = '채용 및 프로젝트 제안을 받을 의향이 있으신가요?';

    int curIdx = 5;
    int total = 5;
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
        const SizedBox(height: 40),
      ],
    );
  }
}
