import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/card1.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/com_listtile_wiget.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/qna_provider.dart';

import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class DevelopQnA extends ConsumerStatefulWidget {
  const DevelopQnA({super.key});

  @override
  ConsumerState<DevelopQnA> createState() => _DevelopQnAState();
}

class _DevelopQnAState extends ConsumerState<DevelopQnA> {
  int curIdx = 0;
  late CarouselController controller;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        return _initQnaData();
      },
    );
    controller = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
    controller = CarouselController();
  }

  Future<void> _initQnaData() async {
    await ref.read(qnaProvider.notifier).getAllQna();
  }

  @override
  Widget build(BuildContext context) {
    var qnaState = ref.watch(qnaProvider);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '오늘의 핫한 QNA 💡',
                        style: SLTextStyle(style: SLStyle.Heading_S_Bold)
                            .textStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.725,
                    enlargeCenterPage: true,
                  ),
                  items: List.generate(
                    5,
                    (index) => const InkWell(
                      child: comCard(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '관심주제 설정하기 ✨',
                        style: SLTextStyle(style: SLStyle.Heading_S_Bold)
                            .textStyle,
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
                    onTap: () {
                      context.push('/comsearch');
                    },
                  ),
                ),
                qnaState.allQnaList.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5, //@todo: 무한스크롤
                        itemBuilder: (context, index) {
                          final data = qnaState.allQnaList[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/qna/${data.id}');
                            },
                            child: ComTileWiget(
                              qnaData: data,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Color(0xFF333333),
                          );
                        },
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LogSearchBarWidget extends StatelessWidget {
  const LogSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double searchBarW = 317;
    double searchBarH = 37;
    bool active = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: searchBarW,
        height: searchBarH,
        decoration: const BoxDecoration(
          color: SLColor.neutral,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          width: searchBarW,
          child: TextField(
            cursorColor: SLColor.primary.shade70,
            onTap: () {
              active ? null : print('NotActive');
            },
            readOnly: !active,
            decoration: InputDecoration(
              hintStyle: SLTextStyle(
                      style: SLStyle.Text_S_Medium,
                      color: SLColor.neutral.shade60)
                  .textStyle,
              hintText: '#프론트앤드 #백앤드 #개발자일상',
              suffixIcon: const Icon(
                Icons.search,
                color: SLColor.primary,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(bottom: 9, left: 15),
            ),
          ),
        ),
      ),
    );
  }
}
