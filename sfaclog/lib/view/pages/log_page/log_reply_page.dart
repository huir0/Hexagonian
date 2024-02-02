import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_header_widget.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_listtile_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReplyPage extends StatelessWidget {
  const LogReplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const LogReplyAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: 6,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    height: 1,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return const LogReplyListTileWidget();
              },
            )),
            SFACTextField(
              height: 40,
              width: MediaQuery.of(context).size.width,
              hintText: '댓글을 입력하세요.',
            )
          ],
        ),
      ),
    ));
  }
}
