import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
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
    const String title = '회원가입';

    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);
    final authNotifier = ref.read(authProvider.notifier);
    final authState = ref.watch(authProvider);

    late String name = '';
    late String email = '';

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
                                onTap: activeVerifyBtn
                                    ? () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SFACPopUpDialog(
                                              widget: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '메일을 확인해주세요.',
                                                    style: SLTextStyle
                                                            .Text_L_Bold
                                                        ?.copyWith(
                                                            color: SLColor
                                                                .neutral[100]),
                                                  ),
                                                  Text(
                                                    '${emailController.text}로 메일이 전송되었습니다.',
                                                    style: SLTextStyle
                                                            .Text_S_Medium
                                                        ?.copyWith(
                                                      color:
                                                          SLColor.neutral[100],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onConfirmed: () {
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        );
                                        var tempData = await authNotifier
                                            .signupForVerification(
                                          username: nameController.text,
                                          email: emailController.text,
                                        );

                                        onboardingNotifier.setNewUser(tempData);

                                        toggleVerifidReq(true);
                                        print(tempData);
                                        print(verifiedReq);
                                      }
                                    : null,
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
              ? () async {
                  try {
                    await authNotifier.login(
                      email: emailController.text,
                      password: '1234qwer!',
                    );

                    if (authState.verified != true) {
                      await Future.delayed(
                        Duration.zero,
                        () => showDialog(
                          context: context,
                          builder: (context) => SFACPopUpDialog(
                            widget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '이메일이 인증되지 않았습니다.',
                                  style: SLTextStyle.Text_L_Bold?.copyWith(
                                      color: SLColor.neutral[100]),
                                ),
                              ],
                            ),
                            onConfirmed: () async {
                              Future.delayed(
                                Duration.zero,
                                () => Navigator.pop(context),
                              );
                            },
                          ),
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
