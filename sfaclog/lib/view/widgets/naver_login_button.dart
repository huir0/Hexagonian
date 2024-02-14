import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class NaverLoginButton extends ConsumerWidget {
  const NaverLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        try {
          // final authData =
          //     await ref.read(pocketbaseAuthProvider).signinWithOAuth2(
          //           'naver',
          //         );
          // ref.read(oAuth2Provider.notifier).setOAuthData(authData);
        } catch (e) {
          print('네이버로그인 실패: $e');
        }
      },
      child: const SLCircleIconButton(
        width: 50,
        height: 50,
        image: 'assets/images/naver.png',
      ),
    );
  }
}
