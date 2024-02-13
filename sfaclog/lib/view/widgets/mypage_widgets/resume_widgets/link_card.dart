// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfaclog/common.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeLinkCard extends StatelessWidget {
  const ResumeLinkCard({
    super.key,
    required this.link,
  });
  final Map<String, dynamic> link;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(link['url']);

    Future<void> _launchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _launchUrl();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        width: 278,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/icons/link.svg'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  link['url'],
                  style:
                      SLTextStyle.Text_XS_Medium?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      // TODO: 편집 페이지로 연결
                      print('pencil');
                    },
                    child: SvgPicture.asset('assets/icons/pencil_grey.svg')),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  link['title'],
                  style: SLTextStyle.Text_XS_Medium?.copyWith(
                      color: SLColor.neutral[60], letterSpacing: -0.1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
