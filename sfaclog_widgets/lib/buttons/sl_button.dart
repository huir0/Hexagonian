import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLButton extends StatelessWidget {
  const SLButton({
    super.key,
    required this.text,
    this.isActive = false,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.textStyle,
  });
  final String text;
  final bool isActive;
  final String? icon;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isActive ? SLColor.primary : SLColor.neutral.shade80,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        alignment: Alignment.center,
        padding: padding,
        child: Text(
          text,
          style: textStyle ??
              SLTextStyle.Text_M_Bold?.copyWith(
                color: SLColor.neutral.shade20,
              ),
        ),
      ),
    );
  }
}

class SLButtonExample extends StatefulWidget {
  const SLButtonExample({super.key});

  @override
  State<SLButtonExample> createState() => _SLButtonExampleState();
}

class _SLButtonExampleState extends State<SLButtonExample> {
  bool isValid = false;

  void onTap() {
    isValid = !isValid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SLButton(
        text: '다음',
        isActive: isValid,
        onTap: onTap,
      ),
    );
  }
}
