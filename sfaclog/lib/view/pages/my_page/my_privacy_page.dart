import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common.dart';

class MypagePrivacy extends ConsumerStatefulWidget {
  const MypagePrivacy({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MypagePrivacyState();
}

class _MypagePrivacyState extends ConsumerState<MypagePrivacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          '개인정보 처리방침',
          style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
              height: 52,
              width: 312,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: SLColor.neutral[80],
              ),
              child: Text(
                '개인정보 처리방침',
                style: SLTextStyle.Text_L_Bold?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: 305,
              height: 462,
              child: Stack(
                children: [
                  Container(
                    child: SingleChildScrollView(
                        child: Text(
                      '''[스팩로그 개인정보처리방침]


스팩로그는 사용자의 개인정보를 중요하게 생각하며, 이를 보호하기 위해 최선의 노력을 다하고 있습니다. 본 개인정보처리방침은 스팩로그가 제공하는 서비스를 이용하시는 분들의 개인정보를 어떻게 수집, 사용, 보호하는지에 대한 정보를 제공합니다. 개인정보처리방침은 법령 및 지침의 변경에 따라 수시로 개정될 수 있으므로, 이를 확인하시어 주기적으로 참고하시기 바랍니다.

수집하는 개인정보 항목
스팩로그는 블로그 서비스를 제공함에 따라 다음과 같은 개인정보를 수집할 수 있습니다.
필수정보: 사용자 아이디, 비밀번호, 이메일 주소
선택정보: 프로필 사진, 닉네임, 블로그 주소 등 사용자가 직접 입력하는 정보
서비스 이용 기록: 로그인 기록, 블로그 작성 기록, 댓글 작성 기록, IP 주소, 쿠키, 서비스 이용에 관한 통계 등

개인정보의 수집 및 이용 목적
스팩로그는 수집한 개인정보를 다음과 같은 목적으로 이용합니다.
회원제 서비스 제공: 블로그 작성, 댓글 작성, 커뮤니티 활동 등을 위한 회원 제공
서비스 개선 및 개인맞춤 서비스 제공: 이용자들에게 최적화된 서비스 제공을 위해 통계 및 분석에 활용
이벤트 및 광고 정보 제공: 새로운 서비스, 이벤트, 광고 등의 정보 제공 및 홍보
개인정보의 보유 및 보관 기간
[스팩로그]는 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관련 법령에 따라 일정 기간 동안 보관할 필요가 있는 경우 해당 기간 동안 보관하고 안전하게 처리합니다.
개인정보의 제3자 제공
[스팩로그]는 사용자의 동의 없이는 개인정보를 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
법령의 규정에 따라 수사, 조사, 사법기관의 요청이 있는 경우
서비스 제공에 필요한 업무를 외부에 위탁하는 경우
개인정보의 안전성 확보 조치
[스팩로그]는 개인정보보호를 위한 다양한 기술적, 관리적, 물리적 조치를 취하여 사용자의 개인정보를 안전하게 관리하고 있습니다.
사용자의 권리와 의무
사용자는 언제든지 자신의 개인정보를 열람, 정정, 삭제할 수 있습니다. 또한 개인정보 수집 및 이용에 대한 동의 철회도 가능합니다.
개인정보 보호책임자 및 연락처
[스팩로그]는 사용자의 개인정보보호를 위해 개인정보 보호책임자를 지정하고 있습니다. 개인정보와 관련된 문의사항 및 불만사항은 아래의 연락처로 문의하시기 바랍니다.
개인정보 보호책임자: [성명]
이메일 주소: [이메일 주소]
전화번호: [전화번호]
본 개인정보처리방침은 2024년 [월] [일]부터 시행되며, 이후 변경되는 사항에 대해서는 별도의 통지 없이 변경될 수 있습니다. 최신 버전의 개인정보처리방침은 [스팩로그] 블로그에서 확인하실 수 있습니다.

            
            
            ''',
                      style: SLTextStyle.Text_S_Medium?.copyWith(
                        color: SLColor.neutral[20],
                      ),
                    )),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 359,
                      height: 140,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.04, 1.00),
                          end: Alignment(-0.04, -1),
                          colors: [Color(0xFF1A1A1A), Color(0x001A1A1A)],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 6,
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4),
                              color: SLColor.primary,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/check.svg',
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '동의',
                            style: SLTextStyle.Text_M_Medium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: SLColor.neutral[70],
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '거부',
                            style: SLTextStyle.Text_M_Medium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
