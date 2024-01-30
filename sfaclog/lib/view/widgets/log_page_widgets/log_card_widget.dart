import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogPageCardWidget extends StatelessWidget {
  const LogPageCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double cardW = 270;
    double cardH = 200;
    double imgH = 105.5;

    List<Widget> chipList = [
      SFACTag(
        backgroundColor: SLColor.neutral.shade90,
        text: '#프론트앤드',
        textColor: Colors.white,
      ),
      SFACTag(
        backgroundColor: SLColor.neutral.shade90,
        text: '#개발자의 삶',
        textColor: Colors.white,
      ),
      SFACTag(
        backgroundColor: SLColor.neutral.shade90,
        text: '#백앤드',
        textColor: Colors.white,
      )
    ];
    return SizedBox(
      width: cardW,
      height: cardH,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: cardW,
                  height: imgH,
                  child: Image.asset(
                    'assets/images/log_cover.png',
                    fit: BoxFit.cover,
                  ),
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
                      icon: const Icon(
                        Icons.favorite_border,
                        size: 20,
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
                      '앱 개발,누구나 할 수 있어요!',
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
                        const Icon(
                          Icons.message,
                          size: 12,
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
                        const Icon(
                          Icons.thumb_up_alt_rounded,
                          size: 12,
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
