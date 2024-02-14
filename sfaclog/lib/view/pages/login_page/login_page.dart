import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/kakao_login_button.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';
import 'package:sfaclog_widgets/textfields/sl_input.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isActive = false;
  String description = '스팩로그와 함께 오늘도 스팩업!';
  String buttonText = '로그인';
  String hintText = '이메일 또는 비밀번호가 맞지 않습니다.';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);
    final authStatus = ref.watch(authProvider).authStatus;

    return PopScope(
      onPopInvoked: (didPop) async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/logo/sfaclog_logo.svg',
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: SLTextStyle.Text_L_Regular,
                      ),
                    ],
                  ),
                  const SizedBox(height: 84),
                  Form(
                    key: formKey,
                    onChanged: () {
                      if (formKey.currentState!.validate()) {
                        _isActive = true;
                        setState(() {});
                      } else {
                        _isActive = false;
                        setState(() {});
                      }
                    },
                    child: Column(
                      children: [
                        SLInput(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: '이메일',
                          controller: emailController,
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
                        ),
                        const SizedBox(height: 16),
                        SLInput(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: '비밀번호',
                          controller: passwordController,
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
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  SLButton(
                    text: buttonText,
                    isActive: _isActive,
                    onTap: _isActive
                        ? () async {
                            var id = await authNotifier.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (authStatus == AuthStatus.authenticated) {
                              await authNotifier.setUserInfoById(id);
                              context.push('/home');
                            }
                          }
                        : null,
                  ),
                  const SizedBox(height: 10),
                  const NavigateToJoinPageButton(),
                  const SizedBox(height: 64),
                  const DividerWithText(text: 'SNS로 1초만에 로그인'),
                  const SizedBox(height: 20),
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 18,
                    children: [
                      KakaoLoginButton(),
                      KakaoLoginButton(),
                      KakaoLoginButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(text),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class NavigateToJoinPageButton extends StatelessWidget {
  const NavigateToJoinPageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '아직 회원이 아니신가요?',
        style: SLTextStyle(
          style: SLStyle.Text_XS_Regular,
          color: SLColor.neutral.shade30,
        ).textStyle,
        children: [
          TextSpan(
            text: '회원가입 하기',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 10,
              color: SLColor.neutral.shade30,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.push('/signup');
              },
          ),
        ],
      ),
    );
  }
}
