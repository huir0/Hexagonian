import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
        ),
        body: pages[state.page],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: state.page,
          onTap: (index) {
            ref.read(appwrapperProvider.notifier).pageChanged(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 24),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore, size: 24),
              label: '커뮤니티',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note, size: 24),
              label: '로그',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, size: 24),
              label: '마이',
            ),
          ],
        ),
      ),
    );
  }
}
