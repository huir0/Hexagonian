import 'package:flutter/material.dart';

class reviselabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize; // 추가: fontSize 속성
  final VoidCallback? onPressed;

  const reviselabel({
    Key? key,
    required this.text,
    required this.width,
    this.height = 20,
    this.fontSize = 14, // 변경: fontSize는 필수로 받도록 수정
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: ShapeDecoration(
          color: Color(0xFF196AFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF0059FF),
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
                color: Colors.white,
                fontSize: fontSize, // 변경: fontSize 속성 사용
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
