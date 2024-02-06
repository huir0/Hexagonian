import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/blue_bg_container.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/line_deco_widget.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/log_card_grid_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/specup_review_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/sections_widgets/top_logger_section.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/today_contents.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/top_logger_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    late String username = '김개발';
    const String thumbnail = 'https://source.unsplash.com/random';
    const String title = '국비 교육으로 백엔드 개발';

    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: SizedBox(
                width: 154,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '오늘의 스팩업!',
                      style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: Colors.white,
                      ).textStyle,
                    ),
                    Text(
                      '$username님을 위해 다양한 맞춤 콘텐츠를 준비했어요!',
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
        ),
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
              LogCardGridSection(
                subject: '#IOS',
                subtitle: '개발자라면 주목!',
              ),
              SpecupReviewSection(),
            ],
          ),
        ),
        // TextButton(
        //     onPressed: () {
        //       context.push('/login');
        //     },
        //     child: const Text('로그인')),
      ],
    );
  }
}
