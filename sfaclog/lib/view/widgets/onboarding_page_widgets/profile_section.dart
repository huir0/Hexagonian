import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfaclog/view/pages/onboarding_page/profile_edit_page.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';
import 'package:go_router/go_router.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({
    super.key,
  });

  @override
  ProfileSectionState createState() => ProfileSectionState();
}

class ProfileSectionState extends ConsumerState<ProfileSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool isActive = false;
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    double wrapperPadding = 24;
    double inputPadding = 65;

    const String title = '프로필 설정';
    const String description = '스팩로그에서 사용할 프로필을 만들어보세요.';
    double editbtnSize = 35;

    Widget profileImage() {
      if (onboardingState.userInfo?.picture != null ||
          onboardingState.userInfo?.picture != '') {
        String imageString = onboardingState.userInfo!.picture!;
        if (imageString.toLowerCase().endsWith('.svg')) {
          return SLCircleAvatar(
            diameter: 150,
            imageWidget: SvgPicture.asset(imageString),
          );
        } else {
          XFile file = XFile(imageString);
          return SLCircleAvatar(
            diameter: 150,
            imageWidget: Image.file(
              File(file.path),
              fit: BoxFit.cover,
            ),
          );
        }
      } else {
        return SvgPicture.asset(
          'assets/avatars/avatar_01.svg',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: formKey,
          onChanged: () {
            if (formKey.currentState!.validate()) {
              onboardingNotifier.setButtonEnabled(true);
            } else {
              onboardingNotifier.setButtonEnabled(false);
            }
          },
          child: Column(
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
              const SizedBox(height: 57),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    profileImage(),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SLCircleIconButton(
                        onTap: () {
                          context.push('/profile');
                        },
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
                padding: EdgeInsets.symmetric(
                    horizontal: inputPadding - wrapperPadding),
                child: SLInput(
                  maxLength: 10,
                  fillColor: Colors.transparent,
                  controller: controller,
                  borderType: SLInputBorderType.underline,
                  hintText: '닉네임을 입력해주세요',
                  hintStyle: SLTextStyle.Text_L_Regular?.copyWith(
                      color: SLColor.neutral.shade50),
                  isCenteredText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '닉네임을 입력해주세요.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    nickname = newValue;
                  },
                ),
              ),
            ],
          ),
        ),
        SLButton(
          text: '다음',
          isActive: onboardingState.isButtonEnabled,
          onTap: onboardingState.isButtonEnabled
              ? () async {
                  try {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      onboardingNotifier.uploadNicknameProfile(
                        nickname: nickname,
                      );
                    }
                    onboardingNotifier.moveNextSection();
                  } catch (e) {
                    print(e);
                  }
                }
              : null,
        ),
      ],
    );
  }
}
