// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogPageCardWidget extends StatefulWidget {
  final SFACLogModel logData;
  const LogPageCardWidget({
    super.key,
    required this.logData,
  });

  @override
  State<LogPageCardWidget> createState() => _LogPageCardWidgetState();
}

class _LogPageCardWidgetState extends State<LogPageCardWidget> {
  String? imgUrl;
  List<Widget> chipList = [];
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String imageUrl =
        await _remoteDataSource.getThumbNailURL('log', widget.logData.id, 0);
    chipList = List.generate(
      widget.logData.tag.length,
      (index) {
        return SFACTag(
          backgroundColor: SLColor.neutral.shade90,
          text: Text(
            widget.logData.tag[index],
            style:
                SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
                    .textStyle,
          ),
        );
      },
    );
    setState(() {
      imgUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardW = 270;
    double cardH = 200;
    double imgH = 105.5;

    return SizedBox(
      width: cardW,
      height: cardH,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                SizedBox(
                  width: cardW,
                  height: imgH,
                  child: imgUrl != null
                      ? Image.network(
                          imgUrl!,
                          fit: BoxFit.cover,
                        )
                      : const CircularProgressIndicator(),
                ),
                Positioned(
                  left: 16,
                  top: 14,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 14,
                      ),
                      Text(
                        '박스팩',
                        style:
                            SLTextStyle(style: SLStyle.Text_M_Medium).textStyle,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
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
                ),
                Positioned(
                  left: 16,
                  bottom: 8,
                  child: SizedBox(
                    height: 28,
                    width: 270,
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
                )
              ],
            ),
            Container(
              height: cardH - imgH,
              color: SLColor.neutral.shade80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.logData.title,
                      style: SLTextStyle(style: SLStyle.Text_L_Bold).textStyle,
                    ),
                    RichText(
                      text: TextSpan(
                          style: SLTextStyle(style: SLStyle.Text_XS_Regular)
                              .textStyle,
                          text:
                              '개발이라는 분야가 생소하고 어렵게 느껴지지만 사실 어쩌구저쩌구 해서 개발은 누구나 도전할 수 있는 그런 분야'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                          '1',
                          style:
                              SLTextStyle(style: SLStyle.Text_S_Bold).textStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '|',
                            style: SLTextStyle(style: SLStyle.Text_S_Bold)
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
                          '2',
                          style:
                              SLTextStyle(style: SLStyle.Text_S_Bold).textStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
