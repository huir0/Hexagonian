import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/log_card_mini.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/more_button.dart';
import 'package:sfaclog/viewmodel/app_wrapper_viewModel/app_wrapper_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';

class LogCardGridSection extends ConsumerWidget {
  const LogCardGridSection({
    super.key,
    this.thumbnail,
    this.subject = '#백엔드',
    this.subtitle = '개발자 필수 로그',
  });

  final String? thumbnail;
  final String subject;
  final String subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var logList = ref.watch(logProvider).logModelList;
    var state = ref.read(appwrapperProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UnderlinedTitleWithMoreButton(
          subject: subject,
          subtitle: subtitle,
          onPressed: () {
            int logPage = 2;
            state.handleFabTap(context, logPage);
          },
        ),
        const SizedBox(height: 20),
        logList != []
            ? GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  childAspectRatio: 148 / 190,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push('/log/read/${logList[index].id}');
                    },
                    child: LogCardMini(
                      logData: logList![index],
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(),
        const SizedBox(height: 40),
      ],
    );
  }
}

class UnderlinedTitleWithMoreButton extends StatelessWidget {
  const UnderlinedTitleWithMoreButton({
    super.key,
    required this.subject,
    required this.subtitle,
    this.onPressed,
  });

  final String subject;
  final String subtitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const SizedBox(width: 24),
            LogSubject(subject: subject),
            const SizedBox(width: 4),
            Text(
              subtitle,
              style: SLTextStyle(
                style: SLStyle.Heading_S_Regular,
                color: Colors.white,
              ).textStyle,
            ),
          ],
        ),
        MoreButton(onPressed: onPressed),
      ],
    );
  }
}

class LogSubject extends StatelessWidget {
  const LogSubject({
    super.key,
    required this.subject,
  });

  final String subject;

  @override
  Widget build(BuildContext context) {
    return Text(
      subject,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: Colors.white,
        decoration: TextDecoration.underline,
        decorationColor: SLColor.primary,
        decorationThickness: 2,
      ),
    );
  }
}
