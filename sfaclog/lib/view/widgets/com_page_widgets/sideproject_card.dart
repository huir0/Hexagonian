import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class SideProjectCard extends StatelessWidget {
  const SideProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 200,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                width: 270,
                height: 200,
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F8FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                left: 20.43,
                top: 25.11,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '🌱프론트엔드 개발자 1명',
                            style: SLTextStyle(
                              style: SLStyle.Text_S_Bold,
                              color: SLColor.primary.shade90,
                            ).textStyle,
                          ),
                          TextSpan(
                            text: '  구하고 있어요',
                            style: SLTextStyle(
                              style: SLStyle.Text_S_Medium,
                              color: Color(0xFF020202),
                            ).textStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 20.92,
            top: 67,
            child: SizedBox(
              child: Text(
                '대학생 커리어 네트워킹 플랫폼 PUZZLE ',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.10,
                  letterSpacing: -0.14,
                ),
              ),
            ),
          ),
          Positioned(
              left: 20.92,
              top: 85,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '현재 인원',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.primary.shade90,
                          ).textStyle,
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '   기획자',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Medium,
                            color: Color(0xFF020202),
                          ).textStyle,
                        ),
                        TextSpan(
                          text: '1 ',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.primary.shade90,
                          ).textStyle,
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '• 디자이너',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Medium,
                            color: Color(0xFF020202),
                          ).textStyle,
                        ),
                        TextSpan(
                          text: '2',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.primary.shade90,
                          ).textStyle,
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ' • 개발자',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Medium,
                            color: Color(0xFF020202),
                          ).textStyle,
                        ),
                        TextSpan(
                          text: '1',
                          style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.primary.shade90,
                          ).textStyle,
                        )
                      ],
                    ),
                  ),
                ],
              )),
          Positioned(
            left: 150.92,
            top: 60,
            child: SizedBox(
              width: 171.75,
              child: Image.asset('assets/images/4.png'),
            ),
          ),
        ],
      ),
    );
  }
}
