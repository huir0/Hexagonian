import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';

class LogCategoryPage extends ConsumerStatefulWidget {
  const LogCategoryPage({super.key});

  @override
  ConsumerState<LogCategoryPage> createState() => _LogCategoryPageState();
}

class _LogCategoryPageState extends ConsumerState<LogCategoryPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logwriteProvider);

    List<String> categoryList = ['선택 안함', '자유 게시판', '개발자 일상', '회고록'];
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            )),
        title: Text(
          '카테고리 추가',
          style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                var newLogModel = state.logModel!
                    .copyWith(category: categoryList[selectedIndex]);
                ref.read(logwriteProvider.notifier).setLog(newLogModel);
                context.pop();
              },
              child: Text(
                '확인',
                style: SLTextStyle(
                        style: SLStyle.Text_L_Regular, color: Colors.white)
                    .textStyle,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryList[index],
                        style: SLTextStyle(
                                color: selectedIndex == index
                                    ? SLColor.primary
                                    : Colors.white)
                            .textStyle,
                      ),
                      selectedIndex == index
                          ? const Icon(
                              Icons.check,
                              color: SLColor.primary,
                            )
                          : const SizedBox(),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(
                    height: 1,
                  ),
                );
              },
              itemCount: categoryList.length),
        ),
      ),
    );
  }
}
