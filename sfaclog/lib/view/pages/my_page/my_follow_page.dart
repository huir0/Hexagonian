import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_appbar_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import 'my_follower_page.dart';
import 'my_following_page.dart';

class MyFollowPage extends ConsumerStatefulWidget {
  const MyFollowPage({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowPageState();
}

class _MyFollowPageState extends ConsumerState<MyFollowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(onPressed: (e) {}, title: widget.userName),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 7),
            child: SLTab(
              currentIndex: ref.watch(myFollowPageProvider).tab,
              horizontalMargin: 24,
              height: 43,
              menu: [
                Text('팔로잉'),
                Text('팔로워'),
              ],
              onTap: (index) {
                ref.read(myFollowPageProvider.notifier).tabChanged(index);
              },
            ),
          ),
          Expanded(
            child: MyFollowPageBody(),
          ),
        ],
      ),
    );
  }
}

class MyFollowPageBody extends ConsumerWidget {
  const MyFollowPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(myFollowPageProvider).tab;

    switch (selectedTab) {
      case 0:
        return MyFollowingPage();
      case 1:
        return MyFollowerPage();
      default:
        return Container();
    }
  }
}
