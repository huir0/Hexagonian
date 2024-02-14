// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogListTileWidget extends ConsumerStatefulWidget {
  final SFACLogModel logData;
  const LogListTileWidget({
    super.key,
    required this.logData,
  });

  @override
  ConsumerState<LogListTileWidget> createState() => _LogListTileWidgetState();
}

class _LogListTileWidgetState extends ConsumerState<LogListTileWidget> {
  String? imgUrl;
  int replyCnt = 0;
  List<Widget> chipList = [];
  String avatarUrl = '';
  var userInfo;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void didUpdateWidget(LogListTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.logData != widget.logData) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    userInfo =
        await ref.read(logProvider.notifier).getUserInfo(widget.logData.id);
    avatarUrl =
        await ref.read(logProvider.notifier).getAvatarUrl(userInfo['id']);
    imgUrl =
        await ref.read(logProvider.notifier).getThumbNailUrl(widget.logData.id);
    replyCnt =
        await ref.read(logProvider.notifier).getReplyCnt(widget.logData.id);
    chipList = List.generate(
      widget.logData.tag.length,
      (index) {
        return SFACTag(
          text: Text(
            widget.logData.tag[index],
            style:
                SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
                    .textStyle,
          ),
        );
      },
    );
    if (!mounted) return;
    setState(() {});
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    double listTileW = 313;
    double listTileH = 257;
    double imgH = 157;

    return SizedBox(
      width: listTileW,
      height: listTileH,
      child: Column(
        children: [
          SizedBox(
            width: listTileW,
            height: imgH,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: imgUrl != null
                        ? Image.network(
                            imgUrl!,
                            fit: BoxFit.fill,
                          )
                        : Container(
                            color: Colors.grey, // 대체 이미지 또는 색상으로 로딩 상태 표시
                            child: const Center(
                              child: CircularProgressIndicator(), // 로딩 인디케이터
                            ),
                          ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Row(
                    children: [
                      avatarUrl == ''
                          ? const SizedBox()
                          : SvgPicture.network(
                              avatarUrl,
                              height: 20,
                            ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        userInfo?['nickname'] ?? '',
                        style:
                            SLTextStyle(style: SLStyle.Text_M_Medium).textStyle,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      return;
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/bookmark.svg',
                      height: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.logData.category,
                style: SLTextStyle(
                        style: SLStyle.Text_XS_Regular,
                        color: SLColor.neutral.shade50)
                    .textStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  widget.logData.title,
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Bold,
                  ).textStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/reply.svg',
                    height: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '$replyCnt',
                    style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.neutral.shade50)
                        .textStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '|',
                      style: SLTextStyle(
                              style: SLStyle.Text_S_Bold,
                              color: SLColor.neutral.shade50)
                          .textStyle,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/heart.svg',
                    height: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '${widget.logData.like}',
                    style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.neutral.shade50)
                        .textStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 22,
                child: ListView.separated(
                  itemCount: chipList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 4,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return chipList[index];
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
