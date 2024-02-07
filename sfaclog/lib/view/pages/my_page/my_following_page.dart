import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/view/widgets/my_follow_widget/my_follow_card_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class MyFollowingPage extends ConsumerStatefulWidget {
  const MyFollowingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowingPageState();
}

class _MyFollowingPageState extends ConsumerState<MyFollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          SFACSearchBar(
            height: 38,
            width: 312,
            hintText: '닉네임을 검색하세요.',
          ),
          SizedBox(
            height: 24,
          ),
          SingleChildScrollView(
            child: Column(children: [
              MyFollowCard(
                following: true,
                username: '황금수정',
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
