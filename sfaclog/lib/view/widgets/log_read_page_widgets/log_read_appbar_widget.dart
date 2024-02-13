import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class LogReadAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const LogReadAppBarWidget({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          context.go('/home');
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
