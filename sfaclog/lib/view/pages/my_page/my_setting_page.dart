import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/pages/my_page/my_account_page.dart';
import 'package:sfaclog/view/pages/my_page/my_notification_page.dart';
import 'package:sfaclog/view/pages/my_page/my_privacy_page.dart';
import 'package:sfaclog/view/pages/my_page/my_proposal_page.dart';
import 'package:sfaclog/view/pages/my_page/mye_terms_page.dart';
import 'package:sfaclog/view/pages/my_page/my_withdrawal_page.dart';

import '../../../common.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';

class MypageSetting extends ConsumerWidget {
  const MypageSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              // final currentTab = ref.read(myPageProvider).tab;
              // ref.read(myPageProvider.notifier).tabChanged(currentTab);
              router.go('/home');
              // context.pop();
            },
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          ),
          centerTitle: true,
          title: Text(
            '설정',
            style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
          ),
        ),
        body: Column(children: [
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/account');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/account.svg'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('계정'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/proposestate');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset('assets/icons/folder.svg')),
                      SizedBox(
                        width: 24,
                      ),
                      Text('채용/프로젝트 제안 상태'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/notification');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('알림'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: SvgPicture.asset(
                            'assets/icons/logout.svg',
                            width: 20,
                          )),
                      SizedBox(
                        width: 24,
                      ),
                      Text('로그아웃'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/withdrawal');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/withdraw.svg'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('회원탈퇴'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/terms');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/terms.svg'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('이용약관'),
                      Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                    ],
                  )),
            ),
          ),
          Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: SLColor.neutral[80]!),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                router.go('/my/setting/privacy');
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/privacy.svg'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('개인정보 처리방침'),
                      Spacer(),
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
