import 'package:flutter/material.dart';

class bookmarkButton extends StatelessWidget {
  const bookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 43,
      padding: EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF0059FF)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/bookmarkwhite.png'),
          const SizedBox(width: 10),
          Text(
            '북마크',
            style: TextStyle(
              color: Color(0xFF0059FF),
              fontSize: 15,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0.10,
              letterSpacing: -0.45,
            ),
          ),
        ],
      ),
    );
  }
}
