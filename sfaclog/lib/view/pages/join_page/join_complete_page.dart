import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_state.dart';
import 'package:sfaclog_widgets/buttons/sl_button.dart';

class JoinCompletePage extends ConsumerWidget {
  const JoinCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingNotifier = ref.read(onboardingProvider.notifier);

    const description = '회원가입이 정상적으로 \n완료되었습니다 :)';
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/signup_complete.png',
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: SLTextStyle(
                    style: SLStyle.Text_L_Bold,
                    color: SLColor.neutral.shade10,
                  ).textStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SLButton(
              text: '다음',
              isActive: true,
              onTap: () {
                onboardingNotifier.moveSpecifieSection(
                  section: OnboardingStatus.section3,
                );
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
