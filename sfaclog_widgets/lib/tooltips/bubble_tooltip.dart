import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

class BubbleTooltip extends StatelessWidget {
  const BubbleTooltip({
    super.key,
    required this.tip,
    this.borderRadius = 6.11,
    this.textStyle,
    this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
    this.left = 0,
    this.top,
    this.right = 0,
    this.bottom = -6,
  });
  final String tip;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color ?? SLColor.neutral.shade70,
          ),
          padding: padding,
          child: Text(tip,
              style: textStyle ??
                  SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle),
        ),
        Positioned(
          top: top,
          bottom: bottom,
          right: right,
          left: left,
          child: SvgPicture.asset(
            'assets/icons/polygon.svg',
            colorFilter: ColorFilter.mode(
              color ?? SLColor.neutral.shade70,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
