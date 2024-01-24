// ignore_for_file: public_member_api_docs, sort_constructors_first
library sfaclog_widgets;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SFACButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  SFACButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: onPressed,
      child: child,
    );
  }
}
