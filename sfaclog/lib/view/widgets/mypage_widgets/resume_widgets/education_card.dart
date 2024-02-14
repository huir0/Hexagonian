import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common.dart';
import '../../../../model/resume_education_model.dart';

class ResumeEducationCard extends StatelessWidget {
  const ResumeEducationCard({
    super.key,
    required this.education,
  });
  final EducationModel education;

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
              SvgPicture.asset('assets/icons/mortar_board.svg'),
              SizedBox(width: 8,),
              Text(
                education.institute,
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: Colors.white),
              ),
              Text(' - '),
              Text(
                education.major,
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: Colors.white),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {
                    context.push('/my/profile/education_edit/${education.id}');
                  },
                  child: SvgPicture.asset('assets/icons/pencil_grey.svg')),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              SizedBox(width: 25,),
              Text.rich(
                TextSpan(
                    style: SLTextStyle.Text_XS_Medium?.copyWith(color: SLColor.neutral[60], letterSpacing: -0.1),
                    children: [
                      TextSpan(
                          text:
                              DateFormat('yyyy.MM').format(DateTime.parse(education.startDate))),
                      const TextSpan(text: ' ~ '),
                      TextSpan(
                          text: education.endDate == null
                              ? '현재'
                              : DateFormat('yyyy.MM').format(DateTime.parse(education.endDate))),
                    ]),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
