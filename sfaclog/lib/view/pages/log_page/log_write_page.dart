import 'package:flutter/material.dart';

class LogWritePage extends StatefulWidget {
  const LogWritePage({super.key});

  @override
  State<LogWritePage> createState() => _LogWritePageState();
}

class _LogWritePageState extends State<LogWritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그 쓰기'),
        centerTitle: true,
        actions: [TextButton(onPressed: () {}, child: const Text('완료'))],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
