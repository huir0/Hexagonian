import 'package:flutter/material.dart';

class NoButton extends StatefulWidget {
  const NoButton({
    Key? key,
    this.backgroundColor,
    this.text,
    this.textColor,
    this.textStyle,
    this.image,
  }) : super(key: key);

  final Color? backgroundColor;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Image? image;

  @override
  _NoButtonState createState() => _NoButtonState();
}

class _NoButtonState extends State<NoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Container(
        decoration: ShapeDecoration(
          color: _isPressed
              ? (widget.backgroundColor ?? Color(0xFF0059FF))
              : (widget.backgroundColor ?? Color(0xFF333333)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        width: 312,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
            ),
            Container(
              width: 33,
              height: 33,
              color: widget.image?.color,
              child: widget.image ?? Image.asset('assets/images/no.png'),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
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