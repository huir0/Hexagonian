import 'package:flutter/material.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/viewmodel/auth/oauth2_auth_notifier.dart';

class KakaoLoginButton extends ConsumerWidget {
  const KakaoLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        try {
          final authData =
              await ref.read(pocketbaseAuthProvider).signinWithOAuth2(
                    'kakao',
                  );
          ref.read(oAuth2Provider.notifier).setOAuthData(authData);
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
