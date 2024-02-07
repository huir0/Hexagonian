import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common.dart';

class MypageProfilePicture extends ConsumerStatefulWidget {
  const MypageProfilePicture({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MypageProfilePictureState();
}

class _MypageProfilePictureState extends ConsumerState<MypageProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        centerTitle: true,
        title: Text(
          '프로필 변경',
          style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                // TODO: 저장
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                style: SLTextStyle.Text_L_Regular?.copyWith(
                    color: SLColor.neutral[20]),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 61),
              child: Text(
                '프로필 이미지를 선택해주세요.',
                // FIXME: semibold
                style: SLTextStyle.Text_XL_Medium?.copyWith(
                    color: Colors.white, letterSpacing: -0.20),
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              width: 92,
              height: 92,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // FIXME: 이미지 추가
                // image:
              ),
            ),
            SizedBox(
              height: 62,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 14,
              children: [
                GestureDetector(
                  onTap: () {
                    print('clicked');
                  },
                  child: SvgPicture.asset('assets/icons/add_picture.svg'),
                ),
                for (var i = 1; i <= 16; i++)
                  GestureDetector(
                    onTap: () {
                      print('${i}');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/profile_picture${i}.svg'),
                    ),
                  ),
                  for (var i = 17; i <= 19; i++)
                  GestureDetector(
                    onTap: () {
                      print('${i}');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset('assets/icons/profile_picture${i}.png'),
                    ),
                  ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
