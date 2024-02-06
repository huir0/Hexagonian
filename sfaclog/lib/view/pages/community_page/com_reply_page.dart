import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/com_reply_wigets/com_reply_appbars.dart';

class ComReplayPage extends StatelessWidget {
  const ComReplayPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = 361; // Set your desired value
    double screenWidth = 195; // Set your desired value
    double OptionFontSize = 14;

    return Scaffold(
      appBar: ComReplyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   width: 20,
                //   height: 20,
                //   child: Image.asset('assets/images/Q.png'),
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                // Text('IPTIME 포트포워딩'),
                // SizedBox(
                //   width: 160,
                // ),
                // Container(
                //   width: 20,
                //   height: 20,
                //   child: Image.asset('assets/images/chevron-down.png'),
                // ),
              ],
            ),
            TextField(
              maxLines: null, // 다중 라인으로 입력 받기 위한 설정
              decoration: InputDecoration(
                hintText: '질문에 대한 답변을 남겨주세요',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
