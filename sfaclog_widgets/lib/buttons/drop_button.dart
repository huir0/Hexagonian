import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/buttons/greydrop_button.dart';

class Dropbutton extends StatelessWidget {
  final String text1;

  /// 첫번째 글자
  final double width;

  ///편집창의 넓이
  final double height;

  final Color colors;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?>? onChanged;

  ///편집창의 높이
  final VoidCallback? onPressed;
  const Dropbutton({
    super.key,
    required this.text1,
    required this.width,
    this.height = 52,
    this.onPressed,
    required this.colors,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        child: Container(
          decoration: ShapeDecoration(
            color: Color(0xFF333333),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                text1,
                style: TextStyle(
                  color: colors,
                ),
              ),
              SizedBox(
                width: 150,
              ),
              DropdownButton(items: items, onChanged: onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
