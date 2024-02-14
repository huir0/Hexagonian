import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class GithubLoginButton extends ConsumerWidget {
  const GithubLoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        try {
          // final authData =
          //     await ref.read(pocketbaseAuthProvider).signinWithOAuth2(
          //           'github',
          //         );
          // ref.read(oAuth2Provider.notifier).setOAuthData(authData);
        } catch (e) {
          print('깃허브로그인 실패: $e');
        }
      },
      child: const SLCircleIconButton(
        width: 50,
        height: 50,
        image: 'assets/images/github.png',
      ),
    );
  }
}
