import 'package:flutter/material.dart';
import 'package:sfaclog/view/router.dart';

class SFACLOGApp extends StatelessWidget {
  const SFACLOGApp({super.key});

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
