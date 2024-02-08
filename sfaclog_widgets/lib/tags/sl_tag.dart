import 'package:flutter/material.dart';

class SFACTag extends StatelessWidget {
  /// Tag의 Text
  final Text text;

  /// Tag 배경 색
  final Color backgroundColor;

  ///suffixIcon
  final Icon? prefixIcon;
  final VoidCallback? onPressed;
  const SFACTag(
      {super.key,
      required this.text,
      this.backgroundColor = const Color(0xFF030303),
      this.prefixIcon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        backgroundColor: backgroundColor,
        label: SizedBox(
          height: 22,
          child: IntrinsicWidth(
            child: Row(
              children: [
                prefixIcon != null
                    ? Row(children: [
                        prefixIcon!,
                        const SizedBox(
                          width: 8,
                        )
                      ])
                    : const SizedBox(),
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
