import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/pages/my_page/my_email_page.dart';
import 'package:sfaclog/view/pages/my_page/my_mobile_page.dart';
import 'package:sfaclog/view/pages/my_page/my_password_page.dart';

import '../../../common.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';

class MypageAccount extends ConsumerWidget {
  const MypageAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
        scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              final currentTab = ref.read(myPageProvider).tab;
              ref.read(myPageProvider.notifier).tabChanged(currentTab);
              // router.go('/my');
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          ),
          centerTitle: true,
          title: Text(
            '계정',
            style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(
              left: 25,
            ),
            height: 22,
            child: Text(
              '내 가입 정보',
              style: SLTextStyle.Text_L_Bold?.copyWith(color: Colors.white),
            ),
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: const Row(
                    children: [
                      // FIXME: 유저정보 불러와서 집어넣기
                      Text('계정정보'),
                      Spacer(),
                      SizedBox(
                        width: 55,
                        height: 22,
                        child: Text('신규가입'),
                      ),
                    ],
                  )),
            ),
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MypageChangeEmail(),
                  ),
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      const Text('이메일 변경'),
                      const Spacer(),
                      const SizedBox(
                        width: 134,
                        height: 22,
                        // FIXME: 데이터 불러오기
                        child: Text(
                          '이메일주소',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MypageChangeMobile(),
                  ),
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      const Text('휴대폰 번호 변경'),
                      const Spacer(),
                      const SizedBox(
                        width: 134,
                        height: 22,
                        // FIXME: 데이터 불러오기
                        child: Text('전화번호'),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MypageChangePassword(),
                  ),
                );
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      const Text('비밀번호 변경'),
                      const Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
