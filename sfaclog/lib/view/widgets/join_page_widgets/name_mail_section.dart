import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';

class NameMailSection extends ConsumerStatefulWidget {
  const NameMailSection({
    super.key,
  });

  @override
  NameMailSectionState createState() => NameMailSectionState();
}

class NameMailSectionState extends ConsumerState<NameMailSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const String title = '회원가입';

    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    late String name;
    late String email;
    late String emailConfirm;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWithCount(
            title: title,
            curIdx: onboardingState.currentPage + 1,
            total: onboardingState.totalPage),
        const SizedBox(height: 40),
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
              ValidateInput(
                type: ValidateInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '이름을 입력해주세요.';
                  }
                  if (value.length < 2) {
                    return '이름은 두글자 이상이어야 합니다.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  name = newValue;
                  onboardingNotifier
                      .setOnboardingState(onboardingState.userInfo?.copyWith(
                    user: onboardingState.userInfo?.user
                        ?.copyWith(name: newValue),
                  ));
                },
              ),
              const SizedBox(height: 20),
              ValidateInput(
                type: ValidateInputType.email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '이메일을 입력해주세요.';
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value)) {
                    return '잘못된 이메일 형식입니다.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  email = newValue;
                  onboardingNotifier
                      .setOnboardingState(onboardingState.userInfo?.copyWith(
                    user: onboardingState.userInfo?.user
                        ?.copyWith(email: newValue),
                  ));
                },
              ),
              ValidateInput(
                type: ValidateInputType.emailConfirm,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '인증번호가 맞지 않습니다.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  emailConfirm = newValue;
                },
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
                      onboardingNotifier.uploadNameAndEmail(
                        name: name,
                        email: email,
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
