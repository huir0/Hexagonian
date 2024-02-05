// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogListTileWidget extends StatefulWidget {
  final dynamic logData;
  const LogListTileWidget({
    super.key,
    required this.logData,
  });

  @override
  State<LogListTileWidget> createState() => _LogListTileWidgetState();
}

class _LogListTileWidgetState extends State<LogListTileWidget> {
  String? imgUrl;
  List<Widget> chipList = [];
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  SFACLogModel? logModel;
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void didUpdateWidget(LogListTileWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // logData가 변경되었는지 확인합니다.
    if (oldWidget.logData != widget.logData) {
      // logData가 변경된 경우, 데이터 로딩 로직을 재실행합니다.
      _loadData();
    }
  }

  Future<void> _loadData() async {
    logModel = SFACLogModel.fromJson(jsonDecode(widget.logData.toString()));

    String imageUrl =
        await _remoteDataSource.getThumbNailURL('log', logModel!.id, 0);

    chipList = List.generate(
      logModel!.tag.length,
      (index) {
        return SFACTag(
          text: Text(
            logModel!.tag[index],
            style:
                SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
                    .textStyle,
          ),
        );
      },
    );
    if (!mounted) return;
    setState(() {
      imgUrl = imageUrl;
    });
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
                    child: Image.network(
                      imgUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '토스페이먼츠',
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
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 20,
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
                logModel!.category,
                style: SLTextStyle(
                        style: SLStyle.Text_XS_Regular,
                        color: SLColor.neutral.shade50)
                    .textStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  logModel!.title,
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Bold,
                  ).textStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.message, size: 12, color: SLColor.neutral.shade50),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '1',
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
                  Icon(Icons.thumb_up_alt_rounded,
                      size: 12, color: SLColor.neutral.shade50),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '2',
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
