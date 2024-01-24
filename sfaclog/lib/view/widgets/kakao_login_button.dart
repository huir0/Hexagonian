import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/viewmodel/auth/kakao_auth/kakao_login_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/viewmodel/auth/kakao_auth/kakao_login_state.dart';

class KakaoLoginButton extends ConsumerWidget {
  const KakaoLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? userData;
    print(userData);
    return GestureDetector(
      onTap: () async {
        try {
          ref.read(kakaoLoginProvider.notifier).kakaoLogin();

          if (ref.read(kakaoLoginProvider).authStatus ==
              SNSAuthStatus.success) {
            userData = ref.read(kakaoLoginProvider).userInfo;
            ref.read(pocketbaseAuthProvider).setUserDataPbFromKakao(userData!);
          }
        } catch (e) {
          print('카카오로그인 실패: $e');
        }
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(
          'assets/images/kakao.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
