import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/qna_answer_model.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/answer_card.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_reple_card.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class AnswerSecion extends StatelessWidget {
  const AnswerSecion({
    super.key,
    this.answers,
  });
  final List<QnaAnswerModel>? answers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '답변',
                      style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: Colors.white,
                      ).textStyle,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${answers?.length}개',
                      style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: SLColor.neutral.shade30,
                      ).textStyle,
                    ),
                  ],
                ),
                SFACMenuButton(
                  items: optionList,
                  onItemSelected: (value) {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            answers == [] || answers == null
                ? const Center(
                    child: Text(
                      '아직 답변이 없습니다.',
                    ),
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return AnswerCard(answer: answers![index]);
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 1);
                    },
                    itemCount: answers!.length,
                  ),
            const AnsweringButton(),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.all(5)),
                SizedBox(
                    width: 14,
                    height: 13,
                    child: Image.asset('assets/images/Vector 4850.png')),
                const ComReadCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnsweringButton extends StatelessWidget {
  const AnsweringButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 500,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF1A1A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 30),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                Text(
                                  '댓글 작성하기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                reviselabel(
                                  text: '완료',
                                  width: 39,
                                  height: 18,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: 312,
                                height: 131,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF020202),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const TextField(
                                  maxLines: null, // 다중 라인으로 입력 받기 위한 설정
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '   내용을 입력해주세요. 최대 500까지 가능합니다',
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text('답글달기')),
        Row(
          children: [
            SizedBox(
                width: 14,
                height: 13,
                child: Image.asset('assets/images/Vector (1).png')),
            Text(
              '  3 ',
              style: SLTextStyle(
                style: SLStyle.Text_XS_Medium,
                color: SLColor.neutral.shade30,
              ).textStyle,
            ),
          ],
        )
      ],
    );
  }
}
