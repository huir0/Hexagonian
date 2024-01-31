import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLRectIconButton extends StatelessWidget {
  const SLRectIconButton({
    super.key,
    required this.label,
    this.isActive = false,
    required this.icon,
    this.onTap,
  });
  final String label;
  final bool isActive;
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          color: isActive ? SLColor.primary : SLColor.neutral.shade80,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.white : SLColor.neutral.shade60,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: SLTextStyle.Text_XS_Bold?.copyWith(
                  color: isActive ? Colors.white : SLColor.neutral.shade60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SLRectIconButtonExample extends StatelessWidget {
  const SLRectIconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SLRectIconButton(
      icon: 'assets/icons/log.svg',
      label: 'log',
      isActive: true,
    );
  }
}
