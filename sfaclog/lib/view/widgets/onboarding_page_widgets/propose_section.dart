import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog_widgets/titles/title_with_count.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog/viewmodel/auth/user_info_notifier.dart';
import 'package:sfaclog_widgets/buttons/onboarding_button/no_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';

enum ProposeState {
  all_offer,
  no_offer,
  only_apply,
  only_project,
}

class ProposeSection extends ConsumerStatefulWidget {
  const ProposeSection({super.key});

  @override
  ProposeSectionState createState() => ProposeSectionState();
}

class ProposeSectionState extends ConsumerState<ProposeSection> {
  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.watch(onboardingProvider.notifier);
    final userInfoState = ref.watch(userInfoProvider);
    final userInfoNotifier = ref.watch(userInfoProvider.notifier);

    String? proposeState = onboardingState.userInfo?.proposeState;

    const String title = '제안';
    const String description = '채용 및 프로젝트 제안을 받을 의향이 있으신가요?';

    List<Widget> renderProposeButtons() {
      return proposeButtonAssets.map((propose) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: NoButton(
            onPressed: () {
              onboardingNotifier.uploadProposeState(
                  proposeState: getValue(propose['proposeState']));
            },
            isPressed: proposeState == getValue(propose['proposeState']),
            image: Image.asset(
              'assets/images/propose/${getValue(propose['proposeState'])}.png',
            ),
            text: propose['description'],
          ),
        );
      }).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithCount(
            title: title,
            curIdx: onboardingState.currentPage + 1,
            total: onboardingState.totalPage),
        const SizedBox(height: 8),
        Text(
          description,
          style: SLTextStyle.Text_M_Regular?.copyWith(
            color: SLColor.neutral.shade30,
          ),
        ),
        const SizedBox(height: 40),
        ...renderProposeButtons(),
        const SizedBox(height: 40),
        const Spacer(),
        SLButton(
          text: '스팩로그 시작하기',
          isActive: proposeState != null,
          onTap: proposeState != null
              ? () async {
                  try {
                    if (onboardingState.userInfo != null &&
                        userInfoState.userInfo!.profile != null) {
                      UserInfo userInfo = onboardingState.userInfo!;
                      List<String> skillList = [
                        ...userInfo.skill!.map((skill) => skill.id)
                      ];

                      var res = await userInfoNotifier.createUserInfo(
                        nickname: userInfo.nickname!,
                        agreement: userInfo.agreementState!,
                        skill: skillList,
                        userModelId: userInfo.profile!.id!,
                        propose_state: userInfo.proposeState!,
                        picture: userInfo.picture,
                      );

                      userInfoNotifier.setUserInfo(
                        res,
                        skills: userInfo.skill!,
                        user: userInfo.profile!,
                      );
                    } else {
                      print(
                          'createUserInfo: ${onboardingState.userInfo!.profile}가 null입니다.');
                      return;
                    }

                    Future.delayed(
                      Duration.zero,
                      () => context.push('/home'),
                    );
                  } catch (e) {
                    print('error: $e');
                  }
                }
              : null,
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> proposeButtonAssets = [
  {
    'proposeState': ProposeState.all_offer,
    'description': '두 제안 모두 받을래요.',
  },
  {
    'proposeState': ProposeState.only_apply,
    'description': '채용 제안만 받을래요.',
  },
  {
    'proposeState': ProposeState.only_project,
    'description': '프로젝트 제안만 받을래요.',
  },
  {
    'proposeState': ProposeState.no_offer,
    'description': '두 제안 모두 관심 없어요.',
  },
];

String getValue(value) {
  return value.toString().split('.')[1];
}
