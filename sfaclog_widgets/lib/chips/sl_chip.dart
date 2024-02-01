import 'package:flutter/material.dart';

class SFACChip extends StatelessWidget {
  /// Chip의 Text
  final Text text;

  /// Chip 배경 색
  final Color backgroundColor;

  /// Chip Border 색
  final Color borderColor;

  ///suffixIcon
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  const SFACChip(
      {super.key,
      required this.text,
      this.backgroundColor = const Color(0xFF0059FF),
      this.borderColor = const Color(0x00000000),
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
                text,
                suffixIcon != null ? Icon(suffixIcon) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SFACSkillChip extends StatelessWidget {
  /// Chip의 Text
  final Text text;

  /// Chip 배경 색
  final Color backgroundColor;

  /// Chip Border 색
  final Color borderColor;

  ///suffixIcon
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final double? height;
  final EdgeInsets? padding;
  const SFACSkillChip({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFF0059FF),
    this.borderColor = const Color(0x00000000),
    this.suffixIcon,
    this.onPressed,
    this.height,
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: height,
        child: Chip(
          padding: padding,
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(100))),
          backgroundColor: backgroundColor,
          label: IntrinsicWidth(
            child: Row(
              children: [
                text,
                suffixIcon != null ? Icon(suffixIcon) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
