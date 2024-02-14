import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLCircleIconButton extends StatelessWidget {
  const SLCircleIconButton({
    super.key,
    this.onTap,
    this.width = 56,
    this.height = 56,
    this.color,
    this.icon,
    this.assetSvgIcon = 'assets/icons/pencil.svg',
    this.image,
  });

  final double? width;
  final double? height;
  final void Function()? onTap;
  final Color? color;
  final Icon? icon;
  final String? assetSvgIcon;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
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
    if (image != null) {
      return Image.asset(
        image!,
        fit: BoxFit.contain,
      );
    }
    return SvgPicture.asset(
      assetSvgIcon!,
      fit: BoxFit.scaleDown,
    );
  }
}
