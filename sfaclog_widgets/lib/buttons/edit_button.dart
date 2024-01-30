import 'package:flutter/material.dart';

class editButton extends StatelessWidget {
  final String text1;

  /// 첫번째 글자
  final double width;

  ///편집창의 넓이
  final double height;

  ///편집창의 높이
  final VoidCallback? onPressed;

  ///기능

  const editButton({
    super.key,
    required this.text1,
    required this.width,
    this.height = 30,
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
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 7),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFF1A1A1A),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 9.66,
                        height: 9.70,
                        child: Image.asset('assets/images/whitepen.png'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        text1,
                        style: TextStyle(
                          color: Color(0xFFE6E6E6),
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0.11,
                          letterSpacing: -0.12,
                        ),
                      ),
                    ],
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
