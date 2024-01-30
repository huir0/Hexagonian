import 'package:flutter/material.dart';

class BlueTimeLabel extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  const BlueTimeLabel({
    super.key,
    required this.text,
    required this.width,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: Color(0xFF0059FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.access_alarm_rounded,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
              letterSpacing: -0.42,
            ),
          ),
        ],
      ),
    );
  }
}
