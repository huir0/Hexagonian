import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class ButtonSm extends StatelessWidget {
  const ButtonSm({
    super.key,
    required this.text,
    this.isActive = false,
    this.icon,
    this.onTap,
  });
  final String text;
  final bool isActive;
  final String? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? SLColor.primary : SLColor.neutral.shade80,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Text(
          text,
          style: SLTextStyle.Text_XS_Bold?.copyWith(
            color: SLColor.neutral.shade20,
          ),
        ),
      ),
    );
  }
}

class ButtonSmExample extends StatefulWidget {
  const ButtonSmExample({super.key});

  @override
  State<ButtonSmExample> createState() => _ButtonSmExampleState();
}

class _ButtonSmExampleState extends State<ButtonSmExample> {
  bool isFollow = false;

  void toggleFollow() {
    isFollow = !isFollow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonSm(
        text: isFollow ? '팔로잉' : '팔로우',
        isActive: isFollow,
        onTap: toggleFollow,
      ),
    );
  }
}
