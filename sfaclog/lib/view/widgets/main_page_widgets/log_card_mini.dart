import 'package:flutter/material.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogCardMini extends StatelessWidget {
  const LogCardMini({
    super.key,
    this.image,
    this.title,
    this.tags,
    this.profileImage,
    this.isBooked = false,
  });
  final String? image;
  final String? profileImage;
  final String? title;
  final List<String?>? tags;
  final bool isBooked;

  @override
  Widget build(BuildContext context) {
    List<String> tags = [
      '#프론트엔드',
      '#일상',
      '#백앤드',
      '#개발자',
    ];
    const String category = '개발자일상';
    const String title = '개발자가 되고 싶은 이유';
    const String comment = '1';
    const String book = '2';

    return Column(
      children: [
        _ImageSection(
            image: image, profileImage: profileImage, isBooked: isBooked),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: SLTextStyle(
                      style: SLStyle.Text_XS_Regular,
                      color: SLColor.neutral.shade50)
                  .textStyle,
            ),
            const SizedBox(height: 4),
            Text(
              title,
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
                  comment,
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
                  book,
                  style: SLTextStyle(
                          style: SLStyle.Text_S_Bold,
                          color: SLColor.neutral.shade50)
                      .textStyle,
                ),
              ],
            ),
            // @todo: 횡스크롤 ListView
            Wrap(
              children: buildTags(tags, maxLen: 1),
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
    required this.profileImage,
    required this.isBooked,
  });

  final String? image;
  final String? profileImage;
  final bool isBooked;

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
                  '김룰루',
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

List<Widget> buildTags(List<String> tags, {int maxLen = 2}) {
  int tagLength = tags.length;
  List<Widget> result = [];
  for (int i = 0; i < maxLen; i++) {
    result.add(_TagWidget(label: tags[i]));
    tagLength--;
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
