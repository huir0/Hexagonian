import 'package:flutter/material.dart';

class middleokButton extends StatefulWidget {
  final String text1;
  final String text2;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const middleokButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.width,
    this.height = 43,
    this.onPressed,
  }) : super(key: key);

  @override
  State<middleokButton> createState() => _middleokButtonState();
}

class _middleokButtonState extends State<middleokButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          isPressed = !isPressed;
        });

        // 버튼을 눌렀을 때의 추가 작업
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: ShapeDecoration(
              color: isPressed ? Color(0xFFCCDDFF) : Color(0xFFE5EEFF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isPressed ? widget.text2 : widget.text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isPressed ? Color(0xFF7FACFF) : Color(0xFF0059FF),
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
