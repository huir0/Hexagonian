import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReadHeaderWidget extends StatelessWidget {
  final String title;
  final String category;
  const LogReadHeaderWidget(
      {super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 122,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              category,
              style: SLTextStyle(
                      style: SLStyle.Text_M_Regular,
                      color: SLColor.neutral.shade50)
                  .textStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: SLTextStyle(
                      style: SLStyle.Heading_M_Bold, color: Colors.white)
                  .textStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/avatars/avatar_17.svg',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Name',
                      style: SLTextStyle(style: SLStyle.Text_S_Bold).textStyle,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '수료생',
                      style: SLTextStyle(
                              style: SLStyle.Text_XS_Medium,
                              color: SLColor.primary)
                          .textStyle,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '4시간 전',
                      style:
                          SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle,
                    ),
                    const Text('·'),
                    Text(
                      '조회수 1',
                      style:
                          SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle,
                    ),
                  ],
                ),

                const reviselabel(
                  fontSize: 10,
                  width: 46,
                  height: 32,
                  text: '팔로우',
                ),

                //ElevatedButton(onPressed: () {}, child: const Text('팔로우'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
