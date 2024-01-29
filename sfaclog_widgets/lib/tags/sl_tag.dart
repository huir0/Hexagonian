import 'package:flutter/material.dart';

class SFACTag extends StatelessWidget {
  /// Tag의 Text
  final String text;

  /// Tag 배경 색
  final Color backgroundcolor;

  /// Tag 글자 색
  final Color? textColor;
  const SFACTag(
      {super.key,
      required this.text,
      this.backgroundcolor = const Color(0xFF1A1A1A),
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      height: 22,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
