import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import '../../widgets/my_follow_widget/my_follow_card_widget.dart';

class MyFollowerPage extends ConsumerStatefulWidget {
  const MyFollowerPage({
    super.key,
    required this.userId,
  });
  final String userId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowerPageState();
}

class _MyFollowerPageState extends ConsumerState<MyFollowerPage> {
  List<dynamic> followers = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    var newFollowers = await ref
        .read(MyPageProfileProvider.notifier)
        .getFollowers(widget.userId);

    setState(() {
      followers = newFollowers;
    });
  }

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
              for (var i = 0; i < followers.length; i++)
                MyFollowCard(
                  user: followers[i],
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
