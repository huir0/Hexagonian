import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';

class NameMailSection extends StatelessWidget {
  const NameMailSection({
    super.key,
    required this.formKey,
  });
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    const String title = '회원가입';

    //@todo: riverpod으로 관리
    int curIdx = 1;
    int total = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TitleWithCount(title: title, curIdx: curIdx, total: total),
        const SizedBox(height: 40),
        Form(
          key: formKey,
          child: const Column(
            children: [
              ValidateInput(
                type: ValidateInputType.name,
              ),
              SizedBox(height: 20),
              ValidateInput(
                type: ValidateInputType.email,
              ),
              ValidateInput(type: ValidateInputType.emailConfirm),
            ],
          ),
        ),
      ],
    );
  }
}
