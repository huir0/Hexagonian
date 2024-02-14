import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/com_page_widgets/sideproject_card.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/dot_indicator.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_provider.dart';

class TodayProject extends ConsumerStatefulWidget {
  const TodayProject({
    super.key,
  });

  @override
  TodayProjectState createState() => TodayProjectState();
}

class TodayProjectState extends ConsumerState<TodayProject> {
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
    var programState = ref.watch(programsProvider).programs;

    if (programState.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.725,
            enlargeCenterPage: true,
            onPageChanged: (val, _) {
              curIdx = val;
              controller.jumpToPage(val);
              setState(() {});
            },
          ),
          items: List.generate(
            programState.length ?? 0,
            (index) {
              return const SideProjectCard();
            },
          ).toList(),
        ),
        const SizedBox(height: 12),
        DotIndicator(
          curIdx: curIdx,
          controller: controller,
          length: programState.length ?? 0,
        ),
      ],
    );
  }
}
