import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class MypageLogBigCard extends StatelessWidget {
  const MypageLogBigCard({
    super.key,
    required this.log,
  });
  final Map<String, dynamic> log;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 23),
      width: 360,
      height: 259,
      child: Column(
        children: [
          Container(
            width: 313,
            height: 157,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  log['image'],
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 12,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 18,
                    width: 18,
                    child: Image.asset(log['profile_picture']),
                  ),
                ),
                Positioned(
                  left: 34.82,
                  top: 10,
                  child: Text(
                    log['author'],
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 11,
                  child: SvgPicture.asset('assets/icons/bookmark_outline.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 14,
            child: Text(
              log['category'],
              style: SLTextStyle.Text_XS_Regular?.copyWith(
                  color: SLColor.neutral[50]),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 19,
            child: Text(
              log['title'],
              style: SLTextStyle.Text_M_Bold?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 16,
            width: 313,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/chat_grey.svg'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  log['answer'].length.toString(),
                  style: SLTextStyle.Text_S_Bold?.copyWith(
                    color: SLColor.neutral[50],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '|',
                  style: SLTextStyle.Text_S_Bold?.copyWith(
                    color: SLColor.neutral[50],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/icons/heart.svg'),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  log['like'].length.toString(),
                  style: SLTextStyle.Text_S_Bold?.copyWith(
                    color: SLColor.neutral[50],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 22,
            width: 313,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: log['tags'].length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                return SFACTag(
                    text: Text(
                  '# ${log['tags'][index]}',
                  style: SLTextStyle.Text_XS_Regular?.copyWith(
                    color: SLColor.neutral[50],
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MypageLogSmallCard extends StatelessWidget {
  const MypageLogSmallCard({
    super.key,
    required this.log,
  });
  final Map<String, dynamic> log;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: EdgeInsets.zero,
      width: 148,
      height: 182,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 148,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    log['image'],
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 6,
                    left: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: 15,
                      width: 15,
                      child: Image.asset(log['profile_picture']),
                    ),
                  ),
                  Positioned(
                    left: 28,
                    top: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        log['author'],
                        style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white,
                          letterSpacing: -0.14,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 7,
                    child:
                        SvgPicture.asset('assets/icons/bookmark_outline.svg'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 141,
              height: 57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height: 14,
                    child: Text(
                      log['category'],
                      style: SLTextStyle.Text_XS_Regular?.copyWith(
                          color: SLColor.neutral[50]),
                    ),
                  ),
                  Container(
                    width: 141,
                    height: 19,
                    padding: EdgeInsets.zero,
                    child: Text(
                      log['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // FIXME: semibold
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 141,
                    height: 16,
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 14,
                            child: SvgPicture.asset(
                              'assets/icons/chat_white.svg',
                              height: 14,
                            )),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          log['answer'].length.toString(),
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: SLColor.neutral[10],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '|',
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: SLColor.neutral[10],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/heart_white.svg',
                          height: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          log['like'].length.toString(),
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: SLColor.neutral[10],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 141,
              height: 22,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: log['tags'].length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  final tag = SFACTag(
                    text: Text(
                      '# ${log['tags'][index]}',
                      style: SLTextStyle.Text_XS_Regular?.copyWith(
                        color: SLColor.neutral[50],
                      ),
                    ),
                  );
                  return tag;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
