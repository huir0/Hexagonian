import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../common.dart';

class ResumeEducationCard extends StatelessWidget {
  const ResumeEducationCard({
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
              SvgPicture.asset('assets/icons/mortar_board.svg'),
              SizedBox(width: 8,),
              Text(
                resume['institute'],
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: Colors.white),
              ),
              Text(' - '),
              Text(
                resume['major'],
                style: SLTextStyle.Text_XS_Medium?.copyWith(
                    color: Colors.white),
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
          Row(
            children: [
              SizedBox(width: 25,),
              Text.rich(
                TextSpan(
                    style: SLTextStyle.Text_XS_Medium?.copyWith(color: SLColor.neutral[60], letterSpacing: -0.1),
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
            ],
          ),
        ],
      ),
    );
  }
}
