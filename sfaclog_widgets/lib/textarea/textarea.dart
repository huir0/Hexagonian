import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/textarea/sl_input2.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset('assets/images/add.png'),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: 282, // 원하는 너비로 설정
            height: 40, // 원하는 높이로 설정
            child: SLInput2(
              hintText: ' ',
              suffix: Image.asset(
                'assets/images/paper-plane.png', // 아이콘 이미지 파일의 경로를 지정해주세요.
                width: 24, // 이미지의 폭을 조정하여 아이콘의 크기를 변경할 수 있습니다.
                height: 24, // 이미지의 높이를 조정하여 아이콘의 크기를 변경할 수 있습니다.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
