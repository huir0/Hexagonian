import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
              : const Icon(Icons.notifications),
          onPressed: () {
            if (pageLabel == '마이페이지') {
              router.go('/my/setting');
            } else {
    
            print('Noti_Clicked');
            }
          },
        )
      ],
    );
  }
}
