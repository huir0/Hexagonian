import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/pages/community_page/com_sideproject_page.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/card1.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/com_listtile_wiget.dart';

import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class DevelopQnA extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
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
                    (index) => InkWell(
                        onTap: () {
                          context.push('/readqa');
                        },
                        child:
                            comCard()), // Replace comCard() with your card widget
                  ),
                ),
                SizedBox(
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
                    onTap: () {},
                  ),
                ),
                ComTileWiget(),
                ComTileWiget(),
                ComTileWiget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
