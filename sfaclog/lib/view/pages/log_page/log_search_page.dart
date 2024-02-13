import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/viewmodel/log_search_viewmodel/log_search_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
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
                    icon: SvgPicture.asset('assets/icons/arrow_back.svg')),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SFACSearchBar(
                    controller: controller,
                    height: 37,
                    width: 285,
                    active: true,
                    onSubmitted: (value) async {
                      List<SFACLogModel> sfaclogList;
                      if (value != '') {
                        sfaclogList = await ref
                            .read(logProvider.notifier)
                            .getLogDataFilter('tag ~ "#$value"');
                      } else {
                        sfaclogList = await ref
                            .read(logProvider.notifier)
                            .getLogDataOrderBy(ref.watch(logProvider).orderBy);
                      }
                      ref.read(logProvider.notifier).setLog(sfaclogList);
                      if (context.mounted) {
                        context.pop();
                      }
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
                              text: Text(
                                '#${state.skillModel![index].name}',
                                style: SLTextStyle(
                                        color: SLColor.neutral.shade60,
                                        style: SLStyle.Text_XS_Medium)
                                    .textStyle,
                              ),
                              onPressed: () async {
                                List<SFACLogModel> sfaclogList = await ref
                                    .read(logProvider.notifier)
                                    .getLogDataFilter(
                                        'tag ~ "#${state.skillModel![index].name}"');
                                ref
                                    .read(logProvider.notifier)
                                    .setLog(sfaclogList);
                                if (context.mounted) {
                                  context.pop();
                                }
                              },
                            );
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
