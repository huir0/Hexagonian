import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLIconButton extends StatelessWidget {
  const SLIconButton({
    super.key,
    this.onTap,
    this.width = 56,
    this.height = 56,
    this.color,
    this.icon,
    this.assetSvgIcon = 'assets/icons/pencil.svg',
  });

  final double? width;
  final double? height;
  final void Function()? onTap;
  final Color? color;
  final Icon? icon;
  final String? assetSvgIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? SLColor.primary.shade90,
          shape: BoxShape.circle,
        ),
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    if (icon != null) {
      return icon!;
    }
    return SvgPicture.asset(
      assetSvgIcon!,
      fit: BoxFit.scaleDown,
    );
  }
}
