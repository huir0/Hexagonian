import 'package:flutter/material.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_page.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/user_info_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/auth/auth_state.dart';
import '../../../viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';
import 'my_bookmark_page.dart';
import 'my_log_page.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 7),
          child: SLTab(
            currentIndex: ref.watch(myPageProvider).tab,
            horizontalMargin: 9,
            height: 43,
            menu: const [
              Text('프로필'),
              Text('나의 로그'),
              Text('북마크'),
            ],
            onTap: (index) {
              ref.read(myPageProvider.notifier).tabChanged(index);
            },
          ),
        ),
        const Expanded(
          child: MyPageBody(),
        ),
      ]),
    );
  }
}

class MyPageBody extends ConsumerStatefulWidget {
  const MyPageBody({super.key});
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageBodyState();
}

class _MyPageBodyState extends ConsumerState<MyPageBody> {
  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(myPageProvider).tab;
    final userInfo = ref.watch(authProvider).userInfo;
    switch (selectedTab) {
      case 0:
        return MyProfilePage(userInfo: userInfo, userId: userInfo['id']);
      case 1:
        return MyLogPage(userId: userInfo['id']);
      case 2:
        return MyBookmarkPage(userInfo: userInfo);
      default:
        return Container();
    }
  }
}
