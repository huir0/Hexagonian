import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/kakao_login_button.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';
import 'package:sfaclog_widgets/textfields/sl_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String description = '스팩로그와 함께 오늘도 스팩업!';
    String buttonText = '로그인';
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool isActive = false;
    String hintText = '이메일 또는 비밀번호가 맞지 않습니다.';
    String? email;
    String? password;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  isActive = true;
                } else {
                  isActive = false;
                }
              },
              child: Column(
                children: [
                  SLInput(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: '이메일',
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
                    },
                  ),
                  const SizedBox(height: 16),
                  SLInput(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: '비밀번호',
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
                      password = newValue;
                    },
                    obscureText: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            SLButton(
              text: buttonText,
              isActive: false,
              onTap: isActive
                  ? () {
                      // login
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

enum InputType {
  login,
  signup,
  search,
}

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.type = InputType.login,
    this.obscureText = false,
  });

  final String hintText;
  final TextEditingController controller;
  final InputType type;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
      ),
    );
  }
}
