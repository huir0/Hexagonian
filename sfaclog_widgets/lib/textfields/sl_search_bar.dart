import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SFACSearchBar extends StatelessWidget {
  ///SearchBar의 높이
  final double height;

  ///SearchBar의 너비
  final double width;

  ///SearchBar의 활성화 유무
  ///
  ///false일 경우 readOnly가 true가 되어 textEdit 기능을 하지 않음
  final bool active;
  final InputBorder? focusedBorder;

  ///SearchBar Tap시 실행 함수
  ///
  ///active가 false일 때만 작동하며, pageNavigate를 위해 사용
  final VoidCallback? onTap;

  /// SearchBar의 TextEditingController
  final TextEditingController? controller;

  /// hintText 문자열
  final String hintText;

  /// hintText 색깔
  final Color hintTextColor;

  /// 돋보기 아이콘 색깔
  final Color suffixIconColor;

  /// SearchBar의 border 색 변경시 사용
  final BoxBorder? border;

  /// SearchBar Text 입력 후 Enter 누를시 실행 함수
  final void Function(String)? onSubmitted;
  const SFACSearchBar({
    super.key,
    this.active = true,
    this.controller,
    required this.height,
    required this.width,
    this.hintText = '',
    this.suffixIconColor = const Color(0xFF0059FF),
    this.hintTextColor = const Color(0xFF666666),
    this.onTap,
    this.border,
    this.onSubmitted,
    this.focusedBorder,
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
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
          onTap: () {
            active ? null : onTap?.call();
          },
          readOnly: !active,
          decoration: InputDecoration(
            hintStyle:
                SLTextStyle(style: SLStyle.Text_S_Medium, color: hintTextColor)
                    .textStyle,
            hintText: hintText,
            suffixIcon: Icon(
              Icons.search,
              color: suffixIconColor,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(bottom: 9, left: 15),
            focusedBorder: focusedBorder,
          ),
        ),
      ),
    );
  }
}
