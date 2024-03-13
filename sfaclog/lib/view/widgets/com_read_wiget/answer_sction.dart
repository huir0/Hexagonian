import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/answer_card.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class AnswerSecion extends StatelessWidget {
  const AnswerSecion({
    super.key,
    required this.answers,
  });
  final List<QnaAnswerModel> answers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '답변',
                      style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: Colors.white,
                      ).textStyle,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${answers.length}개',
                      style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                  ],
                ),
                SFACMenuButton(
                  items: optionList,
                  onItemSelected: (value) {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            answers.isEmpty
                ? const Center(
                    child: Text(
                      '아직 답변이 없습니다.',
                    ),
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AnswerCard(answer: answers[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 1);
                    },
                    itemCount: answers.length,
                  ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
