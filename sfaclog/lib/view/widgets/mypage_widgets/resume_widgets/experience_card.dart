import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:intl/intl.dart';
import 'package:sfaclog/model/resume_experience_model.dart';

class ResumeExperienceCard extends StatelessWidget {
  const ResumeExperienceCard({
    super.key,
    required this.experience,
  });
  final ExperienceModel experience;

  @override
  Widget build(BuildContext context) {
    String endDateText = '';
    if (experience.endDate == null) {
      endDateText = '현재';
    } else {
      try {
        endDateText =
            DateFormat('yyyy.MM').format(DateTime.parse(experience.endDate));
      } catch (e) {
        print('endDateText $e');
      }
    }
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
                experience.company,
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: SLColor.neutral[10]),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                experience.title,
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: SLColor.neutral[10]),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    print(experience.id);
                    context
                        .push('/my/profile/experience_edit/${experience.id}');
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
                      text: DateFormat('yyyy.MM')
                          .format(DateTime.parse(experience.startDate))),
                  const TextSpan(text: ' ~ '),
                  TextSpan(text: endDateText),
                ]),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            experience.content,
            style: SLTextStyle.Text_XS_Medium?.copyWith(
                color: SLColor.neutral[40]),
          )
        ],
      ),
    );
  }
}
