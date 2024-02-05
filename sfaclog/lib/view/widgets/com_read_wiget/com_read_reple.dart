import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_reple_card.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComReple extends StatelessWidget {
  const ComReple({super.key});

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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '답변  ',
                        style: SLTextStyle(
                          style: SLStyle.Text_L_Bold,
                          color: Colors.white,
                        ).textStyle,
                      ),
                      TextSpan(
                          text: '  1개',
                          style: TextStyle(
                            color: Color(0xFFB3B3B3),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ),
                SFACMenuButton(
                  items: optionList,
                  onItemSelected: (value) {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/basic_profile_sm.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '서나정',
                  style: SLTextStyle(
                    style: SLStyle.Text_S_Bold,
                    color: Colors.white,
                  ).textStyle,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: '포트포워딩 자체에는 문제가 없어보입니다. dns나 퀵커\n',
                style: SLTextStyle(
                  style: SLStyle.Text_S_Bold,
                  color: Colors.white,
                ).textStyle,
              ),
              TextSpan(
                text: '넥트 설정 잘 되어 있는지 확인해보세요. 다만 dms이나\n',
                style: SLTextStyle(
                  style: SLStyle.Text_S_Bold,
                  color: Colors.white,
                ).textStyle,
              ),
              TextSpan(
                text: 'ftp외부포느는 변경해 주시는게 좋을거에요. 기본 포트로\n',
                style: SLTextStyle(
                  style: SLStyle.Text_S_Bold,
                  color: Colors.white,
                ).textStyle,
              ),
              TextSpan(
                text: '놔두면 공격 엄청 들어와요.\n\n',
                style: SLTextStyle(
                  style: SLStyle.Text_S_Bold,
                  color: Colors.white,
                ).textStyle,
              ),
            ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('답글'),
                Row(
                  children: [
                    Container(
                        width: 14,
                        height: 13,
                        child: Image.asset('assets/images/Vector (1).png')),
                    Text(
                      '  3 ',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(5)),
                Container(
                    width: 14,
                    height: 13,
                    child: Image.asset('assets/images/Vector 4850.png')),
                ComReadCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
