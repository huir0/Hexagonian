import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:sfaclog/model/user_info.dart';

class QuestionHeaderWidget extends StatelessWidget {
  const QuestionHeaderWidget({
    super.key,
    required this.title,
    required this.author,
    required this.qna,
  });
  final String title;
  final UserInfo author;
  final SFACQnaModel qna;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 8),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: author.nickname ?? 'Unknown',
                        style: SLTextStyle(
                          style: SLStyle.Text_S_Bold,
                          color: Colors.white,
                        ).textStyle,
                      ),
                      const WidgetSpan(child: SizedBox(width: 4)),
                      TextSpan(
                        text: '수료생',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.primary.shade90,
                        ).textStyle,
                      ),
                      const WidgetSpan(child: SizedBox(width: 4)),
                      TextSpan(
                        text: '4시간전',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.neutral.shade30,
                        ).textStyle,
                      ),
                      TextSpan(
                        text: '·조회수 ${qna.view}',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.neutral.shade30,
                        ).textStyle,
                      ),
                    ])),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                        width: 14,
                        height: 13,
                        child: Image.asset('assets/images/Vector.png')),
                    const SizedBox(width: 4),
                    Text(
                      qna.like.toString(),
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                        width: 14,
                        height: 13,
                        child: Image.asset(
                            'assets/images/Rectangle 34626337 (Stroke).png')),
                    const SizedBox(width: 4),
                    //@todo bookmark 기능 추가하기(collection 리팩토링)
                    Text(
                      '  2 ',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
