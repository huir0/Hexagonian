import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_picture_page.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import 'my_profile_skill_page.dart';

class MypageProfileSetting extends ConsumerStatefulWidget {
  const MypageProfileSetting({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MypageProfileSettingState();
}

class _MypageProfileSettingState extends ConsumerState<MypageProfileSetting> {
  final nickname = TextEditingController();
  final skill = TextEditingController();
  late List<String> skills = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            // final currentTab = ref.read(myPageProvider).tab;
            // ref.read(myPageProvider.notifier).tabChanged(currentTab);
            // router.go('/my');
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        centerTitle: true,
        title: Text(
          '설정',
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
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 108,
                height: 108,
                child: Stack(
                  children: [
                    // TODO: profile picture
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: SLColor.primary[100],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                             Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const MypageProfilePicture(),
                                  ),
                                );
                          },
                          icon: Container(
                              width: 28,
                              height: 28,
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                'assets/icons/plus.svg',
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 308,
                height: 19,
                child: Row(
                  children: [
                    Text(
                      '닉네임',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '*',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                          color: const Color(0xffD3265C)),
                    ),
                    const Spacer(),
                    Text(
                      '${nickname.text.length}/20',
                      style: SLTextStyle.Text_S_Medium?.copyWith(
                        color: SLColor.neutral[50],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SFACTextField(
                height: 46,
                width: 312,
                border: Border.all(color: SLColor.neutral[60]!),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 308,
                height: 19,
                child: Row(
                  children: [
                    Text(
                      '간단한 자기소개',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${nickname.text.length}/100',
                      style: SLTextStyle.Text_S_Medium?.copyWith(
                        color: SLColor.neutral[50],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SFACTextField(
                height: 104,
                width: 312,
                border: Border.all(color: SLColor.neutral[60]!),
                hintText: '나를 소개해주세요.',
                hintTextColor: SLColor.neutral[60]!,
              ),
              const SizedBox(
                height: 38,
              ),
              SizedBox(
                width: 308,
                height: 19,
                child: Row(
                  children: [
                    Text(
                      '나의 스킬',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '*',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                          color: const Color(0xffD3265C)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              const Wrap(
                children: [],
              ),
              const SizedBox(
                height: 30,
              ),
              SFACSearchBar(
                active: false,
                controller: skill,
                height: 38,
                width: 312,
                hintText: '#프론트엔드  #백엔드  #개발자일상',
onTap: () {
    Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const MypageProfileSkill(),
                                  ),
                                );
},
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                '추천 인기 스킬',
                style: SLTextStyle.Text_M_Bold?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              const Wrap(
                children: [
                  // TODO: skill 연동해서 보여주기
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
