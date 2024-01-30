import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/viewmodel/log_search_viewmodel/log_search_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogSearchPage extends ConsumerStatefulWidget {
  const LogSearchPage({super.key});

  @override
  ConsumerState<LogSearchPage> createState() => _LogSearchPageState();
}

class _LogSearchPageState extends ConsumerState<LogSearchPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController txtcontroller = TextEditingController();
  List<SkillModel> skillList = [];
  @override
  void initState() {
    super.initState();
    // "ref"는 StatefulWidget의 모든 생명주기 상에서 사용할 수 있습니다.
    var viewModel = ref.read(logSearchProvider.notifier);
    viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logSearchProvider);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    padding: EdgeInsets.zero, // 패딩 설정
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity.compact, // constraints
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SFACSearchBar(
                    controller: controller,
                    height: 37,
                    width: 285,
                    active: true,
                    onSubmitted: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '최근 검색어',
                        style: SLTextStyle(
                                style: SLStyle.Text_M_Medium,
                                color: Colors.white)
                            .textStyle,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '모두 지우기',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Bold,
                                  color: SLColor.primary)
                              .textStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 115,
                  ),
                  Text(
                    '맞춤형 추천 태그',
                    style: SLTextStyle(
                            style: SLStyle.Text_M_Medium, color: Colors.white)
                        .textStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 320,
                    height: 320,
                    child: Wrap(
                      spacing: 4.0,
                      runSpacing: 0,
                      children: List.generate(
                        state.skillModel != null ? state.skillModel!.length : 0,
                        (index) {
                          if (state.skillModel != null) {
                            return SFACTag(
                              text: '#${state.skillModel![index].name}',
                              textColor: SLColor.neutral.shade60,
                            );
                            // SFACTag(text: state.skillModel![index].name);
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
