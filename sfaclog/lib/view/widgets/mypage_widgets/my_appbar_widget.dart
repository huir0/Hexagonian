import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(dynamic) onPressed;
  final String title;
  final List<Widget>? actions;
  const MyAppbar({
    super.key,
    required this.onPressed,
    required this.title,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          onPressed;
          context.pop();
        },
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
      ),
      actions: actions,
    );
  }
}
