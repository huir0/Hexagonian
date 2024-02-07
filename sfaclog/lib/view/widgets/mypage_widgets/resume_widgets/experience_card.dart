import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/common.dart';
import 'package:intl/intl.dart';

class ResumeExperienceCard extends StatelessWidget {
  const ResumeExperienceCard({
    super.key,
    required this.resume,
  });
  final Map<String, dynamic> resume;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 278,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                resume['company'],
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: SLColor.neutral[10]),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                resume['title'],
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: SLColor.neutral[10]),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    // TODO: 편집 페이지로 연결
                  },
                  child: SvgPicture.asset('assets/icons/pencil_grey.svg')),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Text.rich(
            TextSpan(
                style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.08,
                    color: SLColor.neutral[60]),
                children: [
                  TextSpan(
                      text:
                          DateFormat('yyyy.MM').format(resume['period_start'])),
                  const TextSpan(text: ' ~ '),
                  TextSpan(
                      text: resume['period_end'] == null
                          ? '현재'
                          : DateFormat('yyyy.MM').format(resume['period_end'])),
                ]),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            resume['content'],
            style: SLTextStyle.Text_XS_Medium?.copyWith(
                color: SLColor.neutral[40]),
          )
        ],
      ),
    );
  }
}
