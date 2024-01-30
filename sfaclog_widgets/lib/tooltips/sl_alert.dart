import 'package:flutter/widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

class SLAlert extends StatelessWidget {
  const SLAlert({
    super.key,
    this.color,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(
      vertical: 18,
      horizontal: 20,
    ),
    required this.from,
    required this.content,
    required this.formatedDate,
  });
  final Color? color;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final String from;
  final String content;
  final String formatedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? SLColor.neutral.shade80,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$from 알림',
                style: SLTextStyle(
                  style: SLStyle.Text_M_Regular,
                  color: SLColor.primary.shade70,
                ).textStyle,
              ),
              Text(
                formatedDate,
                style: SLTextStyle(
                  style: SLStyle.Text_S_Regular,
                  color: SLColor.neutral.shade50,
                ).textStyle,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: SLTextStyle(
              style: SLStyle.Text_L_Medium,
            ).textStyle,
          ),
        ],
      ),
    );
  }
}

class SLAlertExample extends StatelessWidget {
  const SLAlertExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SLAlert(
            from: '로그',
            content: '스팩왕박스팩님이 댓글을 달았습니다.',
            formatedDate: '오늘',
          ),
        ],
      ),
    );
  }
}
