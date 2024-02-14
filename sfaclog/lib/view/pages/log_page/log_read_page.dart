import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parchment_delta/parchment_delta.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_appbar_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_footer_widget.dart';
import 'package:sfaclog/view/widgets/log_read_page_widgets/log_read_header_widget.dart';
import 'package:sfaclog/viewmodel/log_read_viewmodel/log_read_notifier.dart';
import 'package:sfaclog/viewmodel/log_viewmodel/log_notifier.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class LogReadPage extends ConsumerStatefulWidget {
  final String tagId;

  const LogReadPage({super.key, required this.tagId});

  @override
  ConsumerState<LogReadPage> createState() => _LogReadPageState();
}

class _LogReadPageState extends ConsumerState<LogReadPage> {
  FleatherController? _controller;
  dynamic userInfo;
  String avatarUrl = '';

  SFACLogModel? sfacLogModel;
  @override
  void initState() {
    super.initState();
    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    _initController();
  }

  @override
  void dispose() {
    super.dispose();
    if (kIsWeb) BrowserContextMenu.enableContextMenu();
  }

  Future<void> _initController() async {
    try {
      //find Clicked Log
      sfacLogModel = ref.read(logReadProvider.notifier).findLog(widget.tagId);
      //update View Count
      if (sfacLogModel != null) {
        // 조회수 업데이트
        await ref
            .read(logReadProvider.notifier)
            .updateViewCount(sfacLogModel!.view, widget.tagId);
        userInfo =
            await ref.read(logProvider.notifier).getUserInfo(widget.tagId);
        avatarUrl =
            await ref.read(logProvider.notifier).getAvatarUrl(userInfo['id']);
      }

      // 로그 본문 처리
      final logBody = sfacLogModel?.body ?? '{}';
      final heuristics = ParchmentHeuristics(
        formatRules: [],
        insertRules: [ForceNewlineForInsertsAroundInlineImageRule()],
        deleteRules: [],
      ).merge(ParchmentHeuristics.fallback);
      final doc = ParchmentDocument.fromJson(jsonDecode(logBody),
          heuristics: heuristics);
      _controller = FleatherController(document: doc);

      // UI 업데이트
      if (mounted) {
        setState(() {
          // 이 부분에서 UI에 반영될 상태 변경을 처리합니다.
        });
      }
    } catch (err, st) {
      print('Cannot read welcome.json: $err\n$st');
      _controller = FleatherController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const LogReadAppBarWidget(),
      body: Column(
        children: [
          _controller == null
              ? const SizedBox()
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LogReadHeaderWidget(
                          sfacLogModel: sfacLogModel!,
                          avatarUrl: avatarUrl,
                          userInfo: userInfo,
                        ),
                        Divider(
                          height: 1,
                          color: SLColor.neutral.shade80,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: FleatherField(
                            readOnly: true,
                            controller: _controller!,
                            onLaunchUrl: _launchUrl,
                            embedBuilder: _embedBuilder,
                            // spellCheckConfiguration:
                            //     SpellCheckConfiguration(
                            //         spellCheckService:
                            //             DefaultSpellCheckService(),
                            //         misspelledSelectionColor: Colors.red,
                            //         misspelledTextStyle:
                            //             DefaultTextStyle.of(context).style),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          sfacLogModel == null
              ? const SizedBox()
              : LogReadFooterWidget(sfacLogModel: sfacLogModel!),
        ],
      ),
    ));
  }
}

Widget _embedBuilder(BuildContext context, EmbedNode node) {
  if (node.value.type == 'icon') {
    final data = node.value.data;
    // Icons.rocket_launch_outlined
    return Icon(
      IconData(int.parse(data['codePoint']), fontFamily: data['fontFamily']),
      color: Color(int.parse(data['color'])),
      size: 18,
    );
  }

  if (node.value.type == 'image') {
    final sourceType = node.value.data['source_type'];
    ImageProvider? image;
    image = NetworkImage(node.value.data['source']);
    // if (sourceType == 'assets') {
    //   image = AssetImage(node.value.data['source']);
    // } else if (sourceType == 'file') {
    //   image = FileImage(File(node.value.data['source']));
    // } else if (sourceType == 'url') {
    //   image = NetworkImage(node.value.data['source']);
    // }
    return Padding(
      // Caret takes 2 pixels, hence not symmetric padding values.
      padding: const EdgeInsets.only(left: 4, right: 2, top: 2, bottom: 2),
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  return defaultFleatherEmbedBuilder(context, node);
}

void _launchUrl(String? url) async {
  if (url == null) return;
  final uri = Uri.parse(url);
  final canLaunch = await canLaunchUrl(uri);
  if (canLaunch) {
    await launchUrl(uri);
  }
}

/// This is an example insert rule that will insert a new line before and
/// after inline image embed.
class ForceNewlineForInsertsAroundInlineImageRule extends InsertRule {
  @override
  Delta? apply(Delta document, int index, Object data) {
    if (data is! String) return null;

    final iter = DeltaIterator(document);
    final previous = iter.skip(index);
    final target = iter.next();
    final cursorBeforeInlineEmbed = _isInlineImage(target.data);
    final cursorAfterInlineEmbed =
        previous != null && _isInlineImage(previous.data);

    if (cursorBeforeInlineEmbed || cursorAfterInlineEmbed) {
      final delta = Delta()..retain(index);
      if (cursorAfterInlineEmbed && !data.startsWith('\n')) {
        delta.insert('\n');
      }
      delta.insert(data);
      if (cursorBeforeInlineEmbed && !data.endsWith('\n')) {
        delta.insert('\n');
      }
      return delta;
    }
    return null;
  }

  bool _isInlineImage(Object data) {
    if (data is EmbeddableObject) {
      return data.type == 'image' && data.inline;
    }
    if (data is Map) {
      return data[EmbeddableObject.kTypeKey] == 'image' &&
          data[EmbeddableObject.kInlineKey];
    }
    return false;
  }
}
