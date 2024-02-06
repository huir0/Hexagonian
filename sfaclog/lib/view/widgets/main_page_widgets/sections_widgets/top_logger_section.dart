import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/blue_bg_container.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/top_logger_card.dart';

class TopLoggerSection extends StatelessWidget {
  const TopLoggerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlueBgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainTitle(title: '이번달 우수 로거'),
                const SizedBox(height: 4),
                Text(
                  '2023년 1월',
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Regular,
                    color: SLColor.primary.shade30,
                  ).textStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 355,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TopLoggerCard();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16);
              },
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
