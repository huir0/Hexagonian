import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/answer_reply_model.dart';

class AnswerReplyCard extends StatelessWidget {
  const AnswerReplyCard({
    super.key,
    required this.reple,
  });
  final AnswerReplyModel reple;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 80,
      decoration: ShapeDecoration(
        color: SLColor.neutral,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/basic_profile_sm.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    reple.expand['author']['nickname'] ?? 'Unknown',
                    style: SLTextStyle(
                      style: SLStyle.Text_S_Bold,
                      color: Colors.white,
                    ).textStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    DateFormat('yyyy.MM.dd').format(
                      DateTime.parse(reple.created),
                    ),
                    style: SLTextStyle(
                      style: SLStyle.Text_XS_Regular,
                      color: SLColor.neutral.shade50,
                    ).textStyle,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: SLColor.neutral.shade50,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            reple.content,
            style: SLTextStyle(
              style: SLStyle.Text_M_Regular,
              color: SLColor.neutral.shade10,
            ).textStyle,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/Vector (1).png',
              ),
              const SizedBox(width: 4),
              Text(
                reple.like.toString(),
                style: SLTextStyle(
                  style: SLStyle.Text_XS_Regular,
                  color: SLColor.neutral.shade50,
                ).textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
