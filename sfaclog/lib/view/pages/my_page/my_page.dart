import 'package:flutter/material.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_page.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import 'my_bookmark_page.dart';
import 'my_log_page.dart';

// final selectedTabProvider = StateProvider<int>((ref) => 0);

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // ref.read(selectedTabProvider.notifier).state = index;
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
    // final selectedTab = ref.watch(selectedTabProvider);
    final selectedTab = ref.watch(myPageProvider).tab;

    switch (selectedTab) {
      case 0:
        return MyProfilePage();
      case 1:
        return MyLogPage();
      case 2:
        return MyBookmarkPage();
      default:
        return Container();
    }
  }
}
