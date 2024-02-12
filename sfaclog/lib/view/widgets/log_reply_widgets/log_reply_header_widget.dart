import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/viewmodel/log_read_viewmodel/log_read_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';

class LogReplyAppBarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  final int replyCnt;
  const LogReplyAppBarWidget({super.key, required this.replyCnt});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(logReadProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.pop(replyCnt);
        },
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('댓글'),
          Text('$replyCnt'),
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
