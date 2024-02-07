import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/buttons/drop_button.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';

class MypageChangePassword extends StatefulWidget {
  const MypageChangePassword({super.key});

  @override
  State<MypageChangePassword> createState() => _MypageChangePasswordState();
}

class _MypageChangePasswordState extends State<MypageChangePassword> {
  final passwordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
            '비밀번호 변경',
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
                '현재 비밀번호',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                obscureText: true,
                controller: passwordController,
                hintText: '비밀번호를 입력해주세요',
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.only(left: 23),
              height: 16,
              child: Text(
                '변경할 비밀번호',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              height: 46,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                controller: newPasswordController,
                hintText: '변경할 비밀번호를 입력해주세요',
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
            SizedBox(
              height: 14,
            ),
            Container(
              height: 46,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                controller: confirmPasswordController,
                hintText: '비밀번호를 다시 입력해주세요',
                validator: (txt) {
                  if (txt != null &&
                      confirmPasswordController.text ==
                          newPasswordController.text) {
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
              child: GestureDetector(
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
                      color: btnEnabled
                          ? SLColor.primary[100]
                          : SLColor.neutral[80],
                    ),
                    child: Text(
                      '변경하기',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: btnEnabled ? Colors.white : SLColor.neutral[60],
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
