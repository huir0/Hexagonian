import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/textfields/sl_input.dart';
import 'package:sfaclog_widgets/util/common.dart';

class InputWithTextButton extends StatelessWidget {
  const InputWithTextButton({
    super.key,
    required this.controller,
    this.hintText = '댓글을 입력하세요.',
    this.onPressed,
    this.buttonText = '등록',
    this.buttonTextStyle,
  });
  final TextEditingController controller;
  final String? hintText;
  final void Function()? onPressed;
  final String buttonText;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return SLInput(
      controller: controller,
      hintText: hintText,
      suffix: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: buttonTextStyle ??
              SLTextStyle.Text_M_Bold?.copyWith(
                color: SLColor.neutral.shade10,
              ),
        ),
      ),
    );
  }
}
