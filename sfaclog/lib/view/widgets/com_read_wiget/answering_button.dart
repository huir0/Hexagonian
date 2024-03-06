import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/main_page_widgets/line_deco_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class AnsweringButton extends StatelessWidget {
  const AnsweringButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const SLInput(
                        hintText: '내용을 입력해주세요. 최대 500자까지 가능합니다',
                        maxLines: 5,
                        borderColor: Colors.transparent,
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Text(
        '답글달기',
        style: SLTextStyle(
          style: SLStyle.Text_S_Bold,
          color: SLColor.neutral.shade50,
        ).textStyle,
      ),
    );
  }
}
