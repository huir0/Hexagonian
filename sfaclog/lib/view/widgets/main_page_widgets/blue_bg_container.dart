import 'package:flutter/material.dart';

class BlueBgContainer extends StatelessWidget {
  const BlueBgContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/blue_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
