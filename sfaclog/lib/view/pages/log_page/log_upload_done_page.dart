import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

class LogUploadDonePage extends StatelessWidget {
  final String tagId;
  const LogUploadDonePage({super.key, required this.tagId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/log_finish.png'),
            Text(
              '오늘도 스펙업!',
              style: SLTextStyle(
                      style: SLStyle.Text_L_Bold,
                      color: SLColor.neutral.shade10)
                  .textStyle,
            ),
            Text(
              '로그를 업로드하였습니다.',
              style: SLTextStyle(
                      style: SLStyle.Text_L_Bold,
                      color: SLColor.neutral.shade10)
                  .textStyle,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: reviselabel(
          width: 312,
          height: 52,
          text: '확인',
          onPressed: () {
            context.go('/log/read/$tagId');
            // Navigator.push 로직
          },
        ),
      ),
    );
  }
}
