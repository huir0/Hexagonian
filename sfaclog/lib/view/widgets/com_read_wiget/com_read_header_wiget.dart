import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

class ComReadingHeader extends StatelessWidget {
  const ComReadingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'IPTIME 포트포워딩',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 20,
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '얼마전에 집안에 공유기를 모두 iptime으로 변경했는데\n',
              style: SLTextStyle(
                style: SLStyle.Text_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
            TextSpan(
              text: '포트포워딩이 제대로 안되었는지 내부 접속은 되는데\n',
              style: SLTextStyle(
                style: SLStyle.Text_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
            TextSpan(
              text: '외부접속이 안되네요.\n\n\n',
              style: SLTextStyle(
                style: SLStyle.Text_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
            TextSpan(
              text: '혹시 아래처럼 하는게 뭐 잘못 된 건가요?\n',
              style: SLTextStyle(
                style: SLStyle.Text_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
            TextSpan(
              text: '내부 IP는 모두 나스의 IP를 넣어놨습니다\n\n',
              style: SLTextStyle(
                style: SLStyle.Text_S_Bold,
                color: Colors.white,
              ).textStyle,
            ),
          ])),
          Row(
            children: [
              Container(
                height: 22,
                width: 92,
                padding: EdgeInsets.all(0),
                decoration: ShapeDecoration(
                  color: Color(0xFF020202),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF666666),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '#Port-Fowarding',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 22,
                width: 54,
                padding: EdgeInsets.all(0),
                decoration: ShapeDecoration(
                  color: Color(0xFF020202),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF666666),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '#IPTIME',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 22,
                width: 94,
                padding: EdgeInsets.all(0),
                decoration: ShapeDecoration(
                  color: Color(0xFF020202),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF666666),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '#창업/수익창출가능',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
