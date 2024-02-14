import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/viewmodel/log_reply_viewmodel/log_reply_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class LogReplyListTileWidget extends ConsumerStatefulWidget {
  final LogReplyModel? reply;
  const LogReplyListTileWidget({
    super.key,
    this.reply,
  });

  @override
  ConsumerState<LogReplyListTileWidget> createState() =>
      _LogReplyListTileWidgetState();
}

class _LogReplyListTileWidgetState
    extends ConsumerState<LogReplyListTileWidget> {
  var userInfo;
  String avatarUrl = '';
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    userInfo = await ref
        .read(logReplyProvider.notifier)
        .getUserInfo(widget.reply!.id!);
    avatarUrl =
        await ref.read(logReplyProvider.notifier).getAvatarUrl(userInfo['id']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logReplyProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.reply == null
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userInfo == null
                      ? const SizedBox()
                      : Row(
                          children: [
                            SvgPicture.network(
                              avatarUrl,
                              height: 30,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(userInfo['nickname']),
                          ],
                        ),
                  Row(
                    children: [
                      widget.reply!.created == null
                          ? Text(
                              DateTime.now().toString().split('.')[0],
                              style: SLTextStyle(
                                      style: SLStyle.Text_XS_Medium,
                                      color: SLColor.neutral.shade50)
                                  .textStyle,
                            )
                          : Text(
                              widget.reply!.created!.split('.')[0],
                              style: SLTextStyle(
                                      style: SLStyle.Text_XS_Medium,
                                      color: SLColor.neutral.shade50)
                                  .textStyle,
                            ),
                      InkWell(
                          onTap: () {
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
                          child: SvgPicture.asset('assets/icons/menu_dots.svg',
                              color: SLColor.neutral.shade50))
                    ],
                  )
                ],
              ),
        const SizedBox(
          height: 12,
        ),
        Text(
          widget.reply!.content,
          style: SLTextStyle(
                  style: SLStyle.Text_M_Medium, color: SLColor.neutral.shade10)
              .textStyle,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                final currentParentId = state.parentReplyId;
                final shouldClear = currentParentId == widget.reply!.id;
                ref
                    .read(logReplyProvider.notifier)
                    .setParentReplyId(shouldClear ? '' : widget.reply!.id!);
              },
              child: Text(
                '답글',
                style: SLTextStyle(
                        style: SLStyle.Text_S_Bold,
                        color: SLColor.neutral.shade50)
                    .textStyle,
              ),
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/heart_red.svg'),
                const SizedBox(
                  width: 4,
                ),
                Text('${widget.reply!.like}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
