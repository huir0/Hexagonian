import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/tags/sl_tag.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return SFACTag(
      text: Text(
        label,
        style: SLTextStyle(
          color: SLColor.neutral.shade60,
          style: SLStyle.Text_XS_Medium,
        ).textStyle,
      ),
    );
  }
}
