import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class ComReadAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ComReadAppBarWidget({super.key});
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
        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      actions: [
        const Icon(Icons.share),
        IconButton(
            onPressed: () {
              SLSheet.bottomSheet(
                  context: context,
                  child: Column(children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '삭제하기',
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
            icon: const Icon(Icons.more_vert_outlined))
      ],
    );
  }
}
