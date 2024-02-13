import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';

class ComReadCard2 extends StatelessWidget {
  const ComReadCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 231,
      height: 140,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF333333)),
        borderRadius: BorderRadius.circular(10),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'IPTIME 포트포워딩 질문입니다.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'NEW',
            style: TextStyle(
                color: Color(0xFF196AFF),
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('안녕하세요 저는 의사입니다. 비대면의료 플랫폼 닥터루시드를 출시합니다.본문에\n소개 부분을 보여줄...',
              style: SLTextStyle(
                style: SLStyle.Text_S_Medium,
                color: SLColor.neutral.shade30,
              ).textStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(padding: EdgeInsets.only(top: 28)),
              Text('답변7',
                  style: SLTextStyle(
                    style: SLStyle.Text_XS_Regular,
                    color: SLColor.neutral.shade50,
                  ).textStyle),
            ],
          ),
        ],
      ),
    );
  }
}
