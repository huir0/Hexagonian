import 'package:flutter/material.dart';
import 'package:sfaclog/view/pages/community_page/com_reply_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read.appbar.dart';
import 'package:sfaclog/view/widgets/com_side_read_wigets/com_side_read_body.dart';
import 'package:sfaclog/view/widgets/com_side_read_wigets/com_side_read_card.dart';
import 'package:sfaclog/view/widgets/com_side_read_wigets/com_side_read_footer.dart';
import 'package:sfaclog_widgets/buttons/edit_button.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';
import 'package:sfaclog_widgets/util/common.dart';
import 'package:table_calendar/table_calendar.dart';

class ComSideReadPage extends StatelessWidget {
  const ComSideReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ComReadAppBarWidget(),
        body: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20, left: 20)),
                    Text(
                      'D-21',
                      style: TextStyle(
                        color: Color(0xFFD3265C),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 0.08,
                        letterSpacing: -0.16,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: ' |  프론트엔드, 디자인',
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0.08,
                              letterSpacing: -0.16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                    ),
                    Text('IPTIME 포트포워딩',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20, left: 20)),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/basic_profile_sm.png'),
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '곽서현',
                        style: SLTextStyle(
                          style: SLStyle.Text_S_Bold,
                          color: Colors.white,
                        ).textStyle,
                      ),
                      TextSpan(
                        text: '  수료생',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.primary.shade90,
                        ).textStyle,
                      ),
                      TextSpan(
                        text: '  4시간전',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.neutral.shade30,
                        ).textStyle,
                      ),
                      TextSpan(
                        text: '  조회수 1',
                        style: SLTextStyle(
                          style: SLStyle.Text_XS_Medium,
                          color: SLColor.neutral.shade30,
                        ).textStyle,
                      ),
                    ])),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                        width: 14,
                        height: 13,
                        child: Image.asset('assets/images/Vector.png')),
                    Text(
                      '  2 ',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 14,
                        height: 13,
                        child: Image.asset(
                            'assets/images/Rectangle 34626337 (Stroke).png')),
                    Text(
                      '  2 ',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                  ],
                ),
                ComSideReadBody(),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsetsDirectional.all(10)),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '프로젝트 소개',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '비대면 의료 닥터 루시드 프론트 팀원을 모집합니다.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '모집 역할  /인원',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '프론트엔드 1명',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '프로젝트 일정',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50, left: 30)),
                    Text(
                      '2024년 2월',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
                ComSideReadFooter(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      EditButton(
                          text: '북마크',
                          width: 125,
                          height: 39,
                          imagePath:
                              'assets/images/Rectangle 34626337 (Stroke).png'),
                      reviselabel(
                        width: 160,
                        height: 40,
                        text: '지원하기',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComReplayPage(),
                            ),
                          );
                        },
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
