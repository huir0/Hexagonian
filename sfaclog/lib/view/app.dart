import 'package:flutter/material.dart';
import 'package:sfaclog/view/router.dart';

class SFACLOGApp extends StatelessWidget {
  const SFACLOGApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //builder: FToastBuilder(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Pretendard',
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
