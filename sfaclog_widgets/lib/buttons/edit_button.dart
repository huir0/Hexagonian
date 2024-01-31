import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;

  /// imagePath: 'assets/images/bookmarkwhite.png'이런식으로 활용,
  final String imagePath;
  final VoidCallback? onPressed;

  const EditButton({
    Key? key,
    required this.text,
    required this.width,
    this.height = 30,
    required this.imagePath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            padding: EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 19,
                  child: Image.asset(imagePath),
                ),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                    letterSpacing: -0.12,
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
