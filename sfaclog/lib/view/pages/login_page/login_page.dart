import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/kakao_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String buttonText = '로그인';
    String hintText = '이메일';
    TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo/sfaclog_logo.svg',
            ),
            InputWidget(
              hintText: hintText,
              controller: controller,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                buttonText,
              ),
            ),
            const NavigateToJoinPageButton(),
            const DividerWithText(text: 'SNS로 1초만에 로그인'),
            const Wrap(
              spacing: 18,
              children: [
                KakaoLoginButton(),
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
        Text(text),
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
        children: [
          TextSpan(
            text: '회원가입 하기',
            style: const TextStyle(decoration: TextDecoration.underline),
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
