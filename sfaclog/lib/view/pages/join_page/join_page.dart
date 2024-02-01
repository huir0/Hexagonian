import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/name_mail_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/profile_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/propose_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/pw_confirm_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/skill_section.dart';
import 'package:sfaclog_widgets/util/common.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    //@todo: riverpod으로 관리
    int curIndex = 0;

    final GlobalKey<FormState> nameMailFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> pwConfirmFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> skillFormKey = GlobalKey<FormState>();
    final GlobalKey<FormState> proposeFormKey = GlobalKey<FormState>();

    List<Widget> joinSections = [
      NameMailSection(
        formKey: nameMailFormKey,
      ),
      PwConfirmSection(
        formKey: pwConfirmFormKey,
      ),
      ProfileSection(
        formKey: profileFormKey,
      ),
      const SkillSection(
          // formKey: skillFormKey,
          ),
      const ProposeSection(
          // formKey: proposeFormKey,
          ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 52),
            LinearProgressIndicator(
              minHeight: 2,
              value: (curIndex + 1) / joinSections.length,
              color: SLColor.primary,
              backgroundColor: SLColor.neutral.shade80,
            ),
            const SizedBox(height: 34),
            IndexedStack(
              index: curIndex,
              children: joinSections,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (curIndex < joinSections.length - 1) {
                  curIndex++;
                } else {
                  curIndex = 0;
                }
                print(curIndex);
              },
              child: curIndex == joinSections.length - 1
                  ? const Text('스팩로그 시작하기')
                  : const Text('다음'),
            ),
            const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
