import 'package:flutter/widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

class BubbleTooltip extends StatelessWidget {
  const BubbleTooltip({
    super.key,
    required this.tip,
    this.borderRadius = 6.11,
    this.textStyle,
    this.color = const Color(0xff464646),
    this.padding = const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
  });
  final String tip;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: color,
          ),
          padding: padding,
          child: Text(tip,
              style: textStyle ??
                  SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle),
        ),
        CustomPaint(
          painter: Triangle(color),
        ),
      ],
    );
  }
}

class Triangle extends CustomPainter {
  final Color bgColor;

  Triangle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
