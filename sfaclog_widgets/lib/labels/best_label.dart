import 'package:flutter/material.dart';

class BestLabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  // height에 기본 값 20.0 설정
  const BestLabel({
    Key? key,
    required this.text,
    required this.width,
    this.height = 20.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height, // height 값을 사용자가 제공한 값이나 기본 값 중 큰 값으로 설정
        padding: EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: Color(0x4C0059FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: -0.42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
