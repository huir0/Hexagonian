import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/log_reply_model.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_nested_reply_listtile_widget.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_header_widget.dart';
import 'package:sfaclog/view/widgets/log_reply_widgets/log_reply_listtile_widget.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/log_read_viewmodel/log_read_notifier.dart';
import 'package:sfaclog/viewmodel/log_reply_viewmodel/log_reply_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogReplyPage extends ConsumerStatefulWidget {
  final String tagId;
  const LogReplyPage({
    super.key,
    required this.tagId,
  });

  @override
  ConsumerState<LogReplyPage> createState() => _LogReplyPageState();
}

class _LogReplyPageState extends ConsumerState<LogReplyPage> {
  final TextEditingController _controller = TextEditingController();
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  String replyTagId = '';
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        _loadData();
      },
    );
  }

  Future<void> _loadData() async {
    ref.read(logReplyProvider.notifier).clearReplies();
    await ref.read(logReplyProvider.notifier).getReply(widget.tagId);
    ref.read(logReplyProvider.notifier).setParentReplyId("");
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logReplyProvider);
    var authState = ref.watch(authProvider);
    int totalReplyCnt =
        ref.read(logReplyProvider.notifier).getTotalReplyCnt(state.replyList!);

    return SafeArea(
        child: Scaffold(
      appBar: LogReplyAppBarWidget(
        replyCnt: totalReplyCnt,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  state.replyList!.isEmpty
                      ? const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('댓글을 달아주세요!'),
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                          itemCount: state.replyList!.length,
                          separatorBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Divider(
                                height: 1,
                              ),
                            );
                          },
                          itemBuilder: (context, index) {
                            var reply = state.replyList![index];
                            var nestedReplies = reply.nestedReplies ?? [];
                            return Column(
                              children: [
                                LogReplyListTileWidget(
                                  reply: reply,
                                ),
                                Column(
                                  children: nestedReplies
                                      .map((nestedReply) => Padding(
                                            padding: const EdgeInsets.only(
                                                top: 24), // 대댓글 간의 상단 패딩
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 14,
                                                  height: 14,
                                                  child: Image.asset(
                                                      'assets/images/Vector 4850.png'), // 대댓글 아이콘
                                                ),
                                                const SizedBox(width: 8),
                                                LogNestedReplyListTileWidget(
                                                  logReplyModel: nestedReply,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ],
                            );
                          },
                        )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.parentReplyId != ""
                            ? const Text('@ 대댓글 작성')
                            : const SizedBox(),
                        const SizedBox(
                          height: 4,
                        ),
                        InputWithTextButton(
                          onPressed: () async {
                            LogReplyModel logReplyModel = LogReplyModel(
                                content: _controller.value.text,
                                log: widget.tagId,
                                parentReplyId: state.parentReplyId != ""
                                    ? state.parentReplyId
                                    : "",
                                like: 0,
                                user: authState.userInfo['id']);
                            try {
                              replyTagId =
                                  await _remoteDataSource.createTableData(
                                      'log_reply', logReplyModel.toJson());
                              LogReplyModel updatedModel =
                                  logReplyModel.copyWith(id: replyTagId);
                              ref
                                  .read(logReplyProvider.notifier)
                                  .addReply(updatedModel);
                              ref
                                  .read(logReplyProvider.notifier)
                                  .getReply(widget.tagId);
                              ref
                                  .read(logReplyProvider.notifier)
                                  .setParentReplyId("");
                              _controller.clear();
                            } catch (e) {
                              print(e);
                            }
                          },
                          controller: _controller,
                          hintText: '댓글을 입력하세요.',
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    ));
  }
}
