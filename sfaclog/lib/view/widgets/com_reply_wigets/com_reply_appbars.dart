import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class ComReplyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ComReplyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      actions: [
        const Spacer(), // 빈 공간을 추가하여 가운데 정렬을 위해 왼쪽 여백을 만듭니다.
        Text(
          '답변 작성',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ), // 가운데 정렬된 텍스트
        Container(
          width: 100,
        ),
        Text(
          '완료',
          style: TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        Container(
          width: 25,
        ),
      ],
    );
  }
}
