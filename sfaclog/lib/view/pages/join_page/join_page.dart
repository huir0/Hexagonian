import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/util/join_sections.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog_widgets/util/common.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.read(onboardingProvider);

    int curIndex = onboardingState.currentPage;
    // int curIndex = 4;
    // print(curIndex + 1);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 52),
            LinearProgressIndicator(
              minHeight: 2,
              value: (curIndex + 1) / onboardingState.totalPage,
              color: SLColor.primary,
              backgroundColor: SLColor.neutral.shade80,
            ),
            const SizedBox(height: 34),
            IndexedStack(
              index: curIndex,
              children: joinSections,
            ),
            // const Spacer(),
            // SLButton(
            //   text: curIndex == joinSections.length - 1 ? '스팩로그 시작하기' : '다음',
            //   isActive: onboardingState.isButtonEnabled,
            //   onTap: () {
            //     ref.read(onboardingProvider.notifier).setButtonEnabled(true);
            //   },
            // ),
            // onboardingState.isButtonEnabled
            //     ? () {
            //         ref
            //             .read(onboardingProvider.notifier)
            //             .setButtonEnabled(true);
            //       }
            //     : null,
            // const SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
