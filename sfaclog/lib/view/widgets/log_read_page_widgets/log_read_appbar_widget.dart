import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class LogReadAppBarWidget extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const LogReadAppBarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<LogReadAppBarWidget> createState() =>
      _LogReadAppBarWidgetState();
}

class _LogReadAppBarWidgetState extends ConsumerState<LogReadAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logProvider);
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () async {
          await ref
              .read(logProvider.notifier)
              .getLogDataOrderBy(state.orderBy)
              .then((value) {
            ref.read(logProvider.notifier).setLog(value);
            return null;
          });
          if (context.mounted) {
            context.go('/home');
          }
        },
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      actions: [
        SvgPicture.asset('assets/icons/share.svg'),
        IconButton(
            onPressed: () {
              SLSheet.bottomSheet(
                  context: context,
                  child: Column(children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '신고하기',
                          style: SLTextStyle(
                                  style: SLStyle.Text_L_Bold,
                                  color: Colors.white)
                              .textStyle,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '차단하기',
                          style: SLTextStyle(
                                  style: SLStyle.Text_L_Bold,
                                  color: Colors.white)
                              .textStyle,
                        )),
                  ]),
                  height: 180,
                  width: 360);
            },
            icon: SvgPicture.asset('assets/icons/menu_dots.svg'))
      ],
    );
  }
}
