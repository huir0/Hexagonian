import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';
import 'package:html/parser.dart';
import 'package:sfaclog/view/widgets/common_widgets/tag_widget.dart';

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
  final String respondent = '프레드윰'; //@todo 최근 답변 순으로 답변자 이름 얻도록 하기
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  parseHtmlString(widget.qnaData.content),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                      Map<String, dynamic> tag =
                          widget.qnaData.expand['tag'][index];
                      return TagWidget(
                        label: tag['name'],
                      );
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
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart_red.svg',
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.qnaData.like}',
                              style: SLTextStyle(
                                      style: SLStyle.Text_S_Medium,
                                      color: SLColor.neutral.shade50)
                                  .textStyle,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/bookmark_outline.svg',
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '680',
                              style: SLTextStyle(
                                style: SLStyle.Text_S_Medium,
                                color: SLColor.neutral.shade50,
                              ).textStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '조회 ${widget.qnaData.view}',
                      style: SLTextStyle(
                        style: SLStyle.Text_S_Medium,
                        color: SLColor.neutral.shade50,
                      ).textStyle,
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

String parseHtmlString(String htmlString) {
  try {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  } catch (e) {
    return htmlString;
  }
}
