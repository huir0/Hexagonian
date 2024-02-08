import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/log_reply_model.dart';

class LogNestedReplyListTileWidget extends StatelessWidget {
  final LogReplyModel logReplyModel;
  const LogNestedReplyListTileWidget({super.key, required this.logReplyModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 286,
      height: 125,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 286,
              height: 126,
              decoration: ShapeDecoration(
                color: const Color(0xFF020202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
              left: 22,
              top: 53,
              child: SizedBox(
                child: Text(
                  logReplyModel.content,
                  style: SLTextStyle(
                          style: SLStyle.Text_M_Regular,
                          color: SLColor.neutral.shade10)
                      .textStyle,
                ),
              )),
          Positioned(
            top: 5,
            left: 10,
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const ShapeDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/basic_profile_sm.png'),
                          fit: BoxFit.cover,
                        ),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '서나정',
                      style: SLTextStyle(
                        style: SLStyle.Text_S_Bold,
                        color: Colors.white,
                      ).textStyle,
                    ),
                    Text(
                      '  수료생',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Medium,
                        color: SLColor.primary.shade90,
                      ).textStyle,
                    )
                  ],
                ),
                const SizedBox(
                  width: 110,
                ),
                Row(
                  children: [
                    Text(
                      '30분전',
                      style: SLTextStyle(
                        style: SLStyle.Text_XS_Regular,
                        color: SLColor.neutral.shade50,
                      ).textStyle,
                    ),
                    Image.asset(
                      'assets/images/more-vertical-f.png',
                      color: SLColor.neutral.shade50,
                    )
                    // more-vertical-f
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 10,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/Vector (1).png',
                ),
                Text(
                  ' 680',
                  style: SLTextStyle(
                    style: SLStyle.Text_XS_Regular,
                    color: SLColor.neutral.shade50,
                  ).textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
