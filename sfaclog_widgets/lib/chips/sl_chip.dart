import 'package:flutter/material.dart';

class SFACChip extends StatelessWidget {
  /// Chip의 Text
  final String text;

  /// Chip 배경 색
  final Color backgroundColor;

  /// Chip Border 색
  final Color borderColor;

  /// Chip 글자 색
  final Color? textColor;

  ///suffixIcon
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  const SFACChip(
      {super.key,
      required this.text,
      this.backgroundColor = const Color(0xFF0059FF),
      this.borderColor = const Color(0x00000000),
      this.textColor,
      this.suffixIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        backgroundColor: backgroundColor,
        label: SizedBox(
          height: 32,
          child: IntrinsicWidth(
            child: Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                suffixIcon != null ? Icon(suffixIcon) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
