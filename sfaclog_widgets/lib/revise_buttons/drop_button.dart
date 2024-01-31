import 'package:flutter/material.dart';

class applyButton extends StatelessWidget {
  final String text1;

  /// 첫번째 글자
  final double width;

  ///편집창의 넓이
  final double height;

  ///편집창의 높이
  final VoidCallback? onPressed;
  const applyButton(
      {super.key,
      required this.text1,
      required this.width,
      this.height = 43,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: ShapeDecoration(
          color: Color(0xFF0059FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0.10,
                letterSpacing: -0.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
