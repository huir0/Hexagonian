import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/textfields/sl_input.dart';
import 'package:sfaclog_widgets/util/common.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.formKey,
  });
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    //@todo: riverpod으로 관리
    int curIdx = 3;
    int total = 5;
    String? profileImg = 'assets/images/basic_profile_sm.png';
    double wrapperPadding = 24;
    double inputPadding = 65;

    const String title = '프로필 설정';
    const String description = '스팩로그에서 사용할 프로필을 만들어보세요.';
    double editbtnSize = 35;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWithCount(title: title, curIdx: curIdx, total: total),
        const SizedBox(height: 8),
        Text(
          description,
          style: SLTextStyle.Text_M_Regular?.copyWith(
            color: SLColor.neutral.shade30,
          ),
        ),
        const SizedBox(height: 57),
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Image.asset(
                profileImg,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SLCircleIconButton(
                  width: editbtnSize,
                  height: editbtnSize,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: inputPadding - wrapperPadding),
          child: SLInput(
            maxLength: 10,
            fillColor: Colors.transparent,
            controller: controller,
            borderType: SLInputBorderType.underline,
            hintText: '닉네임을 입력해주세요',
            hintStyle: SLTextStyle.Text_L_Regular?.copyWith(
                color: SLColor.neutral.shade50),
            isCenteredText: true,
          ),
        ),
      ],
    );
  }
}
