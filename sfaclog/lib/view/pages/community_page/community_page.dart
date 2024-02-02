import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/community_page/card1.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class CommunityPage extends StatelessWidget {
  List<String> itemList = ['1', '2', '3', '4'];
  String selectedOption = optionList[0];
  CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SLTab(
          menu: [
            Text(
              '개발자 Q&A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text('사이드프로젝트'),
          ],
          height: 42,
        ),
        const SizedBox(
          height: 32,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '오늘의 핫한 QNA',
                      style:
                          SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
                    ),
                  ],
                ),
              ),
              comCard(),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.725,
                  enlargeCenterPage: true,
                ),
                items: itemSliders,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
