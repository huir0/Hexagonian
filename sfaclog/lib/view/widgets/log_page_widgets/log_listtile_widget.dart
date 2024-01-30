import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogListTileWidget extends StatelessWidget {
  const LogListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double listTileW = 313;
    double listTileH = 257;
    double imgH = 157;
    List<Widget> chipList = [
      SFACTag(
        text: Text(
          '#프론트앤드',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
      SFACTag(
        text: Text(
          '#개발자의삶',
          style: SLTextStyle(color: Colors.white, style: SLStyle.Text_XS_Medium)
              .textStyle,
        ),
      ),
      SFACTag(
        text: Text(
          '#백앤드',
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
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/log_thumbnail_2.png',
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
                '개발자일상',
                style: SLTextStyle(
                        style: SLStyle.Text_XS_Regular,
                        color: SLColor.neutral.shade50)
                    .textStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Text(
                  '개발자가 되고 싶은 이유',
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
