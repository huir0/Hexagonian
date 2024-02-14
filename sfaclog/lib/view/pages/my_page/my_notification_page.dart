import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_toggle_widget.dart';
import 'package:sfaclog/viewmodel/mypage_state_viewmodel/mypage_states.dart';

import '../../../common.dart';

List<Map<String, dynamic>> list = [
  {
    'title': '채팅',
    'subtitle': '새 메세지',
    'provider': chattingNotificationProvider
  },
  {
    'title': '프로필 팔로우',
    'subtitle': '',
    'provider': profileFollowNotificationProvider
  },
  {
    'title': 'Q&A',
    'subtitle': '내 질문에 달린 답변',
    'provider': qnaNotificationProvider
  },
  {'title': '로그', 'subtitle': '좋아요와 댓글', 'provider': logNotificationProvider},
];

class MypageNotification extends StatefulWidget {
  const MypageNotification({super.key});

  @override
  State<MypageNotification> createState() => _MypageNotificationState();
}

class _MypageNotificationState extends State<MypageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        centerTitle: true,
        title: Text(
          '알림',
          style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            for (var i = 0; i < list.length; i++) ...[
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 312,
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: SLColor.neutral[80],
                ),
                child: Row(
                  children: [
                    Text(
                      list[i]['title'],
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      list[i]['subtitle'],
                      style: SLTextStyle.Text_S_Medium?.copyWith(
                          color: SLColor.neutral[60]),
                    ),
                    const Spacer(),
                    MypageToggle(toggleProvider: list[i]['provider']),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
