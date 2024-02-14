import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/pages/my_page/my_category_page.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import '../../../viewmodel/my_log_viewmodel/my_log_notifier.dart';
import '../../widgets/mypage_log_widgets/mypage_log_card_widget.dart';

class MyBookmarkPage extends ConsumerStatefulWidget {
  const MyBookmarkPage({
    super.key,
    required this.userInfo,
  });
  final dynamic userInfo;
  @override
  ConsumerState<MyBookmarkPage> createState() => _MyBookmarkPageState();
}

class _MyBookmarkPageState extends ConsumerState<MyBookmarkPage> {
  bool tiled = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    try {
      var newLogList = await ref
          .read(myPageLogProvider.notifier)
          .getBookmaredLogs(widget.userInfo['id']);
      newLogList.sort((a, b) =>
          DateTime.parse(b.created).compareTo(DateTime.parse(a.created)));

      ref.read(myPageLogProvider.notifier).setBookmarkedLogs(newLogList);
    } catch (e) {
      print("Error loading popular logs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> logList = ref.watch(myPageLogProvider).bookmarkedLogs;
    return Material(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 11, left: 25, right: 33),
                width: 360,
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 67,
                      padding: const EdgeInsets.all(0),
                      child: SFACMenuButton(
                          items: const ['등록순', '최신순'],
                          onItemSelected: (value) {
                            if (value != 0) {
                              logList.sort((a, b) =>
                                  DateTime.parse(b.created).compareTo(
                                      DateTime.parse(a.created)));
                            } else {
                              logList.sort((a, b) =>
                                  DateTime.parse(a.created).compareTo(
                                      DateTime.parse(b.created)));
                            }
                            setState(() {
                              ref
                                  .read(myPageLogProvider.notifier)
                                  .setBookmarkedLogs(logList);
                            });
                          }),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 15,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tiled = false;
                          });
                        },
                        child: SvgPicture.asset(tiled
                            ? 'assets/icons/menu_burger_off.svg'
                            : 'assets/icons/menu_burger_on.svg'),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 15,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tiled = true;
                          });
                        },
                        child: SvgPicture.asset(tiled
                            ? 'assets/icons/menu_tile_on.svg'
                            : 'assets/icons/menu_tile_off.svg'),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              // logcard
              Container(
                width: 360,
                height: 480,
                padding: tiled
                    ? const EdgeInsets.symmetric(horizontal: 24)
                    : EdgeInsets.zero,
                child: tiled
                    ? SingleChildScrollView(
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 24,
                          children: [
                            for (var i = 0; i < logList.length; i++)
                              MypageLogSmallCard(
                                log: logList[i],
                                bookmarked: true,
                              )
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: logList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.push('/log/read/${logList[index].id}');
                            },
                            child: MypageLogBigCard(
                              log: logList[index],
                              bookmarked: true,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
