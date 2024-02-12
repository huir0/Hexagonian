import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComListTile extends StatelessWidget {
  final VoidCallback? onPressed;
  const ComListTile({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double listTileW = 360;
    double listTileH = 130;
    double imgH = 130;
    List<Widget> chipList = [
      SFACTag(
        text: Text(
          '#프론트엔드',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
      SFACTag(
        text: Text(
          '#네트워킹서비스',
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
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: listTileW,
        height: listTileH,
        child: Column(
          children: [
            SizedBox(
                width: listTileW,
                height: imgH,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'D-21',
                            style: TextStyle(
                              color: Color(0xFFD3265C),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0.08,
                              letterSpacing: -0.16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '|',
                                  style: TextStyle(
                                    color: Color(0xFFB3B3B3),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0.08,
                                    letterSpacing: -0.16,
                                  ),
                                ),
                                TextSpan(
                                  text: '  비대면의료 닥터루시드 팀원 모집',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 0.08,
                                    letterSpacing: -0.16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'NEW',
                            style: TextStyle(
                              color: Color(0xFF196AFF),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 0.11,
                              letterSpacing: -0.12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '안녕하세요 저는 의사입니다. 비대면의료 플랫폼 닥터루시드를\n출시합니다. 본문에 소개 부분을 보여줌',
                        style:
                            SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
                      ),
                      const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Color(0xFF333333),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
