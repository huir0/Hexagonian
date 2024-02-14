import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_appbar_widget.dart';
import 'package:sfaclog/viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../viewmodel/auth/auth_notifier.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import 'my_follower_page.dart';
import 'my_following_page.dart';

class MyFollowPage extends ConsumerStatefulWidget {
  const MyFollowPage({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowPageState();
}

class _MyFollowPageState extends ConsumerState<MyFollowPage> {
  
  String nickname = '';
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
  var userInfo = await ref
      .read(MyPageProfileProvider.notifier)
      .getUserInfo(widget.userId);
  var newNickname = userInfo.nickname;
  setState(() {
    nickname = newNickname;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(onPressed: (e) {}, title: nickname),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 7),
            child: SLTab(
              currentIndex: ref.watch(myFollowPageProvider).tab,
              horizontalMargin: 24,
              height: 43,
              menu: const [
                Text('팔로잉'),
                Text('팔로워'),
              ],
              onTap: (index) {
                ref.read(myFollowPageProvider.notifier).tabChanged(index);
              },
            ),
          ),
          Expanded(
            child: MyFollowPageBody(userId: widget.userId),
          ),
        ],
      ),
    );
  }
}

class MyFollowPageBody extends ConsumerWidget {
  const MyFollowPageBody({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(myFollowPageProvider).tab;

    switch (selectedTab) {
      case 0:
        return MyFollowingPage(userId: userId);
      case 1:
        return MyFollowerPage(userId: userId);
      default:
        return Container();
    }
  }
}
