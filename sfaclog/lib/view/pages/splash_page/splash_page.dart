import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/view/app_wrapper.dart';
import 'package:sfaclog/view/pages/login_page/login_page.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToNextPage() {
    final authStatus = ref.read(authProvider).authStatus;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => authStatus == AuthStatus.authenticated
            ? const AppWrapper()
            : const LoginPage(),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/splash.json',
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward()
              ..addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  navigateToNextPage();
                }
              });
          },
        ),
      ),
    );
  }
}
