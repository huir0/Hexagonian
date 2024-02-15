import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogCardMini extends ConsumerStatefulWidget {
  const LogCardMini({
    super.key,
    required this.logData,
  });
  final SFACLogModel logData;

  @override
  ConsumerState<LogCardMini> createState() => _LogCardMiniState();
}

class _LogCardMiniState extends ConsumerState<LogCardMini> {
  var userInfo;
  String? imgUrl;
  int replyCnt = 0;
  List<Widget> chipList = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void didUpdateWidget(LogCardMini oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.logData != widget.logData) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    userInfo =
        await ref.read(logProvider.notifier).getUserInfo(widget.logData.id);
    imgUrl =
        await ref.read(logProvider.notifier).getThumbNailUrl(widget.logData.id);
    replyCnt =
        await ref.read(logProvider.notifier).getReplyCnt(widget.logData.id);

    if (!mounted) return;
    setState(() {});
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // const String category = '개발자일상';
    // const String title = '개발자가 되고 싶은 이유';

    return Column(
      children: [
        _ImageSection(
            image: imgUrl,
            isBooked: false,
            username: userInfo?['nickname'] ?? ''),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.logData.category,
              style: SLTextStyle(
                      style: SLStyle.Text_XS_Regular,
                      color: SLColor.neutral.shade50)
                  .textStyle,
            ),
            const SizedBox(height: 4),
            Text(
              widget.logData.title,
              overflow: TextOverflow.ellipsis,
              style: SLTextStyle(
                style: SLStyle.Text_M_Bold,
              ).textStyle,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.message, size: 12, color: SLColor.neutral.shade50),
                const SizedBox(width: 4),
                Text(
                  '$replyCnt',
                  style: SLTextStyle(
                          style: SLStyle.Text_S_Bold,
                          color: SLColor.neutral.shade50)
                      .textStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '|',
                    style: SLTextStyle(
                            style: SLStyle.Text_S_Bold,
                            color: SLColor.neutral.shade50)
                        .textStyle,
                  ),
                ),
                Icon(Icons.thumb_up_alt_rounded,
                    size: 12, color: SLColor.neutral.shade50),
                const SizedBox(width: 4),
                Text(
                  widget.logData.favorite.toString(),
                  style: SLTextStyle(
                          style: SLStyle.Text_S_Bold,
                          color: SLColor.neutral.shade50)
                      .textStyle,
                ),
              ],
            ),
            // @todo: 횡스크롤 ListView
            Wrap(
              // children: [...chipList],
              children: buildTags(widget.logData.tag, maxLen: 1),
            ),
          ],
        )
      ],
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.image,
    this.profileImage,
    required this.isBooked,
    this.username,
  });

  final String? image;
  final String? profileImage;
  final bool isBooked;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          ),
          child: image != null
              ? Image.network(
                  image!,
                  fit: BoxFit.cover,
                  height: 89,
                  width: double.infinity,
                )
              : Image.asset(
                  'assets/images/log_thumbnail_2.png',
                  height: 89,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 6,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundImage: profileImage != null
                      ? NetworkImage(
                          profileImage!,
                        )
                      : null,
                  child: Image.asset(
                    'assets/images/basic_profile_sm.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  username ?? '',
                  style: SLTextStyle(style: SLStyle.Text_M_Medium).textStyle,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: GestureDetector(
              onTap: () {},
              child: isBooked
                  ? Icon(
                      Icons.bookmark_rounded,
                      color: SLColor.primary.shade80,
                      size: 20,
                    )
                  : Icon(
                      Icons.bookmark_border_rounded,
                      color: SLColor.neutral.shade5,
                      size: 20,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Widget> buildTags(List<dynamic> tags, {int maxLen = 3}) {
  int tagLength = tags.length;
  List<Widget> result = [];
  if (tags.isEmpty) return [];
  for (int i = 0; i < maxLen; i++) {
    result.add(_TagWidget(label: tags[i]));
    tagLength--;
  }

  if (tagLength == 0) {
    return [...result];
  }

  return [...result, _TagWidget(label: '+$tagLength')];
}

class _TagWidget extends StatelessWidget {
  const _TagWidget({
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return SFACTag(
      text: Text(
        label,
        style: SLTextStyle(
          color: SLColor.neutral.shade60,
          style: SLStyle.Text_XS_Medium,
        ).textStyle,
      ),
    );
  }
}
