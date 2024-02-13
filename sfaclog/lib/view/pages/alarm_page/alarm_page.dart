import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      print('전체 알람 확인');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '알림',
          style: SLTextStyle(
            style: SLStyle.Heading_S_Bold,
            color: Colors.white,
          ).textStyle,
        ),
        actions: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                '전체 확인',
                style: SLTextStyle(
                  style: SLStyle.Text_M_Regular,
                  color: SLColor.neutral.shade20,
                ).textStyle,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 32,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const SLAlert(
            from: '로그',
            content: '스팩왕박스팩님이 댓글을 달았습니다.',
            formatedDate: '오늘',
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
      ),
    );
  }
}
