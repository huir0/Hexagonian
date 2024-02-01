import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/title_with_count.dart';
import 'package:sfaclog_widgets/textfields/validate_input.dart';
import 'package:sfaclog_widgets/menus/sl_expansion_tile.dart';
import 'package:sfaclog_widgets/util/common.dart';

class PwConfirmSection extends StatelessWidget {
  const PwConfirmSection({
    super.key,
    required this.formKey,
  });
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    const String title = '회원가입';

    //@todo: riverpod으로 관리
    int curIdx = 2;
    int total = 5;

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
        TitleWithCount(title: title, curIdx: curIdx, total: total),
        const SizedBox(height: 40),
        Form(
          key: formKey,
          child: Column(
            children: [
              const ValidateInput(
                type: ValidateInputType.password,
              ),
              const SizedBox(height: 20),
              const ValidateInput(
                type: ValidateInputType.passwordConfirm,
              ),
              const SizedBox(height: 20),
              SLExpansionTile(
                title: terms[0],
                color: SLColor.neutral,
                onChange: (newValue) {
                  print('Checkbox: $newValue');
                },
                children: [
                  _buildExpansionChild(
                    terms: terms,
                    onChange: (newValue) {
                      print('Checkbox: $newValue');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _buildExpansionChild extends StatelessWidget {
  const _buildExpansionChild({
    super.key,
    required this.terms,
    required this.onChange,
  });

  final List<String> terms;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: terms.length - 1,
      itemBuilder: (context, index) {
        return SLExpansionTile(
          title: terms[index + 1],
          icon: Icons.chevron_right,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          onChange: onChange,
        );
      },
    );
  }
}
