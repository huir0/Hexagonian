import 'package:flutter/material.dart';

class LineDecoWidget extends StatelessWidget {
  const LineDecoWidget({
    super.key,
    this.color,
    this.width,
  });
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width ?? 36,
        height: 5,
        margin: const EdgeInsets.only(
          top: 22,
          bottom: 26,
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
      ),
    );
  }
}
