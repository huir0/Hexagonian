import 'package:flutter/material.dart';

class greyOkButton extends StatelessWidget {
  const greyOkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Container(
            width: 315,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 123, vertical: 16),
            decoration: ShapeDecoration(
              color: Color(0xFF333333),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '확인',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF666666),
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
        ),
      ],
    );
  }
}
