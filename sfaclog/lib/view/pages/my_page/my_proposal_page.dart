import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_toggle_widget.dart';

import '../../../common.dart';
import '../../../viewmodel/mypage_state_viewmodel/toggle_notifier.dart';

class MypageProposal extends StatefulWidget {
  const MypageProposal({
    super.key,
    required this.userId,
  });
final String userId;
  @override
  State<MypageProposal> createState() => _MypageProposalState();
}

class _MypageProposalState extends State<MypageProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        centerTitle: true,
        title: Text(
          '알림',
          style: SLTextStyle.Heading_S_Bold?.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 312,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: SLColor.neutral[80],
              ),
              child: Row(
                children: [
                  Text(
                    '채용/프로젝트 제안에 열려 있음',
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white),
                  ),
                  const Spacer(),
                  MypageToggle(
                      userId: widget.userId,
                      profileProvider: toggleProvider,
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // FIXME: change button style
            // NoButton(
            //   text: '채용 제안만 받을래요.',

            // ),
            const SizedBox(
              height: 20,
            ),
            // NoButton(
            //   text: '프로젝트 제안만 받을래요.',
            // ),
          ],
        ),
      ),
    );
  }
}
