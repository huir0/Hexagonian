import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

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
          icon: const Icon(Icons.notifications),
          onPressed: () {
            print('Noti_Clicked');
          },
        )
      ],
    );
  }
}
