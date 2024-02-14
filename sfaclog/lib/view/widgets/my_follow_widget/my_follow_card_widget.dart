import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/viewmodel/my_profile_viewmodel/my_profile_notifier.dart';

class MyFollowCard extends ConsumerStatefulWidget {
  const MyFollowCard({
    super.key,
    required this.user,
  });
  final dynamic user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowCardState();
}

class _MyFollowCardState extends ConsumerState<MyFollowCard> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  String avatarUrl = '';
  List<dynamic> followerList = [];
  bool following = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _init());
  }

  Future<void> _init() async {
    var newavatarUrl = await _remoteDataSource.getAvatarURL(
        'user',
        widget.user.expand['follower'] == null
            ? widget.user.expand['following']['id']
            : widget.user.expand['follower']['id'],
        'picture');

    var newfollowerList = await ref
        .watch(MyPageProfileProvider.notifier)
        .getFollowers(widget.user.follower);

    bool tempBool = await isFollowing(newfollowerList);
    setState(() {
      avatarUrl = newavatarUrl;
      following = tempBool;
    });
  }

  Future<bool> isFollowing(List<dynamic> list) async {
    if (list.isNotEmpty) {
      for (var follower in list) {
        if (follower.expand['follower']['id'] == widget.user.following) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 312,
      height: 52,
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: SvgPicture.network(avatarUrl),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 116,
            child: Text(
              widget.user.expand['follower'] == null
                  ? widget.user.expand['following']['nickname']
                  : widget.user.expand['follower']['nickname'],
              style: SLTextStyle.Text_M_Medium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              if (following) {
                await _remoteDataSource.deleteRecord('follow', widget.user.id);
              } else {
                final body = <String, dynamic>{
                  "following": widget.user.follower,
                  "follower": widget.user.following
                };
                await _remoteDataSource.createTableData('follow', body);
              }
              setState(() {
                following = !following;
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: following ? SLColor.neutral[80] : SLColor.primary[100],
              ),
              width: 52,
              height: 26,
              child: Text(
                following ? '팔로잉' : '팔로우',
                style: SLTextStyle.Text_S_Bold?.copyWith(
                    color: following ? SLColor.neutral[20] : Colors.white,
                    letterSpacing: -0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
