import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sfaclog/view/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '7f9236613997b0e48dfd6c5e9cd4d694',
    javaScriptAppKey: '2face5ee56e8d9b825ad75cd03364a80',
  );
  runApp(const ProviderScope(child: SFACLOGApp()));
}
