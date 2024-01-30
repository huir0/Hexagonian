import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

enum ChipsType {
  iconWtext,
  basic,
}

class Chips extends StatelessWidget {
  const Chips({
    super.key,
    this.type = ChipsType.basic,
    required this.text,
    this.isActive = false,
    this.icon,
    this.onTap,
  });
  final ChipsType type;
  final String text;
  final bool isActive;
  final String? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ChipsType.iconWtext:
        return _iconWithTextChips;
      default:
        return _textChips;
    }
  }

  GestureDetector get _textChips {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? SLColor.primary : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              7.5,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: Text(
          text,
          style: SLTextStyle(
            style: SLStyle.Text_XS_Medium,
            color: isActive ? Colors.white : SLColor.neutral.shade60,
          ).style,
        ),
      ),
    );
  }

  GestureDetector get _iconWithTextChips {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62,
        height: 62,
        decoration: BoxDecoration(
          color: isActive ? SLColor.primary : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon!,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : SLColor.neutral.shade60,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              text,
              style: SLTextStyle(
                style: SLStyle.Text_XS_Medium,
                color: isActive ? Colors.white : SLColor.neutral.shade60,
              ).style,
            ),
          ],
        ),
      ),
    );
  }
}
