import 'dart:convert';
import 'dart:io';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/model/sl_error_exception.dart';
import 'package:sfaclog/viewmodel/auth/auth_notifier.dart';
import 'package:sfaclog/viewmodel/qna_viewmodel/craete_qna_provider.dart';
import 'package:sfaclog_widgets/popup/sl_popup_dialog.dart';
import 'package:sfaclog_widgets/tags/sl_tag.dart';
import 'package:sfaclog_widgets/tooltips/sl_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:parchment_delta/parchment_delta.dart';
import 'package:http/http.dart' as http;

class QnaCreatePage extends ConsumerStatefulWidget {
  const QnaCreatePage({super.key});

  @override
  ConsumerState<QnaCreatePage> createState() => _QnaCreatePageState();
}

class _QnaCreatePageState extends ConsumerState<QnaCreatePage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _headerController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();

  FleatherController? _controller;
  bool editorFocused = false;
  List<String> tagList = [];
  String userId = '';

  @override
  void initState() {
    super.initState();
    if (kIsWeb) BrowserContextMenu.disableContextMenu();
    _initController();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
    if (kIsWeb) BrowserContextMenu.enableContextMenu();
  }

  Future<void> _initController() async {
    try {
      _controller = FleatherController();
    } catch (err, st) {
      print('Cannot read welcome.json: $err\n$st');
    }
    setState(() {});
  }

  Future<void> initData() async {
    try {
      userId = await ref.read(authProvider).userInfo['id'];
    } catch (e) {
      print('init error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('질문 작성'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              try {
                var content = jsonEncode(_controller!.document);

                // content = http.MultipartFile.fromString('content', content);

                ref.read(createQnaProvider.notifier).setQna(
                      title: _headerController.value.text,
                      content: content,
                      tag: tagList,
                      userId: userId,
                    );

                context.pop();
              } on SLErrorException catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SFACPopUpDialog(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${e.code} 에러 발생',
                            style: SLTextStyle.Text_L_Bold?.copyWith(
                                color: SLColor.neutral[100]),
                          ),
                          Text(
                            e.message,
                            style: SLTextStyle.Text_S_Medium?.copyWith(
                              color: SLColor.neutral[100],
                            ),
                          ),
                        ],
                      ),
                      onConfirmed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              }
            },
            child: const Text('완료'),
          )
        ],
      ),
      body: _controller == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: _headerController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: SLColor.neutral.shade50),
                      ),
                      hintText: '제목을 입력하세요.',
                      hintStyle: SLTextStyle(
                        style: SLStyle.Heading_S_Medium,
                        color: SLColor.neutral.shade60,
                      ).textStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: FocusScope(
                    child: Focus(
                      onFocusChange: (focus) {
                        editorFocused = focus;
                        setState(() {});
                      },
                      child: FleatherField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 24),
                          hintText: '내용을 입력하세요.',
                          border: InputBorder.none,
                        ),
                        controller: _controller!,
                        focusNode: _focusNode,
                        onLaunchUrl: _launchUrl,
                        embedBuilder: _embedBuilder,
                        spellCheckConfiguration: SpellCheckConfiguration(
                          spellCheckService: DefaultSpellCheckService(),
                          misspelledSelectionColor: Colors.red,
                          misspelledTextStyle:
                              DefaultTextStyle.of(context).style,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      ...tagList.map(
                        (tag) => SFACTag(
                          text: Text(tag),
                          prefixIcon: const Icon(
                            CupertinoIcons.xmark,
                            size: 10,
                          ),
                          backgroundColor: SLColor.primary,
                          onPressed: () {
                            setState(() {
                              tagList.remove(tag);
                            });
                          },
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0.0, -8.0),
                        child: SizedBox(
                          width: 120,
                          child: TextField(
                            style: const TextStyle(fontSize: 12),
                            controller: _tagController,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 12),
                              hintText: '태그를 입력하세요.',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  tagList.add('#$value');
                                  _tagController.clear();
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _embedBuilder(BuildContext context, EmbedNode node) {
    if (node.value.type == 'icon') {
      final data = node.value.data;
      return Icon(
        IconData(int.parse(data['codePoint']), fontFamily: data['fontFamily']),
        color: Color(int.parse(data['color'])),
        size: 18,
      );
    }

    if (node.value.type == 'image') {
      final sourceType = node.value.data['source_type'];
      ImageProvider? image;
      if (sourceType == 'assets') {
        image = AssetImage(node.value.data['source']);
      } else if (sourceType == 'file') {
        image = FileImage(File(node.value.data['source']));
      } else if (sourceType == 'url') {
        image = NetworkImage(node.value.data['source']);
      }
      if (image != null) {
        return Padding(
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
}

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
