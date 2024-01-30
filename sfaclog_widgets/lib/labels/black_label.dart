import 'package:flutter/material.dart';

class BlackLabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  const BlackLabel({
    super.key,
    required this.text,
    required this.width,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: ShapeDecoration(
            color: Color(0xFF020202),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFF999999),
              ),
              borderRadius: BorderRadius.circular(20),
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
                  color: Color(0xFFCCCCCC),
                  fontSize: 9,
                  fontFamily: 'prtendard',
                  fontWeight: FontWeight.w400,
                  height: 0.14,
                  letterSpacing: -0.10,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
