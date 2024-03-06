import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/qna_answer_model.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.answer,
  });
  final QnaAnswerModel answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Image.asset(
                    'assets/images/basic_profile_sm.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  answer.expand?['user']?['nickname'] ?? 'Unknown',
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Medium,
                  ).textStyle,
                ),
              ],
            ),
            Row(
              children: [
                //@todo: model에 created, updated 추가하기 + 포매팅하기
                Text(
                  '30분 전',
                  style: SLTextStyle(
                    style: SLStyle.Text_S_Regular,
                    color: SLColor.neutral.shade50,
                  ).textStyle,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.more_vert,
                  color: SLColor.neutral.shade50,
                ),
              ],
            ),
          ],
        ),
        Html(
          data: answer.content,
          style: {
            "body": Style(
              fontSize: FontSize(14),
              margin: Margins.zero,
            ),
          },
        ),
      ],
    );
  }
}
