import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/line_deco_widget.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/reply_provider.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ReplyingButton extends ConsumerStatefulWidget {
  const ReplyingButton({
    super.key,
    required this.answerId,
  });
  final String answerId;

  @override
  ConsumerState<ReplyingButton> createState() => _ReplyingButtonState();
}

class _ReplyingButtonState extends ConsumerState<ReplyingButton> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> createReply() async {
    final user = ref.read(authProvider).userInfo;
    final provider = await ref.read(replyProvider.notifier).createReply(
          controller.text,
          answerId: widget.answerId,
          userId: user['id'],
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            isDismissible: true,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                decoration: ShapeDecoration(
                  color: SLColor.neutral.shade90,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LineDecoWidget(
                      color: SLColor.neutral.shade70,
                      width: 38,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '댓글 작성하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SLButton(
                            text: '완료',
                            textStyle: SLTextStyle.Text_M_Medium,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            isActive: true,
                            onTap: () {
                              createReply();
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SLInput(
                        hintText: '내용을 입력해주세요. 최대 500자까지 가능합니다',
                        maxLines: 5,
                        borderColor: Colors.transparent,
                        controller: controller,
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Text(
        '댓글달기',
        style: SLTextStyle(
          style: SLStyle.Text_S_Bold,
          color: SLColor.neutral.shade50,
        ).textStyle,
      ),
    );
  }
}
