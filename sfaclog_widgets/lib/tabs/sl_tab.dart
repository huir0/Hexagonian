import 'package:flutter/material.dart';
import '../util/common.dart';

class SLTab extends StatefulWidget {
  const SLTab(
      {super.key,
      required this.menu,
      this.focusedColor,
      this.width,
      required this.height,
      this.backgroundColor,
      this.borderColor,
      this.borderBottom,
      this.borderWidth = 2,
      this.onTap,
      this.physics,
      this.menuTextStyle,
      this.defaultMenuTextColor = const Color(0xff666666),
      this.horizontalMargin = 0});
  final List<Widget?> menu;
  final Color? focusedColor;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderSide? borderBottom;
  final double borderWidth;
  final Function(int)? onTap;
  final ScrollPhysics? physics;
  final TextStyle? menuTextStyle;
  final Color? defaultMenuTextColor;
  /// 탭바 옆에 공간을 주고 싶을 경우 설정
  final double horizontalMargin;
  @override
  State<SLTab> createState() => _SLTabState();
}

class _SLTabState extends State<SLTab> {
  int focused = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      width: widget.width,
      height: widget.height,
      child: ListView.builder(
        physics: widget.physics ?? const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.menu.length,
        itemBuilder: ((context, index) {
          Widget? menuText;
          TextStyle? menuStyle;
          menuStyle = widget.menuTextStyle ??
              SLTextStyle.Text_M_Bold?.copyWith(
                fontFamily: 'Pretendard',
                  color: focused == index
                      ? widget.focusedColor ?? SLColor.primary[100]
                      : widget.defaultMenuTextColor) ??
              const TextStyle();
          menuText = AnimatedDefaultTextStyle(
              style: menuStyle,
              duration: kThemeChangeDuration,
              child: widget.menu[index]!);
          return GestureDetector(
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!(index);
              }
              setState(() {
                focused = index;
              });
            },
            child: Container(
              width: widget.width != null
                  ? (widget.width! - (widget.horizontalMargin * 2)) / widget.menu.length
                  : (MediaQuery.of(context).size.width -
                          (widget.horizontalMargin * 2)) /
                      widget.menu.length,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                border: Border(
                  bottom: focused == index
                      ? widget.borderBottom ??
                          BorderSide(
                              color: widget.borderColor ?? SLColor.primary,
                              width: widget.borderWidth)
                      : BorderSide.none,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    focused != index
                        ? const SizedBox()
                        : SizedBox(
                            height: widget.borderBottom != null ||
                                    widget.borderBottom != BorderSide.none
                                ? widget.borderWidth
                                : null,
                          ),
                    menuText
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
