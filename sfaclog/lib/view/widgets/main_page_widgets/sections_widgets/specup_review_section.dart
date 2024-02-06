import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_card_widget.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/more_button.dart';

class SpecupReviewSection extends StatelessWidget {
  const SpecupReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTitle(title: '스팩업 회고록'),
              MoreButton(onPressed: null),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 242,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const LogPageCardWidget();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
