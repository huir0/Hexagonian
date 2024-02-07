import 'package:flutter/material.dart';

class LineDecoWidget extends StatelessWidget {
  const LineDecoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 36,
        height: 5,
        margin: const EdgeInsets.only(
          top: 22,
          bottom: 26,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
      ),
    );
  }
}
