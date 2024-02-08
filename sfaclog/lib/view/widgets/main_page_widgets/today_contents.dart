import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/today_contents_widgets/today_log.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/today_contents_widgets/today_program.dart';
import 'package:sfaclog_widgets/buttons/sl_main_tab_button.dart';

class TodaysContents extends StatefulWidget {
  const TodaysContents({
    super.key,
  });

  @override
  State<TodaysContents> createState() => _TodaysContentsState();
}

class _TodaysContentsState extends State<TodaysContents> {
  int curTab = 0;
  void setTab(int index) {
    setState(() {
      curTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: MainTitle(title: '오늘의 콘텐츠'),
        ),
        const SizedBox(height: 13),
        TabButtons(
          onTab: setTab,
          tabs: [
            TabInfo(type: TabButtonType.log, label: '로그'),
            TabInfo(type: TabButtonType.project, label: '프로젝트'),
            TabInfo(type: TabButtonType.qna, label: '큐앤에이'),
            TabInfo(type: TabButtonType.sfacProgram, label: '스팩프로그램'),
          ],
        ),
        const SizedBox(height: 16),
        IndexedStack(
          key: ValueKey<int>(curTab),
          index: curTab,
          children: const [
            TodayLog(), //로그
            TodayLog(), //프로젝트
            TodayLog(), //큐앤에이
            TodayProgram(), //스팩프로그램
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class TabInfo {
  final TabButtonType type;
  final String label;

  TabInfo({
    required this.type,
    required this.label,
  });
}

class TabButtons extends StatefulWidget {
  const TabButtons({
    super.key,
    required this.tabs,
    required this.onTab,
  });

  final List<TabInfo> tabs;
  final void Function(int) onTab;

  @override
  State<TabButtons> createState() => _TabButtonsState();
}

class _TabButtonsState extends State<TabButtons> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(widget.tabs.length, (index) {
        final tab = widget.tabs[index];
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SLMainTabButton(
            type: tab.type,
            isActive: activeIndex == index,
            onTap: () {
              setState(() {
                activeIndex = index;
                widget.onTab(index);
              });
            },
          ),
        );
      }),
    );
  }
}
