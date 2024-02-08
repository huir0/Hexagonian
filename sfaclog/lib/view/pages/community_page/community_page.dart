import 'package:flutter/material.dart';
import 'package:sfaclog/view/pages/community_page/com_sideproject_page.dart';
import 'package:sfaclog/view/pages/community_page/developqna_page.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';

// final selectedTabProvider = StateProvider<int>((ref) => 0);

class CommunityPage extends ConsumerWidget {
  const CommunityPage({super.key});

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
              Text('개발자 Q&A'),
              Text('사이드 프로젝트'),
            ],
            onTap: (index) {
              // ref.read(selectedTabProvider.notifier).state = index;
              ref.read(myPageProvider.notifier).tabChanged(index);
            },
          ),
        ),
        Expanded(
          child: CommunityPageBody(),
        ),
      ]),
    );
  }
}

class CommunityPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedTab = ref.watch(selectedTabProvider);
    final selectedTab = ref.watch(myPageProvider).tab;

    switch (selectedTab) {
      case 0:
        return DevelopQnA();
      case 1:
        return ComSidePage();

      default:
        return Container();
    }
  }
}
