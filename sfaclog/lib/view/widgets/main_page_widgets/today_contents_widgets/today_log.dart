import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_card_widget.dart';

class TodayLog extends StatelessWidget {
  const TodayLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> itemList = ['1', '2', '3', '4', '5'];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.725,
        enlargeCenterPage: true,
      ),
      items: itemList.map((item) {
        return InkWell(
          onTap: () {
            context.push('/log/read');
          },
          child: const LogPageCardWidget(),
        );
      }).toList(),
    );
  }
}
