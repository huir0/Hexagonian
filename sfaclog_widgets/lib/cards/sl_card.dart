import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sfaclog_widgets/util/common.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    super.key,
    required this.posts,
  });
  final List<Map<String, String>> posts;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList = List<bool>.filled(widget.posts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 300,
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 22, left: 23, right: 24),
                  width: 265,
                  height: 32,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: SLColor.primary[100],
                        ),
                        width: 25,
                        height: 24,
                        child: Text(
                          post['collection']!,
                          style: SLTextStyle.Text_S_Medium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 232,
                        child: Text(
                          post['first_title']!,
                          maxLines: 2,
                          style: SLTextStyle.Text_S_Bold?.copyWith(
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.only(left: 23, right: 24),
                  width: 265,
                  height: 14,
                  child: Text(
                    post['second_title']!,
                    style: SLTextStyle.Text_XS_Medium?.copyWith(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11),
                  child: Divider(
                    height: 1,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(bottom: 18, left: 17, right: 30),
                  width: 265,
                  child: isExpandedList[index]
                      ? Text(
                          post['content']!,
                          style: SLTextStyle.Text_XS_Medium?.copyWith(
                              color: Colors.white, fontFamily: 'Pretendard'),
                        )
                      : RichText(
                          text: TextSpan(
                            style: SLTextStyle.Text_XS_Medium?.copyWith(
                                color: Colors.white, fontFamily: 'Pretendard'),
                            children: [
                              TextSpan(
                                text: post['content']!.length > 100
                                    ? post['content']!.substring(0, 100)
                                    : post['content']!,
                              ),
                              TextSpan(
                                text: '...더보기',
                                style: SLTextStyle.Text_XS_Medium?.copyWith(
                                    color: SLColor.neutral[40],
                                    fontFamily: 'Pretendard'),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      isExpandedList[index] = true;
                                    });
                                  },
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.reviews,
  });
  final List<Map<String, dynamic>> reviews;

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList = List<bool>.filled(widget.reviews.length, false);
  }

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (var review in widget.reviews) {
      totalRating += review['rating'];
    }
    double averageRating = totalRating / widget.reviews.length;
    return Container(
      width: 312,
      height: 240,
      child: Column(
        children: [
          Container(
            width: 312,
            padding: const EdgeInsets.only(left: 20, top: 19, bottom: 19),
            child: Row(
              children: [
                Container(
                  // width: 148,
                  height: 22,
                  child: RatingBarIndicator(
                    itemSize: 22,
                    rating: averageRating,
                    itemCount: 5,
                    itemPadding: EdgeInsets.only(right: 9),
                    itemBuilder: (context,_) => SvgPicture.asset(
                      'assets/icons/star.svg',
                      color: SLColor.primary[100],
                    ),
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                Container(
                  height: 19,
                  child: Text(
                    averageRating.toStringAsFixed(1),
                    style: SLTextStyle.Text_L_Medium?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 19,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    ' / 5.0',
                    style: SLTextStyle.Text_XS_Medium?.copyWith(
                        color: SLColor.neutral[40]),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 11, right: 10),
            child: Divider(
              height: 1,
            ),
          ),
          SizedBox(
            height: 178,
            child: ListView.builder(
              itemCount: widget.reviews.length,
              itemBuilder: (context, index) {
                final review = widget.reviews[index];
                return Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 21, top: 19, bottom: 18),
                        height: 45,
                        child: Row(
                          children: [
                            // profile picture
                            Container(
                              width: 45,
                              height: 45,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 14,
                                  child: RichText(
                                    text: TextSpan(
                                      style:
                                          SLTextStyle.Text_XS_Medium?.copyWith(
                                              color: SLColor.neutral[40]),
                                      children: [
                                        TextSpan(text: review['reviewer']),
                                        TextSpan(text: '·'),
                                        TextSpan(text: review['reviewer'])
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Container(
                                  height: 19,
                                  child: Text(
                                    review['content']!,
                                    // FIXME: 폰트 세미볼드로 바꿔야함
                                    style: SLTextStyle.Text_M_Medium?.copyWith(
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
