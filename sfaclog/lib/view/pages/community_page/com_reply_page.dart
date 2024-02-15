import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/com_reply_wigets/com_reply_appbars.dart';

class ComReplayPage extends StatelessWidget {
  const ComReplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = 361; // Set your desired value
    double screenWidth = 195; // Set your desired value
    double OptionFontSize = 14;

    return Scaffold(
      appBar: ComReplyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              title: Text(
                '🇶 iptime 포트포워딩',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text('자세히 보려면 화살표를 누르세요...'),
              children: <Widget>[
                ListTile(
                    title: Text(
                  '얼마전에 집안에 공유기를 모두 iptime으로 변경했는데,포트포워딩이 제대로 안되었는지 내부접속은 되는데외부접속이 안되네요\n\n혹시 아래처럼 하는게 뭐 잘못된건가요?\n내부 IP는 모두 나스의 IP를 넣어놨습니다',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )),
              ],
            ),
            TextField(
              maxLines: null, // 다중 라인으로 입력 받기 위한 설정
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '질문에 대한 답변을 남겨주세요',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
