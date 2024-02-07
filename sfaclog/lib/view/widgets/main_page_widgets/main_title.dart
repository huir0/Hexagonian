import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: SLTextStyle(
        style: SLStyle.Heading_S_Bold,
        color: Colors.white,
      ).textStyle,
    );
  }
}
