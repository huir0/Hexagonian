import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/chatting_page/chatting_page.dart';
import 'package:sfaclog/view/pages/community_page/community_page.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/view/widgets/appbar_widget.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

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
        backgroundColor: state.page == 0 ? SLColor.primary : null,
        appBar: AppBarWidget(pageLabel: pagesLabel[state.page]),
        body: pages[state.page],
        floatingActionButton: state.fabVisible
            ? FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: null,
                child: SLCircleIconButton(
                  onTap: () {
                    ref
                        .read(appwrapperProvider.notifier)
                        .handleFabTap(context, state.page);
                  },
                ),
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: SLColor.primary,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.page,
          onTap: (index) {
            ref.read(appwrapperProvider.notifier).pageChanged(index);
            ref.read(appwrapperProvider.notifier).isFabVisible(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home_main.svg',
                color:
                    state.page != 0 ? const Color(0xFF666666) : SLColor.primary,
              ),
              label: pagesLabel[0],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/community_main.svg',
                color:
                    state.page != 1 ? const Color(0xFF666666) : SLColor.primary,
              ),
              label: pagesLabel[1],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/log_main.svg',
                color:
                    state.page != 2 ? const Color(0xFF666666) : SLColor.primary,
              ),
              label: pagesLabel[2],
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/my_main.svg',
                color:
                    state.page != 3 ? const Color(0xFF666666) : SLColor.primary,
              ),
              label: pagesLabel[3].substring(0, 2),
            ),
          ],
        ),
      ),
    );
  }
}
