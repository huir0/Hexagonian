import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/log_card_mini.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/more_button.dart';

class LogCardGridSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UnderlinedTitleWithMoreButton(
          subject: subject,
          subtitle: subtitle,
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        GridView.builder(
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
            return LogCardMini(image: thumbnail);
          },
        ),
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
