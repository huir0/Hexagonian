// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/link_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeLinkCard extends StatelessWidget {
  const ResumeLinkCard({
    super.key,
    required this.link,
  });
  final LinkModel link;

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(link.link);
    
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
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
                  link.link,
                  style:
                      SLTextStyle.Text_XS_Medium?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      context.push('/my/profile/link_edit/${link.id}');
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
                  link.name,
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
