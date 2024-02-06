import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            '더보기',
            style: SLTextStyle(
              style: SLStyle.Text_S_Medium,
              color: SLColor.neutral.shade20,
            ).textStyle,
          ),
          Icon(
            Icons.navigate_next,
            color: SLColor.neutral.shade20,
          ),
        ],
      ),
    );
  }
}
