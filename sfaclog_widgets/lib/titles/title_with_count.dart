import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class TitleWithCount extends StatelessWidget {
  const TitleWithCount({
    super.key,
    required this.title,
    required this.curIdx,
    required this.total,
  });

  final String title;
  final int curIdx;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: SLTextStyle.Heading_S_Bold,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: curIdx.toString(),
                style: SLTextStyle.Text_M_Regular?.copyWith(
                    color: SLColor.primary),
              ),
              TextSpan(
                text: '/$total',
                style: SLTextStyle.Text_M_Regular?.copyWith(
                    color: SLColor.neutral.shade50),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
