import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class NoButton extends StatefulWidget {
  const NoButton({
    super.key,
    this.backgroundColor,
    this.text,
    this.textColor,
    this.textStyle,
    this.image,
    required this.onPressed,
    required this.isPressed,
  });

  final Color? backgroundColor;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Image? image;
  final VoidCallback onPressed;
  final bool isPressed;

  @override
  State<NoButton> createState() => _NoButtonState();
}

class _NoButtonState extends State<NoButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        decoration: ShapeDecoration(
          color: widget.isPressed == true
              ? SLColor.primary
              : SLColor.neutral.shade80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        width: 312,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 40,
            ),
            Container(
              width: 33,
              height: 33,
              color: widget.image?.color,
              child: widget.image ?? Image.asset('assets/images/no.png'),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 168,
              height: 21,
              child: Text(
                widget.text ?? '두 제안 모두 관심 없어요',
                style: widget.textStyle ??
                    TextStyle(
                      color: widget.textColor ?? Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


///예시!
// NoButton(
//   backgroundColor: Colors.red, // 배경 색상 설정
//   text: '내가 원하는 텍스트',
//   textColor: Colors.black, // 텍스트 색상 설정
//   textStyle: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
//   image: Image.asset('assets/images/custom_image.png'), // 이미지 설정
// )