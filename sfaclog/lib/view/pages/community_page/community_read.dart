import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read.appbar.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_card.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_header_wiget.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_reple.dart';

import 'package:sfaclog_widgets/labels/log_label.dart';
import 'package:sfaclog_widgets/buttons/edit_button.dart';

class ComReadPage extends StatelessWidget {
  const ComReadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ComReadAppBarWidget(),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ComReadingHeader(),
                  Divider(height: 1, color: Color(0xFF333333)),
                  ComReple(),
                  Divider(height: 1, color: Color(0xFF333333)),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('다른 질문 둘러보기'),
                  ),
                  Container(
                    // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
                    margin: EdgeInsets.all(20),
                    // 컨테이너의 높이를 200으로 설정
                    height: 200.0,
                    // 리스트뷰 추가
                    child: ListView(
                      // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                      scrollDirection: Axis.horizontal,
                      // 컨테이너들을 ListView의 자식들로 추가
                      children: [
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
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        EditButton(
                            text: '알림받기',
                            width: 125,
                            height: 39,
                            imagePath: 'assets/images/Rectangle 1 (2).png'),
                        reviselabel(
                          width: 160,
                          height: 40,
                          text: '답변하기',
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
