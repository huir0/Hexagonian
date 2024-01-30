import 'package:flutter/material.dart';

class applyButton extends StatelessWidget {
  const applyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: 178,
        height: 43,
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
              '지원하기',
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
