import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';
import 'package:sfaclog_widgets/menus/sl_expansion_tile.dart';
import 'package:sfaclog_widgets/util/common.dart';

enum termsState {
  all,
}

class PwConfirmSection extends ConsumerStatefulWidget {
  const PwConfirmSection({
    super.key,
  });

  static final passwordController =
      Provider.autoDispose<TextEditingController>((ref) {
    final controller = TextEditingController();

    ref.onDispose(() {
      controller.dispose();
    });

    return controller;
  });

  static final checkboxListProvider = Provider<bool>((ref) => false);

  @override
  PwConfirmSectionState createState() => PwConfirmSectionState();
}

class PwConfirmSectionState extends ConsumerState<PwConfirmSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String password = '';
  late String passwordConfirm = '';
  List<String> agreementState = [];

  @override
  Widget build(BuildContext context) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    const String title = '회원가입';

    List<String> terms = [
      '본인인증 약관 전체동의 (필수)',
      '개인정보 수집 이용 동의',
      '고유식별 정보처리 동의',
      '통신사 이용약관 동의',
      '서비스 이용약관 동의',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleWithCount(
            title: title,
            curIdx: onboardingState.currentPage + 1,
            total: onboardingState.totalPage),
        const SizedBox(height: 40),
        Form(
          key: formKey,
          onChanged: () {
            if (formKey.currentState!.validate() &&
                agreementState.contains('all')) {
              onboardingNotifier.setButtonEnabled(true);
            } else {
              onboardingNotifier.setButtonEnabled(false);
            }
          },
          child: Column(
            children: [
              ValidateInput(
                controller: ref.watch(PwConfirmSection.passwordController),
                type: ValidateInputType.password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '숫자 v 특수문자 v 6-18자 이내 v';
                  }
                  if (!RegExp(
                          r'^(?=.*[0-9])(?=.*[!@#$%^&*()_+])[0-9a-zA-Z!@#$%^&*()_+]{6,18}$')
                      .hasMatch(value)) {
                    return '숫자 v 특수문자 v 6-18자 이내 v';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  password = newValue ?? '';
                },
              ),
              const SizedBox(height: 20),
              ValidateInput(
                type: ValidateInputType.passwordConfirm,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (ref.watch(PwConfirmSection.passwordController).text !=
                      value) {
                    return '불일치';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  passwordConfirm = newValue ?? '';
                },
              ),
              const SizedBox(height: 20),
              SLExpansionTile(
                title: terms[0],
                color: SLColor.neutral,
                onChange: (newValue) {
                  if (newValue) {
                    agreementState.add('all');
                  } else {
                    agreementState.clear();
                  }
                },
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                    child: _buildExpansionChild(
                        terms: terms,
                        onChange: (newValue) {
                          // 부모 value가 true면 다 true가 되어야함.
                        },
                        value:
                            onboardingState.agreementState?.contains('all') ??
                                false //agreementState.contains('all'),
                        ),
                  ),
                ],
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
                      onboardingNotifier.uploadPasswordAndTerms(
                        password: password,
                        passwordConfirm: passwordConfirm,
                        terms: agreementState,
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

class _buildExpansionChild extends StatefulWidget {
  const _buildExpansionChild({
    super.key,
    required this.terms,
    required this.onChange,
    this.value = false,
  });

  final List<String> terms;
  final void Function(bool) onChange;
  final bool? value;

  @override
  State<_buildExpansionChild> createState() => _buildExpansionChildState();
}

class _buildExpansionChildState extends State<_buildExpansionChild> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.terms.length - 1,
      itemBuilder: (context, index) {
        return SLExpansionTile(
          title: widget.terms[index + 1],
          icon: Icons.chevron_right,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          onChange: widget.onChange,
          value: widget.value,
        );
      },
    );
  }
}
