import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/com_listtile_wiget.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/sideproject_card.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComSidePage extends StatefulWidget {
  const ComSidePage({super.key});

  @override
  State<ComSidePage> createState() => _ComSidePageState();
}

class _ComSidePageState extends State<ComSidePage> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Pretendard',
        ),
        home: SafeArea(
          child: Scaffold(
            body: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SLTab(
                      menu: [
                        Text('개발자 Q&A'),
                        Text('사이드프로젝트'),
                      ],
                      height: 42,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '마감 임박 프로젝트 ⏰',
                            style: SLTextStyle(style: SLStyle.Heading_S_Bold)
                                .textStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.725,
                        enlargeCenterPage: true,
                      ),
                      items: List.generate(
                        5, // Replace with the number of cards you want to display
                        (index) =>
                            SideProjectCard(), // Replace comCard() with your card widget
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '함께할 팀원을 모집해요',
                                style:
                                    SLTextStyle(style: SLStyle.Heading_S_Bold)
                                        .textStyle,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset('assets/images/Group.png')
                            ],
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
                        onTap: () {},
                      ),
                    ),
                    reviselabel(
                      width: 57,
                      height: 30,
                      text: '전체',
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
