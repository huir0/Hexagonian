import 'dart:convert';
import 'dart:io';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parchment_delta/parchment_delta.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';
import 'package:sfaclog_widgets/chips/sl_chip.dart';
import 'package:sfaclog_widgets/tags/sl_tag.dart';
import 'package:url_launcher/url_launcher.dart';

class ComWritePage extends ConsumerStatefulWidget {
  const ComWritePage({super.key});

  @override
  ConsumerState<ComWritePage> createState() => _ComWritePageState();
}

class _ComWritePageState extends ConsumerState<ComWritePage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _headerController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();
  final SFACLogModel _logModel = SFACLogModel(
      id: '',
      collectionId: '',
      collectionName: '',
      created: '',
      expand: '',
      favorite: 0,
      updated: '',
      title: '',
      category: '선택 안함',
      body: '',
      images: [],
      thumbnail: '',
      public: '',
      tag: [],
      user: '',
      view: 0,
      like: 0);
  FleatherController? _controller;
  bool editorFocused = false;
  List<String> tagList = [];

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
      _controller = FleatherController();
    } catch (err, st) {
      print('Cannot read welcome.json: $err\n$st');
    }
    setState(() {});
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
              var contents = jsonEncode(_controller!.document);
              List<dynamic> data = json.decode(contents);
              //이미지 유무 체크
              List<dynamic> imageList = data.where((item) {
                var insertData = item['insert'];
                return insertData is Map<String, dynamic> &&
                    insertData['_type'] == 'image';
              }).toList();
              SFACLogModel newValue = _logModel.copyWith(
                title: _headerController.value.text,
                body: contents,
                images: imageList,
                tag: tagList,
              );
              ref.read(logwriteProvider.notifier).setLog(newValue);
              context.push('/log/write/setting');
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
                if (editorFocused)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FleatherToolbar.basic(
                        leading: [
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                final selection = _controller!.selection;
                                _controller!.replaceText(
                                  selection.baseOffset,
                                  selection.extentOffset - selection.baseOffset,
                                  EmbeddableObject(
                                    'image',
                                    inline: false,
                                    data: {
                                      'source_type': kIsWeb ? 'url' : 'file',
                                      'source': image.path,
                                    },
                                  ),
                                );
                                _controller!.replaceText(
                                  selection.baseOffset + 1,
                                  0,
                                  '\n',
                                  selection: TextSelection.collapsed(
                                    offset: selection.baseOffset + 2,
                                  ),
                                );
                              }
                            },
                            child: const Icon(Icons.picture_as_pdf),
                          ),
                        ],
                        controller: _controller!,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Divider(height: 1, color: Colors.grey.shade200),
                    ],
                  )
                else
                  const SizedBox(
                    height: 0,
                  ),
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
