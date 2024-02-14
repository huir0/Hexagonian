import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/line_deco_widget.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/log_card_grid_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/sfac_program_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/specup_review_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/top_logger_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/today_contents.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late String username = '김개발';
  late List<dynamic> newLogList = [];
  late List<dynamic> popularLogList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          // shrinkWrap: true,
          children: [
            Column(
              children: [
                const SizedBox(height: 130),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: SLColor.neutral.shade90,
                  ),
                  child: const Column(
                    children: [
                      LineDecoWidget(),
                      TodaysContents(),
                      Divider(),
                      LogCardGridSection(),
                      TopLoggerSection(),
                      SizedBox(height: 32),
                      LogCardGridSection(
                        subject: '#IOS',
                        subtitle: '개발자라면 주목!',
                      ),
                      SpecupReviewSection(),
                      SfacProgramSection(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Headline(username: username),
            ),
          ],
        ),
      ],
    );
  }
}

class Headline extends StatelessWidget {
  const Headline({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, bottom: 35),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //@todo GestureDetector 삭제할것
                GestureDetector(
                  onTap: () {
                    context.push('/login');
                  },
                  child: const Text(
                    '오늘의 스팩업!',
                    style: TextStyle(
                      // style: SLStyle.Heading_M_Bold,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '$username님을 위해 다양한 \n맞춤 콘텐츠를 준비했어요!',
                  style: SLTextStyle(
                    color: Colors.white,
                    style: SLStyle.Text_M_Regular,
                  ).textStyle,
                ),
              ],
            ),
          ),
        ),
        Image.asset('assets/images/character/character_main.png'),
      ],
    );
  }
}
