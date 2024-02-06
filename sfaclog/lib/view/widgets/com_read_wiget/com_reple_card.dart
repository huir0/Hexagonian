import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class ComReadCard extends StatelessWidget {
  const ComReadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 286,
      height: 125,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 286,
              height: 126,
              decoration: ShapeDecoration(
                color: Color(0xFF020202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
              left: 22,
              top: 53,
              child: SizedBox(
                child: Text(
                  '다른 공유기를 쓰다가 바꾼거라 포트포워딩만\n새로 했는데, 나스 설정도 봐야겠네요.',
                  style: SLTextStyle(
                          style: SLStyle.Text_M_Regular,
                          color: SLColor.neutral.shade10)
                      .textStyle,
                ),
              )),
          Positioned(
            top: 5,
            left: 10,
            child: Row(
              children: [
                Row(
                  children: [
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
                    Text(
                      '서나정',
                      style: SLTextStyle(
                        style: SLStyle.Text_S_Bold,
                        color: Colors.white,
                      ).textStyle,
                    ),
                    Text(
                      '  수료생',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.primary.shade90,
                      ).textStyle,
                    )
                  ],
                ),
                SizedBox(
                  width: 110,
                ),
                Row(
                  children: [
                    Text(
                      '30분전',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Regular,
                        color: SLColor.neutral.shade50,
                      ).textStyle,
                    ),
                    Image.asset(
                      'assets/images/more-vertical-f.png',
                      color: SLColor.neutral.shade50,
                    )
                    // more-vertical-f
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 10,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Vector (1).png',
                ),
                Text(
                  ' 680',
                  style: SLTextStyle(
                    style: SLStyle.Text_XS_Regular,
                    color: SLColor.neutral.shade50,
                  ).textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
