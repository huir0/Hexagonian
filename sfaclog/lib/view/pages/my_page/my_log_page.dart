import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/my_page/my_category_page.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_notifier.dart';

import '../../widgets/mypage_log_widgets/mypage_log_card_widget.dart';


class MyLogPage extends ConsumerStatefulWidget {
  const MyLogPage({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  ConsumerState<MyLogPage> createState() => _MyLogPageState();
}

class _MyLogPageState extends ConsumerState<MyLogPage> {
  late String category = '전체 로그';
  bool tiled = false;
  List<dynamic> logList = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      return _init();
    });
  }

  Future<void> _init() async {
    try {
      logList = await ref
          .read(myPageLogProvider.notifier)
          .getUserLogs('7n5leq73rgpoutw');
      ref.read(myPageLogProvider.notifier).setUserLogs(logList);
    } catch (e) {
      print("Error loading logs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final logListState = ref.watch(myPageLogProvider).userLogs;
    return Material(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 12, bottom: 11, left: 25, right: 33),
                width: 360,
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 67,
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MypageCategory()));
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 52,
                              child: Text(
                                category,
                                style: SLTextStyle.Text_M_Medium?.copyWith(
                                    color: SLColor.neutral[10],
                                    letterSpacing: -0.14),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                                width: 9,
                                padding: const EdgeInsets.all(0),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    'assets/icons/arrow_down.svg')),
                          ],
                        ),
                      ),
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
                            for (var i = 0; i < logListState.length; i++)
                              MypageLogSmallCard(log: logListState[i])
                          ],
                        ),
                      )
                    : ListView.separated(
                        itemCount: logListState.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return MypageLogBigCard(
                            log: logListState[index],
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
