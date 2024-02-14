import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';

import '../router.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String pageLabel;
  const AppBarWidget({
    super.key,
    required this.pageLabel,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    if (pageLabel == '홈') {
      return AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/logo/sfaclog_main.svg',
              width: 100,
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/logo/sfacfolio.svg',
              width: 90,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              print('Noti_Clicked');
            },
            icon: SvgPicture.asset('assets/icons/bell.svg'),
          ),
        ],
      );
    }
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: Image.asset('assets/images/logo_blue.png'),
      title: Text(
        pageLabel,
        style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: pageLabel == '마이페이지'
              ? SvgPicture.asset('assets/icons/setting.svg')
              : SvgPicture.asset(
                  'assets/icons/notification.svg',
                  height: 26,
                ),
          onPressed: () {
            if (pageLabel == '마이페이지') {
              context.push('/my/setting');
            } else {
              print('Noti_Clicked');
            }
          },
        )
      ],
    );
  }
}
