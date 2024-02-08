import 'package:flutter/material.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_header_widget.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_listtile_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReplyPage extends StatefulWidget {
  final SFACLogModel? sfacLogModel;
  final String tagId;
  const LogReplyPage({super.key, required this.tagId, this.sfacLogModel});

  @override
  State<LogReplyPage> createState() => _LogReplyPageState();
}

class _LogReplyPageState extends State<LogReplyPage> {
  final TextEditingController _controller = TextEditingController();
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  String replyTagId = '';
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
            widget.sfacLogModel == null
                ? const Text('댓글을 달아주세요!')
                : Expanded(
                    child: ListView.separated(
                    itemCount: 0,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Divider(
                          height: 1,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return const LogReplyListTileWidget(
                        reply: '',
                      );
                    },
                  )),
            InputWithTextButton(
              onPressed: () async {
                try {
                  replyTagId =
                      await _remoteDataSource.createTableData('log_reply', {
                    "content": _controller.value.text,
                    "log": widget.tagId,
                    "parentReplyId": '',
                    "like": 0,
                    "user": ''
                  });

                  _controller.clear();
                } catch (e) {}
              },
              controller: _controller,
              hintText: '댓글을 입력하세요.',
            )
          ],
        ),
      ),
    ));
  }
}
