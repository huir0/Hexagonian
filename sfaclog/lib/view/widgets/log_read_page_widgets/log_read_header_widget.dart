import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReadHeaderWidget extends StatelessWidget {
  final String title;
  const LogReadHeaderWidget({super.key, required this.title});

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
              '인기글',
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.people_outline),
                    Text('Name'),
                    Text('수료생'),
                  ],
                ),
                Row(
                  children: [
                    Text('4시간 전'),
                    Text('·'),
                    Text('조회수 1'),
                  ],
                ),
                ButtonSm(text: '팔로우'),
                //ElevatedButton(onPressed: () {}, child: const Text('팔로우'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
