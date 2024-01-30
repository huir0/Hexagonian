import 'package:flutter/material.dart';

class BlueLabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback? onPressed; // onPressed 속성 추가

  const BlueLabel({
    Key? key,
    required this.text,
    required this.width,
    this.height = 20,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(4),
        decoration: ShapeDecoration(
          color: Color(0xFF196AFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF196AFF),
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
                fontSize: 10,
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
