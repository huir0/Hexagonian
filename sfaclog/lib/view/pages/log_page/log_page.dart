import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_card_widget.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_listtile_widget.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

enum OptionList { created, like }

class LogPage extends ConsumerStatefulWidget {
  const LogPage({super.key});

  @override
  ConsumerState<LogPage> createState() => _LogPageState();
}

bool isVerifiedEmail = false;

List<String> itemList = ['1', '2', '3'];
var optionList = ['등록순', '추천순'];
String selectedOption = optionList[0];

class _LogPageState extends ConsumerState<LogPage> {
  List<dynamic> popularLogList = [];
  List<dynamic> newLogList = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        return _init();
      },
    );
  }

  Future<void> _init() async {
    try {
      popularLogList = await ref.read(logProvider.notifier).getPopularLog();

      newLogList =
          await ref.read(logProvider.notifier).getLogDataOrderBy('-created');
      ref.read(logProvider.notifier).setPopularLog(popularLogList);
      ref.read(logProvider.notifier).setLog(newLogList);
    } catch (error) {
      // 에러 처리 로직 추가
      print("Error loading popular logs: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var popularLogState = ref.watch(logProvider).popularLogModel;
    var logModelListState = ref.watch(logProvider).logModelList;

    return ListView(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '개발자 인기글',
            style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        popularLogList.isNotEmpty
            ? CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.725,
                  enlargeCenterPage: true,
                ),
                items: List.generate(popularLogState!.length, (index) {
                  return InkWell(
                      onTap: () {
                        context.push('/log/read/${popularLogState[index].id}');
                      },
                      child: LogPageCardWidget(
                        logData: popularLogState[index],
                      ));
                }).toList(),
              )
            : const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 16,
            left: 24,
            right: 24,
          ),
          child: Text(
            '새로운 로그를 살펴봐요',
            style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
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
              context.push('/log/search');
            },
          ),
        ),
        logModelListState!.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '총 ${logModelListState.length} 로그',
                      style:
                          SLTextStyle(style: SLStyle.Text_M_Medium).textStyle,
                    ),
                    SFACMenuButton(
                      items: optionList,
                      onItemSelected: (value) async {
                        String orderBy = value == '등록순' ? '-created' : '-like';
                        List<dynamic>? logData = await ref
                            .read(logProvider.notifier)
                            .getLogDataOrderBy(orderBy);
                        ref.read(logProvider.notifier).setLog(logData);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        logModelListState.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: logModelListState.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .push('/log/read/${logModelListState[index].id}');
                      },
                      child: LogListTileWidget(
                        logData: logModelListState[index],
                      ),
                    );
                  },
                ),
              )
            : const CircularProgressIndicator()
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
