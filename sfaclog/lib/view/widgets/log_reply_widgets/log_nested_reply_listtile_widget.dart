import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/viewmodel/log_reply_viewmodel/log_reply_notifier.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';

class LogNestedReplyListTileWidget extends ConsumerStatefulWidget {
  final LogReplyModel logReplyModel;
  const LogNestedReplyListTileWidget({super.key, required this.logReplyModel});

  @override
  ConsumerState<LogNestedReplyListTileWidget> createState() =>
      _LogNestedReplyListTileWidgetState();
}

class _LogNestedReplyListTileWidgetState
    extends ConsumerState<LogNestedReplyListTileWidget> {
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
        .getUserInfo(widget.logReplyModel.id!);
    avatarUrl =
        await ref.read(logReplyProvider.notifier).getAvatarUrl(userInfo['id']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 286,
      height: 110,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 286,
              height: 110,
              decoration: ShapeDecoration(
                color: const Color(0xFF020202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
              left: 22,
              top: 53,
              child: SizedBox(
                child: Text(
                  widget.logReplyModel.content,
                  style: SLTextStyle(
                          style: SLStyle.Text_M_Regular,
                          color: SLColor.neutral.shade10)
                      .textStyle,
                ),
              )),
          Positioned(
            top: 5,
            left: 10,
            child: Row(
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
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      widget.logReplyModel.created == null
                          ? Text(
                              DateTime.now().toString().split('.')[0],
                              style: SLTextStyle(
                                      style: SLStyle.Text_XS_Medium,
                                      color: SLColor.neutral.shade50)
                                  .textStyle,
                            )
                          : Text(
                              widget.logReplyModel.created!.split('.')[0],
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
                          child: SvgPicture.asset(
                            'assets/icons/menu_dots.svg',
                            color: SLColor.neutral.shade50,
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
