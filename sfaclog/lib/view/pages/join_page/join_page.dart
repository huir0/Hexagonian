import 'package:flutter/material.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('본인인증'),
          const SizedBox(height: 20),
          const TextFieldWidget(
            type: TextFieldWidgetType.name,
          ),
          const SizedBox(height: 20),
          const TextFieldWidget(
            type: TextFieldWidgetType.email,
          ),
          const TextFieldWidget(type: TextFieldWidgetType.emailConfirm),
          const SizedBox(height: 20),
          const TextFieldWidget(
            type: TextFieldWidgetType.password,
          ),
          const SizedBox(height: 20),
          const TextFieldWidget(
            type: TextFieldWidgetType.passwordConfirm,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('다음'),
          ),
        ],
      ),
    );
  }
}

enum TextFieldWidgetType {
  name,
  email,
  emailConfirm,
  password,
  passwordConfirm,
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    required this.type,
  });

  final TextFieldWidgetType type;
  final TextEditingController? controller;

  String getLabel() {
    switch (type) {
      case TextFieldWidgetType.name:
        return '이름';
      case TextFieldWidgetType.email:
        return '이메일 인증';
      case TextFieldWidgetType.password:
        return '비밀번호';
      case TextFieldWidgetType.passwordConfirm:
        return '비밀번호 확인';
      default:
        return '';
    }
  }

  String getHintText() {
    switch (type) {
      case TextFieldWidgetType.name:
        return '이름을 입력해 주세요.';
      case TextFieldWidgetType.email:
        return '이메일을 입력해 주세요.';
      case TextFieldWidgetType.emailConfirm:
        return '이메일 주소를 입력해 주세요.';
      case TextFieldWidgetType.password:
        return '비밀번호를 입력해 주세요.';
      case TextFieldWidgetType.passwordConfirm:
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
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: getHintText(),
            contentPadding: const EdgeInsets.symmetric(vertical: 11),
          ),
        ),
      ],
    );
  }
}
