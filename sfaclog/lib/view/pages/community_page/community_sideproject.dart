import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/chatting_page/chatting_page.dart';
import 'package:sfaclog/view/pages/community_page/community_page.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/view/widgets/appbar_widget.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/com_listtile_wiget.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/sideproject_card.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_notifier.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComSidePage extends ConsumerWidget {
  ComSidePage({super.key});

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appwrapperProvider);

    List<Widget> pages = <Widget>[
      const MainPage(),
      CommunityPage(),
      const LogPage(),
      const ChattingPage(),
      const MyPage(),
    ];
    List<String> pagesLabel = ['홈', '커뮤니티', '로그', '채팅', '마이페이지'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Pretendard',
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(pageLabel: pagesLabel[state.page]),
          body: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SLTab(
                    menu: [
                      Text('개발자 Q&A'),
                      Text('사이드프로젝트'),
                    ],
                    onTap: (index) {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommunityPage()));
                      } else if (index == 1) {
                        // 다른 동작을 추가할 수 있음
                      }
                    },
                    height: 42,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '마감 임박 프로젝트 ⏰',
                          style: SLTextStyle(style: SLStyle.Heading_S_Bold)
                              .textStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 0.725,
                      enlargeCenterPage: true,
                    ),
                    items: List.generate(
                      5, // Replace with the number of cards you want to display
                      (index) =>
                          SideProjectCard(), // Replace comCard() with your card widget
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '함께할 팀원을 모집해요',
                              style: SLTextStyle(style: SLStyle.Heading_S_Bold)
                                  .textStyle,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset('assets/images/Group.png')
                          ],
                        ),
                        SFACMenuButton(
                          items: optionList,
                          onItemSelected: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SFACSearchBar(
                      height: 37,
                      width: 317,
                      active: false,
                      hintText: '#프론트앤드 #백앤드 #개발자일상',
                      onTap: () {},
                    ),
                  ),
                  reviselabel(
                    width: 57,
                    height: 30,
                    text: '전체',
                    fontSize: 12,
                  )
                ],
              ),
            ),
          ),
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
                icon: const Icon(Icons.chat, size: 24),
                label: pagesLabel[3].substring(0, 2),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.people, size: 24),
                label: pagesLabel[4].substring(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
