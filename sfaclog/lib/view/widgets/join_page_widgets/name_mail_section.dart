import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sl_error_exception.dart';
import 'package:sfaclog/util/error_exception.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';

class NameMailSection extends ConsumerStatefulWidget {
  const NameMailSection({
    super.key,
  });

  @override
  NameMailSectionState createState() => NameMailSectionState();
}

const String title = '회원가입';

class NameMailSectionState extends ConsumerState<NameMailSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool activeVerifyBtn = false;
  bool verifiedReq = false;

  void toggleVerifyBtn(bool bool) {
    activeVerifyBtn = bool;
  }

  void toggleVerifidReq(bool bool) {
    verifiedReq = bool;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);
    final authNotifier = ref.read(authProvider.notifier);

    late String name = '';
    late String email = '';

    reqVerifyEmail() async {
      errorExceptionPopup(
        context,
        title: '메일을 확인해주세요.',
        message: '${emailController.text}로 메일이 전송되었습니다.',
      );
      var tempData = await authNotifier.signupForVerification(
        username: nameController.text,
        email: emailController.text,
      );

      toggleVerifidReq(true);
      onboardingNotifier.setNewUser(tempData);
    }

    verifyEmail() async {
      try {
        await authNotifier.login(
          email: emailController.text,
          password: '1234qwer!',
        );

        bool isVerifyEmail = await authNotifier.subscribeVerifiedEmail();

        if (isVerifyEmail != true) {
          Future.delayed(
            Duration.zero,
            () => errorExceptionPopup(
              context,
              title: '메일을 아직 확인하지 않았습니다.',
              message: '메일이 전송되었으니 다시한번 확인해주세요.',
            ),
          );
          return;
        }

        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          onboardingNotifier.uploadNameAndEmail(
            name: name,
            email: email,
          );
        }
        onboardingNotifier.moveNextSection();
      } on SLErrorException catch (e) {
        Future.delayed(
          Duration.zero,
          () => errorExceptionPopup(
            context,
            title: '${e.code} 에러 발생',
            message: e.message,
          ),
        );
      }
    }

    return Column(
      children: [
        Expanded(
          child: Column(
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
                      controller: nameController,
                      onSaved: (newValue) {
                        name = newValue;
                        onboardingNotifier.setOnboardingState(
                            onboardingState.userInfo?.copyWith(
                          profile: onboardingState.userInfo?.profile
                              ?.copyWith(name: newValue),
                        ));
                      },
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        ValidateInput(
                          type: ValidateInputType.email,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              toggleVerifyBtn(false);
                              toggleVerifidReq(false);

                              return '이메일을 입력해주세요.';
                            }
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              toggleVerifyBtn(false);
                              toggleVerifidReq(false);

                              return '잘못된 이메일 형식입니다.';
                            }
                            toggleVerifyBtn(true);

                            return null;
                          },
                          controller: emailController,
                          onSaved: (newValue) {
                            email = newValue;
                            onboardingNotifier.setOnboardingState(
                                onboardingState.userInfo?.copyWith(
                              profile: onboardingState.userInfo?.profile
                                  ?.copyWith(email: newValue),
                            ));
                          },
                        ),
                        Positioned(
                          top: 30,
                          right: 0,
                          child: IntrinsicWidth(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SLButton(
                                text: '인증요청',
                                textStyle: SLTextStyle.Text_M_Medium,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                isActive: activeVerifyBtn,
                                onTap: activeVerifyBtn ? reqVerifyEmail : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SLButton(
          text: '다음',
          isActive: onboardingState.isButtonEnabled && verifiedReq,
          onTap: onboardingState.isButtonEnabled && verifiedReq
              ? verifyEmail
              : null,
        ),
      ],
    );
  }
}
