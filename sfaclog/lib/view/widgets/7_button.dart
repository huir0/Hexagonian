import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: OkButton3(),
    ),
  );
}

class OkButton3 extends StatelessWidget {
  const OkButton3({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Column(
        children: [
          Container(
            width: 152.50,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
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
        ],
      ),
    );
  }
}
