import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text('It is MainPage'),
          TextButton(
              onPressed: () {
                context.push('/login');
              },
              child: const Text('로그인')),
        ],
      ),
    );
  }
}
