import 'package:flutter/material.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';

class MypageAddLink extends StatelessWidget {
  const MypageAddLink({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '링크 추가',
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
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '링크 연결',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'https://',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '제목',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                  const Spacer(),
                  Text(
                    '${title.text.length}/50',
                    style: SLTextStyle.Text_S_Medium?.copyWith(
                      color: SLColor.neutral[50],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'ex) 김개발의 포트폴리오',
              hintTextColor: SLColor.neutral[60]!,
            ),
          ],
        ),
      ),
    );
  }
}

class MypageEditLink extends StatelessWidget {
  const MypageEditLink({
    super.key,
    required this.linkId,
  });
  final String linkId;
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '링크 편집',
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
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '링크 연결',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'https://',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '제목',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                  const Spacer(),
                  Text(
                    '${title.text.length}/50',
                    style: SLTextStyle.Text_S_Medium?.copyWith(
                      color: SLColor.neutral[50],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'ex) 김개발의 포트폴리오',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                // TODO: delete logic
              },
              child: Container(
                width: 63,
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
                child: const Text('링크 삭제'),
              ),
            ),
            const SizedBox(height: 63),
          ],
        ),
      ),
    );
  }
}
