import 'package:flutter/material.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_page.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/user_info_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/auth/auth_state.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';
import 'my_bookmark_page.dart';
import 'my_log_page.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch<AuthState>(authProvider);
// // 로그인 상태가 아니면 로그인 페이지로 리다이렉트
//     if (authState.authStatus != AuthStatus.authenticated) {
//       router.go('/home/home');
//       // return Container();  // 로그인 페이지로 리다이렉트하므로 여기서는 빈 컨테이너를 반환
//     }
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 7),
          child: SLTab(
            currentIndex: ref.watch(myPageProvider).tab,
            horizontalMargin: 9,
            height: 43,
            menu: [
              Text('프로필'),
              Text('나의 로그'),
              Text('북마크'),
            ],
            onTap: (index) {
              ref.read(myPageProvider.notifier).tabChanged(index);
            },
          ),
        ),
        Expanded(
          child: MyPageBody(),
        ),
      ]),
    );
  }
}

class MyPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(myPageProvider).tab;
    // final userId = ref.read(userInfoProvider.notifier).getId();
    final userId = '7n5leq73rgpoutw';
    
    switch (selectedTab) {
      case 0:
        return MyProfilePage(userId: userId);
      case 1:
        return MyLogPage(userId: userId);
      case 2:
        return MyBookmarkPage(userId: userId);
      default:
        return Container();
    }
  }
}
