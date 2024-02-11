import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.controller,
    required this.length,
    required this.curIdx,
  });
  final CarouselController controller;
  final int length;
  final int curIdx;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => GestureDetector(
          onTap: () => controller.animateToPage(index),
          child: Container(
            height: 7,
            width: index == curIdx ? 27 : 7,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color:
                  index == curIdx ? SLColor.primary : SLColor.neutral.shade80,
            ),
          ),
        ),
      ),
    );
  }
}
