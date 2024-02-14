import 'package:flutter/material.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/viewmodel/auth/oauth2_auth_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class KakaoLoginButton extends ConsumerWidget {
  const KakaoLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
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
      child: const SLCircleIconButton(
        width: 50,
        height: 50,
        image: 'assets/images/kakao.png',
      ),
    );
  }
}
