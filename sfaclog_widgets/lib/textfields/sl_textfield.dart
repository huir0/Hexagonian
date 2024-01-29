import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SFACTextField extends StatelessWidget {
  /// TextField의 높이
  final double height;

  /// TextField의 너비
  final double width;

  /// TextField의 TextEditingController
  final TextEditingController? controller;

  /// hintText 문자열
  final String hintText;

  /// hintText 색깔
  final Color hintTextColor;

  /// TextField의 오른편 아이콘
  final Icon? suffixIcon;

  /// TextFiled의 border 색변경시 사용
  final BoxBorder? border;

  /// TextFiled 실시간 변경값 체크
  final void Function(String)? onChanged;
  const SFACTextField({
    super.key,
    this.controller,
    required this.height,
    required this.width,
    this.hintText = '',
    this.hintTextColor = const Color(0xFF666666),
    this.border,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: SLColor.neutral,
        border: border,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller,
          cursorColor: SLColor.primary.shade70,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintStyle:
                SLTextStyle(style: SLStyle.Text_S_Medium, color: hintTextColor)
                    .textStyle,
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(bottom: 9, left: 15),
          ),
        ),
      ),
    );
  }
}
