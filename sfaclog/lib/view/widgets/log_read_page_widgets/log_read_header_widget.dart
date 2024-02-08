import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReadHeaderWidget extends StatelessWidget {
  final SFACLogModel sfacLogModel;
  const LogReadHeaderWidget({
    super.key,
    required this.sfacLogModel,
  });

  String _handleCreatedTime(String createdTime) {
    DateTime givenTime = DateTime.parse(createdTime);
    DateTime currentTime = DateTime.now().toUtc();
    Duration difference = givenTime.difference(currentTime).abs();

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inMinutes < 59) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else {
      // 'yyyy-MM-dd HH:mm:ss' 포맷으로 날짜와 시간 표시
      return '${givenTime.year}/${givenTime.month.toString().padLeft(2, '0')}/${givenTime.day.toString().padLeft(2, '0')} ${givenTime.hour.toString().padLeft(2, '0')}:${givenTime.minute.toString().padLeft(2, '0')}:${givenTime.second.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 122,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Text(
              sfacLogModel.category,
              style: SLTextStyle(
                      style: SLStyle.Text_M_Regular,
                      color: SLColor.neutral.shade50)
                  .textStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              sfacLogModel.title,
              style: SLTextStyle(
                      style: SLStyle.Heading_M_Bold, color: Colors.white)
                  .textStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/avatars/avatar_17.svg',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Name',
                      style: SLTextStyle(style: SLStyle.Text_S_Bold).textStyle,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '수료생',
                      style: SLTextStyle(
                              style: SLStyle.Text_XS_Medium,
                              color: SLColor.primary)
                          .textStyle,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      _handleCreatedTime(sfacLogModel.created),
                      style:
                          SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle,
                    ),
                    const Text('·'),
                    Text(
                      '조회수 ${sfacLogModel.view}',
                      style:
                          SLTextStyle(style: SLStyle.Text_XS_Medium).textStyle,
                    ),
                  ],
                ),

                const reviselabel(
                  fontSize: 10,
                  width: 46,
                  height: 32,
                  text: '팔로우',
                ),

                //ElevatedButton(onPressed: () {}, child: const Text('팔로우'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
