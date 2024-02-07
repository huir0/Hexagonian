import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog_widgets/buttons/drop_button.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';

class MypageChangeMobile extends StatefulWidget {
  const MypageChangeMobile({super.key});

  @override
  State<MypageChangeMobile> createState() => _MypageChangeMobileState();
}

class _MypageChangeMobileState extends State<MypageChangeMobile> {
  final mobileNumber = TextEditingController();
  final codeNumber = TextEditingController();
  bool btnEnabled = false;
  bool codeSent = false;
  bool condition = false;
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
              context.pop();
            },
            icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          ),
          centerTitle: true,
          title: Text(
            '휴대폰 번호 변경',
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
                '휴대폰 번호',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                controller: mobileNumber,
                hintText: '변경할 휴대폰 번호를 입력해주세요',
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
              height: 32,
            ),
            codeSent
                ? Container(
                    padding: EdgeInsets.only(
                      left: 23,
                    ),
                    child: Text(
                      '인증번호',
                      style: SLTextStyle.Text_S_Bold?.copyWith(
                          color: Colors.white),
                    ),
                  )
                : Text(''),
            SizedBox(
              height: 14,
            ),
            codeSent
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    // FIXME: textfieldform 바꾸거나 validator관련된 거 바꿔야할듯?
                    child: SLInput(
                      controller: codeNumber,
                      hintText: '인증번호를 입력해주세요',
                      validator: (txt) {
                        if (txt != null) {
                          setState(() {
                            btnEnabled = true;
                          });
                        }
                        return null;
                      },
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 16,
            ),
            codeSent
                ? Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '인증번호 재전송',
                          style: SLTextStyle.Text_L_Medium?.copyWith(
                            color: SLColor.primary[100],
                          ),
                        )),
                  )
                : SizedBox(),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 28,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              child: GestureDetector(
                  onTap: () {
                    if (mobileNumber.text.isNotEmpty) {
                      if (!codeSent) {
                        setState(() {
                          codeSent = true;
                          btnEnabled = false;
                        });
                      } else {}
                    }
                  },
                  child: Container(
                    height: 52,
                    width: 312,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6),
                      color: btnEnabled || codeNumber.text.isNotEmpty
                          ? SLColor.primary[100]
                          : SLColor.neutral[80],
                    ),
                    child: Text(
                      '인증번호 받기',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: codeNumber.text.isNotEmpty
                            ? Colors.white
                            : SLColor.neutral[60],
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
