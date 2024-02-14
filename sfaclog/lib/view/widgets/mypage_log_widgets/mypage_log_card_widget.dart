import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_card_provider.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../viewmodel/log_viewmodel/log_notifier.dart';

class MypageLogBigCard extends ConsumerStatefulWidget {
  const MypageLogBigCard({
    super.key,
    required this.log,
    this.bookmarked = false,
  });
  final SFACLogModel log;
  final bool bookmarked;

  @override
  ConsumerState<MypageLogBigCard> createState() => _MypageLogBigCardState();
}

class _MypageLogBigCardState extends ConsumerState<MypageLogBigCard> {
  String avatarUrl = '';
  String imgUrl = '';
  int replyCnt = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    var newAvatarUrl = await ref
        .read(logProvider.notifier)
        .getAvatarUrl(widget.log.expand['user']['id']);
    var newImgUrl =
        await ref.read(logProvider.notifier).getThumbNailUrl(widget.log.id);
    var newReplyCnt =
        await ref.read(logProvider.notifier).getReplyCnt(widget.log.id);
    setState(() {
      avatarUrl = newAvatarUrl;
      imgUrl = newImgUrl;
      replyCnt = newReplyCnt;
    });
  }

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
            clipBehavior: Clip.hardEdge,
            width: 313,
            height: 157,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Container(
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
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
                    child: SvgPicture.network(
                      avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 34.82,
                  top: 10,
                  child: Text(
                    widget.log.expand['user']['nickname'],
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 11,
                  child: GestureDetector(
                      onTap: () {},
                      child: widget.bookmarked
                          ? SvgPicture.asset('assets/icons/bookmark_filled.svg')
                          : SvgPicture.asset('assets/icons/bookmark.svg')),
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
              widget.log.category,
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
              widget.log.title,
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
                  replyCnt.toString(),
                  style: SLTextStyle.Text_S_Bold?.copyWith(
                    color: SLColor.neutral[50],
                  ),
                ),
                SizedBox(
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
                  widget.log.like.toString(),
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
              itemCount: widget.log.tag.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                return SFACTag(
                    text: Text(
                  '${widget.log.tag[index]}',
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

class MypageLogSmallCard extends ConsumerStatefulWidget {
  const MypageLogSmallCard({
    super.key,
    required this.log,
    this.bookmarked = false,
  });
  final SFACLogModel log;
  final bool bookmarked;

  @override
  ConsumerState<MypageLogSmallCard> createState() => _MypageLogSmallCardState();
}

class _MypageLogSmallCardState extends ConsumerState<MypageLogSmallCard> {
  String avatarUrl = '';
  String imgUrl = '';
  int replyCnt = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    var newAvatarUrl = await ref
        .read(logProvider.notifier)
        .getAvatarUrl(widget.log.expand['user']['id']);
    var newImgUrl =
        await ref.read(logProvider.notifier).getThumbNailUrl(widget.log.id);
    var newReplyCnt =
        await ref.read(logProvider.notifier).getReplyCnt(widget.log.id);
    setState(() {
      avatarUrl = newAvatarUrl;
      imgUrl = newImgUrl;
      replyCnt = newReplyCnt;
    });
  }

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
                    widget.log.thumbnail,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Image.network(imgUrl),
                  ),
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
                      child: SvgPicture.network(avatarUrl),
                    ),
                  ),
                  Positioned(
                    left: 28,
                    top: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.log.expand['user']['nickname'],
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
                    child: widget.bookmarked
                        ? SvgPicture.asset('assets/icons/bookmark_filled.svg')
                        : SvgPicture.asset('assets/icons/bookmark.svg'),
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
                      widget.log.category,
                      style: SLTextStyle.Text_XS_Regular?.copyWith(
                          color: SLColor.neutral[50]),
                    ),
                  ),
                  Container(
                    width: 141,
                    height: 19,
                    padding: EdgeInsets.zero,
                    child: Text(
                      widget.log.title,
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
                          replyCnt.toString(),
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: SLColor.neutral[50],
                          ),
                        ),
                        SizedBox(
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
                        SvgPicture.asset(
                          'assets/icons/heart.svg',
                          height: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.log.like.toString(),
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: SLColor.neutral[50],
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
                itemCount: widget.log.tag.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 5);
                },
                itemBuilder: (BuildContext context, int index) {
                  final tag = SFACTag(
                    text: Text(
                      '${widget.log.tag[index]}',
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
