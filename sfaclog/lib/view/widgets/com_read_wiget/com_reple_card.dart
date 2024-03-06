import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class ComReadCard extends StatelessWidget {
  const ComReadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: SLColor.neutral,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const ShapeDecoration(
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
                  const SizedBox(
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
              Row(
                children: [
                  Text(
                    '30분전',
                    style: SLTextStyle(
                      style: SLStyle.Text_XS_Regular,
                      color: SLColor.neutral.shade50,
                    ).textStyle,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: SLColor.neutral.shade50,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '다른 공유기를 쓰다가 바꾼거라 포트포워딩만\n새로 했는데, 나스 설정도 봐야겠네요.',
            style: SLTextStyle(
              style: SLStyle.Text_M_Regular,
              color: SLColor.neutral.shade10,
            ).textStyle,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(),
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
        ],
      ),
    );
  }
}
