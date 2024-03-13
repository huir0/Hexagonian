import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:sfaclog/view/widgets/com_reply_wigets/com_reply_appbars.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/answer_provider.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/qna_provider.dart';

class AnswerWritePage extends ConsumerStatefulWidget {
  const AnswerWritePage({
    super.key,
    required this.data,
  });
  final SFACQnaModel data;

  @override
  ConsumerState<AnswerWritePage> createState() => _AnswerWritePageState();
}

class _AnswerWritePageState extends ConsumerState<AnswerWritePage> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void createAnswer() {
    final createAnswerProvider = ref.read(answerProvider.notifier);
    final userInfo = ref.watch(authProvider).userInfo;
    createAnswerProvider.createAnswer(
      answer: controller.text,
      qnaId: widget.data.id,
      userId: userInfo['id'],
    );

    ref.read(qnaProvider.notifier).getOneQna(widget.data.id);

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComReplyAppBar(
        onTap: createAnswer,
      ),
      body: ListView(
        children: [
          Divider(
            color: SLColor.neutral.shade70,
            height: 1,
          ),
          ExpansionTile(
            shape: const Border(),
            iconColor: Colors.white,
            title: Row(
              children: [
                const Icon(
                  Icons.question_mark_rounded,
                  color: SLColor.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.data.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            children: <Widget>[
              ListTile(
                title: Html(
                  data: widget.data.content,
                  style: {
                    "body": Style(
                      fontSize: FontSize(14),
                      margin: Margins.zero,
                    ),
                  },
                ),
              ),
            ],
          ),
          Divider(
            color: SLColor.neutral.shade70,
            height: 1,
          ),
          TextField(
            controller: controller,
            maxLines: null, // 다중 라인으로 입력 받기 위한 설정
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '질문에 대한 답변을 남겨주세요',
              hintStyle: SLTextStyle(
                style: SLStyle.Text_M_Regular,
                color: SLColor.neutral.shade70,
              ).textStyle,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
