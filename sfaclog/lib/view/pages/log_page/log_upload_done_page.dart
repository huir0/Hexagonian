import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:sfaclog_widgets/labels/log_label.dart';

class LogUploadDonePage extends ConsumerStatefulWidget {
  final String tagId;
  const LogUploadDonePage({super.key, required this.tagId});

  @override
  ConsumerState<LogUploadDonePage> createState() => _LogUploadDonePageState();
}

class _LogUploadDonePageState extends ConsumerState<LogUploadDonePage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/log_finish.png'),
            Text(
              '오늘도 스펙업!',
              style: SLTextStyle(
                      style: SLStyle.Text_L_Bold,
                      color: SLColor.neutral.shade10)
                  .textStyle,
            ),
            Text(
              '로그를 업로드하였습니다.',
              style: SLTextStyle(
                      style: SLStyle.Text_L_Bold,
                      color: SLColor.neutral.shade10)
                  .textStyle,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: reviselabel(
          width: 312,
          height: 52,
          text: '확인',
          onPressed: () async {
            await ref
                .read(logProvider.notifier)
                .getLogDataOrderBy(state.orderBy)
                .then((value) => ref.read(logProvider.notifier).setLog(value));

            if (context.mounted) {
              context.push('/log/read/${widget.tagId}');
            }
          },
        ),
      ),
    );
  }
}
