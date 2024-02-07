import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/buttons/drop_button.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';

class MypageChangeEmail extends StatefulWidget {
  const MypageChangeEmail({super.key});

  @override
  State<MypageChangeEmail> createState() => _MypageChangeEmailState();
}

class _MypageChangeEmailState extends State<MypageChangeEmail> {
  final newEmail = TextEditingController();
  bool btnEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
        scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              // final currentTab = ref.read(myPageProvider).tab;
              // ref.read(myPageProvider.notifier).tabChanged(currentTab);
              // router.go('/my');
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          ),
          centerTitle: true,
          title: Text(
            '이메일 변경',
            style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(
                left: 23,
              ),
              height: 16,
              child: Text(
                '현재 이메일 주소',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                // FIXME: 계정 연동해서 이메일 주소 보여주기
                hintText: 'test@test.com',
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.only(left: 23),
              height: 16,
              child: Text(
                '새로운 이메일 주소',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                controller: newEmail,
                // FIXME: 계정 연동해서 이메일 주소 받기
                hintText: 'example@example.com',
                validator: (txt) {
                  if (txt != null) {
                    setState(() {
                      btnEnabled = true;
                    });
                  }
                  return null;
                },
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 28,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              child: btnEnabled
                  ? applyButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text1: '변경하기',
                      width: 312,
                      height: 52,
                    )
                  : GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width: 312,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6),
                          color: SLColor.neutral[80],
                        ),
                        child: Text(
                          '저장하기',
                          style: SLTextStyle.Text_M_Bold?.copyWith(
                            color: SLColor.neutral[60],
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
