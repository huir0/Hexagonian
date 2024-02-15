import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/users_model.dart';
import 'package:sfaclog_widgets/buttons/answer_button.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../../viewmodel/my_profile_viewmodel/my_profile_notifier.dart';

class MypageChangeEmail extends ConsumerStatefulWidget {
  const MypageChangeEmail({
    super.key,
    required this.usersId,
  });
  final String usersId;

  @override
  ConsumerState<MypageChangeEmail> createState() => _MypageChangeEmailState();
}

class _MypageChangeEmailState extends ConsumerState<MypageChangeEmail> {
  RemoteDataSource _remoteDataSource = RemoteDataSource();
  final newEmail = TextEditingController();
  final currentEmail = TextEditingController();
  UsersModel userInfo = UsersModel(id: '', email: '', name: '');
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    var newUsersInfo = await ref
        .read(MyPageProfileProvider.notifier)
        .getUsersInfo(widget.usersId);

    setState(() {
      userInfo = newUsersInfo;
      currentEmail.text = userInfo.email;
    });
  }

  bool btnEnabled = false;
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
            '이메일 변경',
            style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                left: 23,
              ),
              height: 16,
              child: Text(
                '현재 이메일 주소',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SLInput(
                controller: currentEmail,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.only(left: 23),
              height: 16,
              child: Text(
                '새로운 이메일 주소',
                style: SLTextStyle.Text_S_Bold?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SFACTextField(
                controller: newEmail,
                height: 47,
                width: 312,
                border: Border.all(color: SLColor.neutral[70]!),
                hintText: 'example@example.com',
                onChanged: (txt) {
                  bool isEmail(String txt) {
                    String p = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                    RegExp regExp = new RegExp(p);
                    return regExp.hasMatch(txt);
                  }

                  if (isEmail(txt)) {
                    setState(() {
                      btnEnabled = true;
                    });
                  } else {
                    setState(() {
                      btnEnabled = false;
                    });
                  }
                },
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 28,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              child: btnEnabled
                  ? applyButton(
                      onPressed: () async {
                        final body = <String, dynamic>{"email": newEmail.text};
                        await _remoteDataSource.updateTableData(
                            'users', userInfo.id, body);
                        context.pop();
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
