import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../widgets/my_follow_widget/my_follow_card_widget.dart';

class MyFollowerPage extends ConsumerStatefulWidget {
  const MyFollowerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowerPageState();
}

class _MyFollowerPageState extends ConsumerState<MyFollowerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const SFACSearchBar(
            height: 38,
            width: 312,
            hintText: '닉네임을 검색하세요.',
          ),
          const SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            child: Column(children: [
              MyFollowCard(
                following: false,
                username: '황금가지',
                profilePicture:
                    SvgPicture.asset('assets/icons/profile_picture3.svg'),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
