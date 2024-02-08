import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/blue_bg_container.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/main_title.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/more_button.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/today_contents_widgets/today_program.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_provider.dart';

class SfacProgramSection extends ConsumerWidget {
  const SfacProgramSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var programs = ref.watch(programsProvider).programs;

    if (programs == []) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlueBgContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainTitle(title: '스팩업의 기회, 놓치지 마세요!'),
                MoreButton(onPressed: null),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 175,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.85,
                enlargeCenterPage: true,
              ),
              items: List.generate(programs.length ?? 0, (index) {
                return ProgramCard(
                  data: programs[index],
                  height: 175,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
