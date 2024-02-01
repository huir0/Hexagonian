import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class LogReplyListTileWidget extends StatelessWidget {
  const LogReplyListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [Icon(Icons.people), Text('Name')],
            ),
            Row(
              children: [
                const Text('2024.02.02'),
                InkWell(
                    onTap: () {
                      SLSheet.bottomSheet(
                          context: context,
                          child: Column(children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  '신고하기',
                                  style: SLTextStyle(
                                          style: SLStyle.Text_L_Bold,
                                          color: Colors.white)
                                      .textStyle,
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  '차단하기',
                                  style: SLTextStyle(
                                          style: SLStyle.Text_L_Bold,
                                          color: Colors.white)
                                      .textStyle,
                                )),
                          ]),
                          height: 180,
                          width: 360);
                    },
                    child: const Icon(Icons.more_vert_rounded))
              ],
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          '좋은글 잘 보고 갑니다.',
          style: SLTextStyle(
                  style: SLStyle.Text_M_Medium, color: SLColor.neutral.shade10)
              .textStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                '답글',
                style: SLTextStyle(
                        style: SLStyle.Text_S_Bold,
                        color: SLColor.neutral.shade50)
                    .textStyle,
              ),
            ),
            const Row(
              children: [
                Icon(Icons.favorite),
                Text('1'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
