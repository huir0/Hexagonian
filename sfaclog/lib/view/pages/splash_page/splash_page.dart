import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/view/app_wrapper.dart';
import 'package:sfaclog/view/pages/login_page/login_page.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';
import 'package:lottie/lottie.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});
  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  List<SFACLogModel> popularLogList = [];
  List<SFACLogModel> newLogList = [];
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

  Future<void> setInitData() async {
    await ref.read(programsProvider.notifier).getPrograms();

    popularLogList = await ref.read(logProvider.notifier).getPopularLog();
    newLogList = await ref
        .read(logProvider.notifier)
        .getLogDataOrderBy(ref.watch(logProvider).orderBy);
    ref.read(logProvider.notifier).setPopularLog(popularLogList);
    newLogList = await ref
        .read(logProvider.notifier)
        .getLogDataOrderBy(ref.watch(logProvider).orderBy);

    ref.read(logProvider.notifier).setLog(newLogList);
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
              ..addStatusListener((status) async {
                if (status == AnimationStatus.completed) {
                  await setInitData();
                  navigateToNextPage();
                }
              });
          },
        ),
      ),
    );
  }
}
