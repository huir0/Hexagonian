import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_notifier.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appwrapperProvider);
    List<Widget> pages = <Widget>[
      const MainPage(),
      const LogPage(),
      const MyPage(),
    ];
    return Scaffold(
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
            icon: Icon(Icons.note, size: 24),
            label: '로그',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 24),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
