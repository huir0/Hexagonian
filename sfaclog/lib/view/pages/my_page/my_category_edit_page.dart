import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';

class MypageEditCategory extends StatelessWidget {
  const MypageEditCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = TextEditingController();
    final bool select = false;

    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '카테고리 편집',
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
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 21,
            ),
            Container(
              height: 49,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Text(
                    '카테고리 이름',
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 65,
                    child: TextField(
                      controller: categoryName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // TODO: 연결된 카테고리 이름 보여주기
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
            SizedBox(
              height: 4,
            ),
            Container(
              height: 49,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '공개설정',
                style: SLTextStyle.Text_M_Medium?.copyWith(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                // TODO: 둘 중 하나만 선택되게
                children: [
                  SLCheckbox(
                      onChange: (e) {
                        print(e);
                      },
                      value: select),
                  SizedBox(
                    width: 4,
                  ),
                  Text('전체공개'),
                  SizedBox(
                    width: 34,
                  ),
                  SLCheckbox(onChange: (e) {}, value: select),
                  SizedBox(
                    width: 4,
                  ),
                  Text('비공개'),
                ],
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(bottom: 56),
              width: 84,
              height: 34,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SLColor.neutral[30]!,
                  ),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // TODO: delete logic
                },
                child: Text(
                  '카테고리 삭제',
                  style: SLTextStyle.Text_S_Bold?.copyWith(
                      color: SLColor.neutral[30], letterSpacing: -0.28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
