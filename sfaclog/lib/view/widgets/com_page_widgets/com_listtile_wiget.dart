import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComTileWiget extends StatelessWidget {
  const ComTileWiget({super.key});

  @override
  Widget build(BuildContext context) {
    double listTileW = 360;
    double listTileH = 174;
    double imgH = 174;
    List<Widget> chipList = [
      SFACTag(
        text: Text(
          '#Port-Fowarding',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
      SFACTag(
        text: Text(
          '#IPTIME',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
      SFACTag(
        text: Text(
          '#창업/수익창출가능',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
    ];
    return SizedBox(
      width: listTileW,
      height: listTileH,
      child: Column(
        children: [
          SizedBox(
              width: listTileW,
              height: imgH,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('💬 3시간전 프레드윰 님의 새로운 답변',
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                height: 0.17)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('IPTIME 포트포워딩',
                            style: SLTextStyle(style: SLStyle.Text_M_Bold)
                                .textStyle),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'NEW',
                          style: SLTextStyle(
                                  color: SLColor.primary.shade90,
                                  style: SLStyle.Text_S_Bold)
                              .textStyle,
                        ),
                      ],
                    ),
                    Text(
                      '안녕하세요 지금 웹을 개발하고 있는데 포트포워딩해서 외부 접속..',
                      style:
                          SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
                    ),
                    SizedBox(
                      height: 10,
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '답변 1',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '🩷 680',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/images/Union (1).png'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '680',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Text(
                          '조회121',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: Color(0xFF333333),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
