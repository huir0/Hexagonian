import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/buttons/follow_button.dart';

class TopLoggerCard extends StatelessWidget {
  const TopLoggerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> skills = [
      'Javascipt',
      'React',
      'CSS',
    ];
    return Container(
      width: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '박스팩',
                      style: SLTextStyle(
                        style: SLStyle.Text_M_Medium,
                        color: Colors.black,
                      ).textStyle,
                    ),
                    Text(
                      '팔로워 2K | 팔로잉 21',
                      style: SLTextStyle(
                        style: SLStyle.Text_S_Regular,
                        color: SLColor.neutral.shade50,
                      ).textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: SLColor.primary.shade10,
            ),
          ),
          Column(
            children: [
              Text(
                '활동내역',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: SLColor.neutral.shade40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const _ImageCenterText(
                            image: 'assets/images/logger/qna.png',
                            text: '50',
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Q&A 답변수',
                            style: TextStyle(
                              fontSize: 9.17,
                              color: SLColor.neutral.shade80,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const _ImageCenterText(
                            image: 'assets/images/logger/star.png',
                            text: '4.5',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '협업 후기',
                            style: TextStyle(
                              fontSize: 9.17,
                              color: SLColor.neutral.shade80,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logger/log_king.png',
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '로그왕',
                            style: TextStyle(
                              fontSize: 9.17,
                              color: SLColor.neutral.shade80,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 27),
              Text(
                '스킬',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: SLColor.neutral.shade40,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SkillItem(
                    image: 'assets/images/logger/javascript.png',
                    text: 'Javascript',
                  ),
                  _SkillItem(
                    image: 'assets/images/logger/react.png',
                    text: 'React',
                  ),
                  _SkillItem(
                    image: 'assets/images/logger/css.png',
                    text: 'CSS',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: middleokButton(
                  text1: '팔로우',
                  text2: '팔로우 취소',
                  width: 189,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: 57,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 9.17,
                color: SLColor.neutral.shade80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCenterText extends StatelessWidget {
  const _ImageCenterText({
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 9.17,
                color: SLColor.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
