import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/view/pages/community_page/com_reply_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read.appbar.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_card.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/question_header_widget.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_reple.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/question_body_widget.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/qna_provider.dart';

import 'package:sfaclog_widgets/labels/log_label.dart';
import 'package:sfaclog_widgets/buttons/edit_button.dart';

class ComReadPage extends ConsumerStatefulWidget {
  const ComReadPage({
    super.key,
    required this.id,
  });
  final String id;

  @override
  ConsumerState<ComReadPage> createState() => _ComReadPageState();
}

class _ComReadPageState extends ConsumerState<ComReadPage> {
  SFACQnaModel? question;
  List<QnaAnswerModel>? answers;
  UserInfo? author;

  @override
  void initState() {
    super.initState();
    initQna();
  }

  Future<void> initQna() async {
    final qnaNotifier = ref.read(qnaProvider.notifier);
    final question = await qnaNotifier.getOneQna(widget.id);
    if (question.answer.isNotEmpty) {
      answers = await Future.wait(question.answer.map((answer) async {
        final result = await qnaNotifier.getAnswerById(answer);
        return result;
      }).toList());
    } else {
      answers = [];
    }
    author =
        await ref.read(authProvider.notifier).getUserInfoById(question.user);

    setState(() {
      this.question = question;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (question == null || answers == null) {
      const CircularProgressIndicator();
    }
    return SafeArea(
      child: Scaffold(
        appBar: const ComReadAppBarWidget(),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (question != null || author != null)
                    Column(
                      children: [
                        QuestionHeaderWidget(
                          title: question!.title,
                          author: author!,
                          qna: question!,
                        ),
                        const Divider(height: 1, color: Color(0xFF333333)),
                        QuestionBodyWidget(
                          content: question!.content,
                          tags: question?.expand['tag'],
                        ),
                      ],
                    ),
                  const Divider(height: 3, color: Color(0xFF333333)),
                  ComReple(
                    answers: answers,
                  ),
                  const Divider(height: 1, color: Color(0xFF333333)),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      '다른 질문 둘러보기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
                    margin: const EdgeInsets.all(20),
                    // 컨테이너의 높이를 200으로 설정
                    height: 160.0,
                    // 리스트뷰 추가
                    child: ListView(
                      // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                      scrollDirection: Axis.horizontal,
                      // 컨테이너들을 ListView의 자식들로 추가
                      children: const [
                        ComReadCard2(),
                        SizedBox(
                          width: 10,
                        ),
                        ComReadCard2(),
                        SizedBox(
                          width: 10,
                        ),
                        ComReadCard2(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const EditButton(
                            text: '알림받기',
                            width: 125,
                            height: 39,
                            imagePath: 'assets/images/Rectangle 1 (2).png'),
                        reviselabel(
                          width: 180,
                          height: 40,
                          text: '답변하기',
                          fontSize: 14,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ComReplayPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
