import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LogReplyAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const LogReplyAppBarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      title: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('댓글'),
          Text('2'),
        ],
      ),
      actions: [
        Container(
          width: 48, // IconButton과 동일한 크기
        ),
      ],
    );
  }
}
