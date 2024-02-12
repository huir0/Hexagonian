import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/pages/login_page/login_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStatus = ref.watch(authProvider).authStatus;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => authStatus == AuthStatus.authenticated
              ? const MainPage()
              : const LoginPage(),
        ),
        (route) => route.isFirst,
      );
    });

    return const Scaffold(
      body: Center(
        child: Text('스팩로그'),
      ),
    );
  }
}
