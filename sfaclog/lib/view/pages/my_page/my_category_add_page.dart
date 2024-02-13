import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';

class MypageAddCategory extends StatelessWidget {
  const MypageAddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = TextEditingController();
    const bool select = false;

    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '카테고리 추가',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                // TODO: 저장
                Navigator.pop(context);
              },
              child: Text(
                '확인',
                style: SLTextStyle.Text_L_Regular?.copyWith(
                    color: SLColor.neutral[20]),
              ),
            ),
          )
        ],
      ),
      body: Container(
        // width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 21,
            ),
            Container(
              height: 49,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Text(
                    '카테고리 이름',
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 65,
                    child: TextField(
                      controller: categoryName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: '입력해 주세요',
                        hintStyle: SLTextStyle.Text_S_Regular?.copyWith(
                          color: SLColor.neutral[50],
                          letterSpacing: -0.12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: SLColor.neutral[80],
            ),
            const SizedBox(height: 4,),
            Container(
              height: 49,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '공개설정',
                style: SLTextStyle.Text_M_Medium?.copyWith(color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                // TODO: 둘 중 하나만 선택되게
                children: [
                  SLCheckbox(onChange: (e) {print(e);}, value: select),
                  const SizedBox(width: 4,),
                  const Text('전체공개'),
                  const SizedBox(width: 34,),
                  SLCheckbox(onChange: (e) {}, value: select),
                  const SizedBox(width: 4,),
                  const Text('비공개'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
