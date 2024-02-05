import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/util/join_sections.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_notifier.dart';
import 'package:sfaclog_widgets/util/common.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);

    int curIndex = onboardingState.currentPage;
    // int curIndex = 4;
    // print(curIndex + 1);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: ListView(
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
              key: ValueKey<int>(onboardingState.currentPage),
              index: onboardingState.currentPage,
              children: joinSections,
            ),
          ],
        ),
      ),
    );
  }
}
