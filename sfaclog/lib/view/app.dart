import 'package:flutter/material.dart';
import 'package:sfaclog/view/router.dart';

class SFACApp extends StatelessWidget {
  const SFACApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //builder: FToastBuilder(),
      //theme: ThemeData(fontFamily: 'Pretendard'),
      //themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
