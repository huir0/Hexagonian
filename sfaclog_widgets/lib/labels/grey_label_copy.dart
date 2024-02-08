import 'package:flutter/material.dart';

class GrayLabel1 extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color fontColor;

  final VoidCallback? onPressed;

  const GrayLabel1(
      {super.key,
      required this.text,
      required this.width,
      this.height = 24,
      this.onPressed,
      this.fontColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          color: Color(0xFF666666),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF666666),
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: fontColor,
                fontSize: 10,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0.14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
