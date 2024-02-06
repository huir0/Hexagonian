import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/com_side_read_wigets/com_side_read_card.dart';

class ComSideReadFooter extends StatelessWidget {
  const ComSideReadFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Divider(thickness: 3, height: 3, color: Color(0xFF333333)),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Text(
              '모집중인 다른 프로젝트',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Container(
          // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
          margin: EdgeInsets.all(20),
          // 컨테이너의 높이를 200으로 설정
          height: 165.0,
          // 리스트뷰 추가
          child: ListView(
            // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
            scrollDirection: Axis.horizontal,
            // 컨테이너들을 ListView의 자식들로 추가
            children: [
              ComSideReadCard(),
              SizedBox(
                width: 10,
              ),
              ComSideReadCard(),
              SizedBox(
                width: 10,
              ),
              ComSideReadCard(),
            ],
          ),
        ),
      ],
    );
  }
}
