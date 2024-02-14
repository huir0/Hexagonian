import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../../data/datasource/pocketbase_auth.dart';
import '../../../data/datasource/remote_datasource.dart';
import '../../../model/users_model.dart';
import '../../../viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import '../../router.dart';

const List<String> complaints = [
  'UX/UI가 불편해서 사용하기 어려워요',
  '광고가 너무 많아서 복잡해요',
  '잘 사용하지 않아서 지우고 싶어요',
  '개인정보가 걱정되어서 탈퇴해요',
  '중복 계정이 존재해요',
  '기타 (직접 입력할래요)',
];

class MypageWithdrawal extends ConsumerStatefulWidget {
  const MypageWithdrawal({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  ConsumerState<MypageWithdrawal> createState() => _MypageWithdrawalState();
}

class _MypageWithdrawalState extends ConsumerState<MypageWithdrawal> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  bool btnEnabled = false;
  final password = TextEditingController();
  UsersModel userInfo = UsersModel(id: '', email: '', name: '');

  Future<void> _init() async {
    var newUsersInfo = await ref
        .read(MyPageProfileProvider.notifier)
        .getUsersInfo(widget.userId);

    setState(() {
      userInfo = newUsersInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
    password.addListener(updateButtonState);
  }

  @override
  void dispose() {
    password.removeListener(updateButtonState);
    super.dispose();
  }

  void updateButtonState() {
    setState(() {
      btnEnabled = password.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        centerTitle: true,
        title: Text(
          '회원탈퇴',
          style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 360,
          height: 740 - 85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 23),
                height: 27,
                child: Text(
                  '⚠ ️주의해주세요!',
                  style:
                      SLTextStyle.Text_XL_Bold?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 23, right: 25),
                child: Text(
                  '''탈퇴시 삭제된 정보는 복구가 불가능합니다.
          
불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의불편함을 해결해 드릴수 있도록 노력하는 스팩로그가 되겠습니다. 
          ''',
                  style: SLTextStyle.Text_M_Regular?.copyWith(
                    color: SLColor.neutral[20],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25),
                alignment: Alignment.centerLeft,
                height: 17,
                child: Text(
                  '무엇이 불편하셨나요?',
                  style: SLTextStyle.Text_M_Bold?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 312,
                child: SFACSelectMenuButton(
                    itemWidth: 312,
                    height: 52,
                    initialValue: '불편하셨던 점을 선택해주세요',
                    items: complaints,
                    onItemSelected: (index) {
                      print(index);
                    }),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                width: 312,
                height: 46,
                child: SLInput(
                  hintText: '불편함 점을 직접 입력해주세요',
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                alignment: Alignment.centerLeft,
                height: 17,
                child: Text(
                  '비밀번호 입력',
                  style: SLTextStyle.Text_M_Bold?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SFACTextField(
                border: Border.all(color: SLColor.neutral[70]!),
                height: 46,
                width: 312,
                controller: password,
                onChanged: (p0) {
                  updateButtonState();
                },
                hintText: '현재 비밀번호를 입력해주세요',
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 28,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SFACPopUpDialog(
                                widget: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '정말 탈퇴하시나요?',
                                        style:
                                            SLTextStyle.Text_L_Bold?.copyWith(
                                                color: SLColor.neutral[100]),
                                      ),
                                      Text(
                                        '회원님의 정보가 삭제됩니다.',
                                        style:
                                            SLTextStyle.Text_S_Medium?.copyWith(
                                                color: SLColor.neutral[100]),
                                      ),
                                    ],
                                  ),
                                ),
                                onCanceled: () {
                                  context.pop();
                                },
                                onConfirmed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SFACPopUpDialog(
                                            widget: Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '회원탈퇴',
                                                    style: SLTextStyle
                                                            .Text_L_Bold
                                                        ?.copyWith(
                                                            color: SLColor
                                                                .neutral[100]),
                                                  ),
                                                  Text(
                                                    '회원 탈퇴가 완료되었습니다.',
                                                    style: SLTextStyle
                                                            .Text_S_Medium
                                                        ?.copyWith(
                                                            color: SLColor
                                                                .neutral[100]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onConfirmed: () async {
                                              PocketbaseAuth().logout();
                                              await _remoteDataSource
                                                  .deleteRecord(
                                                      'users', userInfo.id);
                                              router.go('/login');
                                            });
                                      });
                                });
                          });
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
                        '탈퇴하기',
                        style: SLTextStyle.Text_M_Bold?.copyWith(
                          color:
                              btnEnabled ? Colors.white : SLColor.neutral[60],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
