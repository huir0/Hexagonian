import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common.dart';
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
              context.pop();
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/account.svg'),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('계정'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset('assets/icons/folder.svg')),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('채용/프로젝트 제안 상태'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('알림'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: SvgPicture.asset(
                            'assets/icons/logout.svg',
                            width: 20,
                          )),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('로그아웃'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/withdraw.svg'),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('회원탈퇴'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/terms.svg'),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('이용약관'),
                      const Spacer(),
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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/privacy.svg'),
                      const SizedBox(
                        width: 24,
                      ),
                      const Text('개인정보 처리방침'),
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
