import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class ComTileWiget extends StatefulWidget {
  final VoidCallback? onPressed;
  final SFACQnaModel qnaData;
  const ComTileWiget({
    super.key,
    this.onPressed,
    required this.qnaData,
  });

  @override
  State<ComTileWiget> createState() => _ComTileWigetState();
}

class _ComTileWigetState extends State<ComTileWiget> {
  final String respondent = '프레드윰';
  @override
  Widget build(BuildContext context) {
    print(widget.qnaData.expand['answer']?.length);

    return InkWell(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('💬 3시간전·',
                        style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            height: 0.17)),
                    Text('$respondent 님의 새로운 답변',
                        style: const TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                            height: 0.17)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(widget.qnaData.title,
                        style:
                            SLTextStyle(style: SLStyle.Text_M_Bold).textStyle),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'NEW', //@todo 가장 최근에 생성된 경우 'New' 키워드가 붙도록 수정
                      style: SLTextStyle(
                              color: SLColor.primary.shade90,
                              style: SLStyle.Text_S_Bold)
                          .textStyle,
                    ),
                  ],
                ),
                Text(
                  widget.qnaData.content,
                  style: SLTextStyle(style: SLStyle.Text_S_Medium).textStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 22,
                  child: ListView.separated(
                    itemCount: widget.qnaData.tag.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 4,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _TagWidget(
                          label: widget.qnaData.expand['tag'][index]['name']);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.qnaData.expand['answer'] != null
                              ? '답변 ${widget.qnaData.expand['answer']!.length}'
                              : '답변 0',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '🩷 ${widget.qnaData.like}',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('assets/images/Union (1).png'),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '680',
                          style: SLTextStyle(
                                  style: SLStyle.Text_S_Medium,
                                  color: SLColor.neutral.shade50)
                              .textStyle,
                        ),
                      ],
                    ),
                    Text(
                      '조회 ${widget.qnaData.view}',
                      style: SLTextStyle(
                              style: SLStyle.Text_S_Medium,
                              color: SLColor.neutral.shade50)
                          .textStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//@todo: mini log card에 있음. common widget으로 뽑아놓을것
class _TagWidget extends StatelessWidget {
  const _TagWidget({
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return SFACTag(
      text: Text(
        label,
        style: SLTextStyle(
          color: SLColor.neutral.shade60,
          style: SLStyle.Text_XS_Medium,
        ).textStyle,
      ),
    );
  }
}
