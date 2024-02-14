import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalkthroughPage extends StatelessWidget {
  const WalkthroughPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          context.push('/home');
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo/sfac_guide.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
