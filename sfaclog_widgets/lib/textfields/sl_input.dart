import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

enum SLInputBorderType {
  outline,
  underline,
}

class SLInput extends StatefulWidget {
  const SLInput({
    super.key,
    this.hintText,
    this.icon,
    this.buttonText,
    this.controller,
    this.borderColor,
    this.hintStyle,
    this.fillColor,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
    this.border,
    this.maxLength,
    this.borderRadius = 10,
    this.borderType = SLInputBorderType.outline,
    this.isCenteredText = false,
    this.contentPadding,
    this.counterStyle,
    this.suffix,
  });
  final String? hintText;
  final TextStyle? hintStyle;
  final String? icon;
  final String? buttonText;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? fillColor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final InputBorder? border;
  final int? maxLength;
  final double borderRadius;
  final SLInputBorderType borderType;
  final bool? isCenteredText;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? counterStyle;
  final Widget? suffix;

  @override
  State<SLInput> createState() => _SLInputState();
}

class _SLInputState extends State<SLInput> {
  @override
  Widget build(BuildContext context) {
    InputBorder? inputBorder;
    InputBorder? inputErrorBorder;

    Color getBorderColor() {
      if (widget.borderColor != null) {
        return widget.borderColor!;
      }
      return SLColor.neutral.shade70;
    }

    switch (widget.borderType) {
      case SLInputBorderType.outline:
        inputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: BorderSide(
            color: getBorderColor(),
          ),
        );
        break;
      case SLInputBorderType.underline:
        inputBorder = UnderlineInputBorder(
          borderSide: BorderSide(
            color: getBorderColor(),
          ),
        );
        break;
    }

    switch (widget.borderType) {
      case SLInputBorderType.outline:
        inputErrorBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius),
          ),
          borderSide: const BorderSide(
            color: SLColor.warning,
          ),
        );
        break;
      case SLInputBorderType.underline:
        inputErrorBorder = const UnderlineInputBorder(
          borderSide: BorderSide(
            color: SLColor.warning,
          ),
        );
        break;
    }

    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: SLTextStyle.Text_M_Regular,
      textAlign:
          widget.isCenteredText == true ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        suffixIcon: widget.suffix,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 9.5),
        // hint style
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            SLTextStyle.Text_M_Regular?.copyWith(
              color: SLColor.neutral.shade60,
            ),
        // fill
        fillColor: widget.borderType == SLInputBorderType.outline
            ? SLColor.neutral
            : null,
        filled: widget.borderType == SLInputBorderType.outline,
        // border style
        border: inputBorder,
        enabledBorder: inputBorder,
        // counter
        counterText: widget.maxLength != null
            ? '${widget.controller!.text.length}/${widget.maxLength} 자'
            : null,
        counterStyle: widget.counterStyle ??
            SLTextStyle.Text_S_Regular?.copyWith(
              color: SLColor.neutral.shade50,
            ),
        // error style
        errorBorder: inputErrorBorder,
        focusedErrorBorder: inputErrorBorder,
        errorStyle: SLTextStyle.Text_S_Regular?.copyWith(
          color: SLColor.warning,
        ),
      ),
      validator: widget.validator,
    );
  }
}
