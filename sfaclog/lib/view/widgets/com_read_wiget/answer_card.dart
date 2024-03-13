import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/replying_button.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/answer_reply_card.dart';
import 'package:intl/intl.dart';
import 'package:sfaclog/model/answer_reply_model.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/reply_provider.dart';

class AnswerCard extends ConsumerStatefulWidget {
  const AnswerCard({
    super.key,
    required this.answer,
  });
  final QnaAnswerModel answer;

  @override
  ConsumerState<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends ConsumerState<AnswerCard> {
  List<AnswerReplyModel>? answerReplyList;

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    answerReplyList = await ref
        .read(replyProvider.notifier)
        .getAnswersReplyList(widget.answer.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  child: Image.asset(
                    'assets/images/basic_profile_sm.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.answer.expand?['user']?['nickname'] ?? 'Unknown',
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Medium,
                  ).textStyle,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  DateFormat('yyyy.MM.dd').format(
                    DateTime.parse(widget.answer.created),
                  ),
                  style: SLTextStyle(
                    style: SLStyle.Text_S_Regular,
                    color: SLColor.neutral.shade50,
                  ).textStyle,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.more_vert,
                  color: SLColor.neutral.shade50,
                ),
              ],
            ),
          ],
        ),
        Html(
          data: widget.answer.content,
          style: {
            "body": Style(
              fontSize: FontSize(14),
              margin: Margins.zero,
            ),
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReplyingButton(
              answerId: widget.answer.id,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14,
                  height: 13,
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    height: 10,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  widget.answer.like.toString(),
                  style: SLTextStyle(
                    style: SLStyle.Text_XS_Medium,
                    color: SLColor.neutral.shade30,
                  ).textStyle,
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 8),
        answerReplyList != null
            ? RepleListView(answerReplyList: answerReplyList)
            : const CircularProgressIndicator(),
      ],
    );
  }
}

class RepleListView extends StatelessWidget {
  const RepleListView({
    super.key,
    required this.answerReplyList,
  });

  final List<AnswerReplyModel>? answerReplyList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        if (answerReplyList!.isNotEmpty)
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.subdirectory_arrow_right_rounded,
                      color: SLColor.neutral.shade70,
                    ),
                    AnswerReplyCard(
                      reple: answerReplyList![index],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: answerReplyList?.length ?? 0,
            ),
          ),
      ],
    );
  }
}
