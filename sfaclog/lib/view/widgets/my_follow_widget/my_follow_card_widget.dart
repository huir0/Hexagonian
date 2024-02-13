import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';

class MyFollowCard extends ConsumerStatefulWidget {
  const MyFollowCard({
    super.key,
    required this.following,
    required this.username,
    required this.profilePicture,
  });
  final bool following;
  final String username;
  final Widget profilePicture;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyFollowCardState();
}

class _MyFollowCardState extends ConsumerState<MyFollowCard> {
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
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            // TODO: 플픽 연결
            child: widget.profilePicture,
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: EdgeInsets.zero,
            width: 116,
            child: Text(
              // TODO: name
              widget.username,
              style: SLTextStyle.Text_M_Medium?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: widget.following
                    ? SLColor.neutral[80]
                    : SLColor.primary[100],
              ),
              width: 52,
              height: 26,
              child: Text(
                widget.following ? '팔로잉' : '팔로우',
                style: SLTextStyle.Text_S_Bold?.copyWith(
                    color:
                        widget.following ? SLColor.neutral[20] : Colors.white,
                    letterSpacing: -0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
