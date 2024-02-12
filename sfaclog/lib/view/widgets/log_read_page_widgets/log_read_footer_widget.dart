import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_read_viewmodel/log_read_notifier.dart';

class LogReadFooterWidget extends ConsumerStatefulWidget {
  final SFACLogModel sfacLogModel;
  const LogReadFooterWidget({super.key, required this.sfacLogModel});

  @override
  ConsumerState<LogReadFooterWidget> createState() =>
      _LogReadFooterWidgetState();
}

class _LogReadFooterWidgetState extends ConsumerState<LogReadFooterWidget> {
  int replyCnt = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 비동기 작업 수행
      await fetchData();
      if (mounted) {
        setState(() {
          // UI 업데이트
        });
      }
    });
  }

  Future<void> fetchData() async {
    ref.read(logReadProvider.notifier).setLogModel(widget.sfacLogModel);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logReadProvider);
    print(widget.sfacLogModel);
    return state.sfacLogModel == null
        ? const SizedBox()
        : Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            color: SLColor.neutral.shade90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/heart_red.svg')),
                  Text('${state.sfacLogModel!.like}'),
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/icons/bookmark_outline.svg')),
                  Text('${state.sfacLogModel!.favorite}'),
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        int? result = await context
                            .push('/log/reply/${state.sfacLogModel!.id}');
                        if (result != null) {
                          ref
                              .read(logReadProvider.notifier)
                              .updateReplyCount(state.sfacLogModel!.id, result);
                        }
                      },
                      icon: SvgPicture.asset('assets/icons/reply.svg')),
                  Text('${state.sfacLogModel!.replyCnt}'),
                ],
              ),
            ),
          );
  }
}
