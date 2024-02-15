import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/profile_model.dart';
import 'package:sfaclog/model/users_model.dart';
import 'package:sfaclog/viewmodel/my_profile_viewmodel/my_profile_notifier.dart';

import '../../../common.dart';

class MypageAccount extends ConsumerStatefulWidget {
  const MypageAccount({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  ConsumerState<MypageAccount> createState() => _MypageAccountState();
}

class _MypageAccountState extends ConsumerState<MypageAccount> {
  UsersModel userInfo = UsersModel(id: '', email: '', name: '');
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    var newUsersInfo = await ref
        .read(MyPageProfileProvider.notifier)
        .getUsersInfo(widget.userId);

    setState(() {
      userInfo = newUsersInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child:  Row(
                    children: [
                      // FIXME: 유저정보 불러와서 집어넣기
                      Text(userInfo.email),
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
                context.push('/my/setting/account/${widget.userId}/email/${widget.userId}');
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      const Text('이메일 변경'),
                      const Spacer(),
                       SizedBox(
                        width: 134,
                        height: 22,
                        // FIXME: 데이터 불러오기
                        child: Text(
                          userInfo.email,
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
                context.push('/my/setting/account/${widget.userId}/mobile/');
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Row(
                    children: [
                      const Text('휴대폰 번호 변경'),
                      const Spacer(),
                      const SizedBox(
                        width: 134,
                        height: 22,
                        // FIXME: 데이터 불러오기
                        child: Text('010-1234-5678'),
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
                context.push('/my/setting/account/${widget.userId}/password/');
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
