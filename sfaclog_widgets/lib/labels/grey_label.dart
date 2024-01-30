import 'package:flutter/material.dart';

class GrayLabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  const GrayLabel({
    super.key,
    required this.text,
    required this.width,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: height,
        width: width, // 받아온 너비 값으로 설정
        padding: EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: Color(0xFF666666),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
