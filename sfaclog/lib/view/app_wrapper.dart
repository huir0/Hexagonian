import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/community_page/community_page.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/view/widgets/appbar_widget.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_notifier.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_state.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appwrapperProvider);
    List<Widget> pages = <Widget>[
      const MainPage(),
      const CommunityPage(),
      const LogPage(),
      const MyPage(),
    ];
    List<String> pagesLabel = ['홈', '커뮤니티', '로그', '마이페이지'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(pageLabel: pagesLabel[state.page]),
        body: pages[state.page],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: SLColor.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.page,
          onTap: (index) {
            ref.read(appwrapperProvider.notifier).pageChanged(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home, size: 24),
              label: pagesLabel[0],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.explore, size: 24),
              label: pagesLabel[1],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.note, size: 24),
              label: pagesLabel[2],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people, size: 24),
              label: pagesLabel[3].substring(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}
