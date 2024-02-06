import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';
import 'package:sfaclog_widgets/tags/sl_tag.dart';

class ComSideReadCard extends StatelessWidget {
  const ComSideReadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 231,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFF333333)),
        borderRadius: BorderRadius.circular(10),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              reviselabel(
                width: 38,
                height: 22,
                text: 'D-21',
                onPressed: () {},
                fontSize: 12,
              ),
              SizedBox(
                width: 5,
              ),
              SFACTag(
                text: Text(
                  '#프론트엔드',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '비대면의료 닥터루시드 팀원 모집.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'NEW',
            style: TextStyle(
                color: Color(0xFF196AFF),
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text('안녕하세요 저는 의사입니다. 비대면의료\n플랫폼 닥터루시드를 출시합니다.본문에\n소개 부분을 보여줌',
              style: SLTextStyle(
                style: SLStyle.Text_S_Medium,
                color: SLColor.neutral.shade30,
              ).textStyle),
        ],
      ),
    );
  }
}
