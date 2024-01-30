import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/tags/sl_tag.dart';

class middleokButton extends StatelessWidget {
  final String text1;

  /// 첫번째 글자
  final double width;

  ///편집창의 넓이
  final double height;

  ///편집창의 높이
  final VoidCallback? onPressed;

  ///기능
  const middleokButton({
    super.key,
    required this.text1,
    required this.width,
    this.height = 44,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: ShapeDecoration(
              color: Color(0xFF0059FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                    letterSpacing: -0.14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
