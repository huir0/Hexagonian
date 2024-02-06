import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';

class MypageProfileSkill extends ConsumerStatefulWidget {
  const MypageProfileSkill({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MypageProfileSkillState();
}

class _MypageProfileSkillState extends ConsumerState<MypageProfileSkill> {
  final skill = TextEditingController();
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
            '스킬 편집',
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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 34,
              ),
              Text(
                '스킬을 선택해주세요',
                style: SLTextStyle.Text_M_Bold?.copyWith(color: Colors.white),
              ),
              Wrap(
                children: [],
              ),
              SizedBox(
                height: 30,
              ),
              SFACSearchBar(
                controller: skill,
                height: 38,
                width: 312,
                hintText: '스킬을 입력해주세요.',
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
              SizedBox(
                height: 24,
              ),
              Text(
                '추천 인기 스킬',
                style: SLTextStyle.Text_M_Bold?.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 28,
              ),
              Wrap(
                children: [
                  // TODO: skill 연동해서 보여주기
                ],
              )
            ],
          ),
        ));
  }
}
