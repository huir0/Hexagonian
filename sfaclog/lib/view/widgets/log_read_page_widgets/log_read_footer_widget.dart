import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';

class LogReadFooterWidget extends StatelessWidget {
  const LogReadFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      color: SLColor.neutral.shade90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(
          children: [
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/heart_red.svg')),
            const Text('3'),
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/bookmark_outline.svg')),
            const Text('4'),
            IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  context.push('/log/reply');
                },
                icon: SvgPicture.asset('assets/icons/reply.svg')),
            const Text('5'),
          ],
        ),
      ),
    );
  }
}
