import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/log_page_widgets/log_card_widget.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/dot_indicator.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';

class TodayLog extends ConsumerStatefulWidget {
  const TodayLog({
    super.key,
  });

  @override
  TodayLogState createState() => TodayLogState();
}

class TodayLogState extends ConsumerState<TodayLog> {
  int curIdx = 0;
  late CarouselController controller;

  @override
  void initState() {
    super.initState();
    controller = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    var popularLogState = ref.watch(logProvider).popularLogModel;

    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.725,
            enlargeCenterPage: true,
            onPageChanged: (val, _) {
              setState(() {
                curIdx = val;
                controller.jumpToPage(val);
              });
            },
          ),
          items: List.generate(popularLogState?.length ?? 0, (index) {
            return InkWell(
                onTap: () {
                  context.push('/log/read/${popularLogState?[index].id}');
                },
                child: LogPageCardWidget(
                  logData: popularLogState?[index],
                ));
          }).toList(),
        ),
        const SizedBox(height: 12),
        DotIndicator(
          curIdx: curIdx,
          controller: controller,
          length: popularLogState?.length ?? 0,
        ),
      ],
    );
  }
}
