import 'package:flutter/material.dart';

class BlueChip extends StatefulWidget {
  const BlueChip({super.key});

  @override
  State<BlueChip> createState() => _BlueChipState();
}

class _BlueChipState extends State<BlueChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Text(
        'HOT',
      ),
    );
  }
}
