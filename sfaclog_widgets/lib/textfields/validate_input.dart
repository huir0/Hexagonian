import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/textfields/sl_input.dart';

enum ValidateInputType {
  name,
  email,
  emailConfirm,
  password,
  passwordConfirm,
}

class ValidateInput extends StatelessWidget {
  const ValidateInput({
    super.key,
    this.controller,
    required this.type,
    this.validator,
  });

  final ValidateInputType type;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  String getLabel() {
    switch (type) {
      case ValidateInputType.name:
        return '이름';
      case ValidateInputType.email:
        return '이메일 인증';
      case ValidateInputType.password:
        return '비밀번호';
      case ValidateInputType.passwordConfirm:
        return '비밀번호 확인';
      default:
        return '';
    }
  }

  String getHintText() {
    switch (type) {
      case ValidateInputType.name:
        return '이름을 입력해 주세요.';
      case ValidateInputType.email:
        return '이메일을 입력해 주세요.';
      case ValidateInputType.emailConfirm:
        return '이메일 주소를 입력해 주세요.';
      case ValidateInputType.password:
        return '비밀번호를 입력해 주세요.';
      case ValidateInputType.passwordConfirm:
        return '비밀번호를 다시 입력해 주세요.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String label = getLabel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        label == '' ? Container() : Text(label),
        SLInput(
          hintText: getHintText(),
          fillColor: Colors.transparent,
          controller: controller,
          borderType: SLInputBorderType.underline,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          obscureText: type == ValidateInputType.password ||
              type == ValidateInputType.passwordConfirm,
          validator: validator,
        ),
      ],
    );
  }
}

class ValidateInputExample extends StatelessWidget {
  const ValidateInputExample({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: ValidateInput(
        type: ValidateInputType.passwordConfirm,
        controller: controller,
        validator: (value) {
          if (value == null || value.length < 8) {
            return '현재 비밀번호를 다시 입력해주세요.';
          }
          return null;
        },
      ),
    );
  }
}
