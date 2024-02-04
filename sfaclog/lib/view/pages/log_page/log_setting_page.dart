import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_state.dart';
import 'package:sfaclog_widgets/bottomsheets/sl_bottom_sheets.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

class LogSettingPage extends ConsumerStatefulWidget {
  const LogSettingPage({super.key});

  @override
  ConsumerState<LogSettingPage> createState() => _LogSettingPageState();
}

class _LogSettingPageState extends ConsumerState<LogSettingPage> {
  List publicOptionList = [
    {'id': 0, 'value': false, 'option': '전체 공개', 'tableValue': 'public'},
    {'id': 1, 'value': false, 'option': '비공개', 'tableValue': 'private'},
  ];
  List thumbNailList = [
    {'id': 0, 'url': 'assets/images/log_thumbnail_3.png'},
    {'id': 1, 'url': 'assets/images/log_thumbnail_4.png'}
  ];
  int selectedThumbNailIndex = -1;
  int selectedPublicIndex = -1;
  Image? thumbNailImg;
  @override
  void initState() {
    super.initState();
  }

  Future<Image> thumbNailImages(String imgPath) async {
    File file = File(imgPath);
    Uint8List imgData;
    if (await file.exists()) {
      imgData = await file.readAsBytes();
    } else {
      throw Exception('File does not exist');
    }

    return Image.memory(imgData);
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logwriteProvider);

    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('로그 설정'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                var tagId = await remoteDataSource.uploadThumbNail(
                    'log',
                    thumbNailList[selectedThumbNailIndex]['url'],
                    state.logModel!.title,
                    'thumbnail');
                await remoteDataSource.uploadLog('log', state.logModel!, tagId);
                print(state.logModel);
              },
              child: const Text('게시'))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '카테고리 설정',
                    style: SLTextStyle(
                            style: SLStyle.Text_L_Bold,
                            color: SLColor.neutral.shade10)
                        .textStyle,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/log/write/category');
                    },
                    child: Row(
                      children: [
                        Text(
                          state.logModel!.category,
                          style: SLTextStyle(
                                  style: SLStyle.Text_M_Medium,
                                  color: SLColor.neutral.shade60)
                              .textStyle,
                        ),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '공개설정',
                    style: SLTextStyle(
                            style: SLStyle.Text_L_Bold,
                            color: SLColor.neutral.shade10)
                        .textStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 22,
                    width: 320,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = selectedPublicIndex == index;
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (selectedPublicIndex == index) {
                                    selectedPublicIndex = -1;
                                  } else {
                                    selectedPublicIndex = index;
                                  }
                                  setState(() {});
                                },
                                child: SLCheckbox(
                                  onChange: (value) {
                                    if (isSelected) {
                                      publicOptionList[index]['value'] = value;
                                    } else {
                                      value = false;
                                    }

                                    setState(() {});
                                    SFACLogModel newState = state.logModel!
                                        .copyWith(
                                            public: publicOptionList[index]
                                                ['tableValue']);
                                    ref
                                        .read(logwriteProvider.notifier)
                                        .setLog(newState);
                                  },
                                  value: false,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                publicOptionList[index]['option'],
                                style: SLTextStyle(
                                        style: SLStyle.Text_M_Medium,
                                        color: SLColor.neutral.shade60)
                                    .textStyle,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 34,
                          );
                        },
                        itemCount: publicOptionList.length),
                  )

                  // Row(
                  //   children: [
                  //     SLCheckbox(
                  //       onChange: (value) {
                  //         setState(() {
                  //           publicOption = value ? 'public' : '';
                  //         });
                  //         SFACLogModel newState =
                  //             state.logModel!.copyWith(public: publicOption);
                  //         ref.read(logwriteProvider.notifier).setLog(newState);
                  //       },
                  //       value: publicOption == 'public',
                  //     ),
                  //     const SizedBox(
                  //       width: 4,
                  //     ),
                  //     Text(
                  //       '전체 공개',
                  //       style: SLTextStyle(
                  //               style: SLStyle.Text_M_Medium,
                  //               color: SLColor.neutral.shade60)
                  //           .textStyle,
                  //     ),
                  //     const SizedBox(
                  //       width: 34,
                  //     ),
                  //     SLCheckbox(
                  //       onChange: (value) {
                  //         setState(() {
                  //           publicOption = value ? 'private' : '';
                  //         });
                  //         SFACLogModel newState =
                  //             state.logModel!.copyWith(public: publicOption);
                  //         ref.read(logwriteProvider.notifier).setLog(newState);
                  //       },
                  //       value: publicOption == 'private',
                  //     ),
                  //     Text(
                  //       '비공개',
                  //       style: SLTextStyle(
                  //               style: SLStyle.Text_M_Medium,
                  //               color: SLColor.neutral.shade60)
                  //           .textStyle,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                '썸네일 선택',
                style: SLTextStyle(
                        style: SLStyle.Text_L_Bold,
                        color: SLColor.neutral.shade10)
                    .textStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  state.logModel!.imgList.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .push('/log/write/thumbnail')
                                  .then((value) async {
                                final image =
                                    await thumbNailImages(value.toString());
                                setState(() {
                                  thumbNailImg =
                                      image; // 이미지 로드 결과를 thumbNailImg에 저장합니다.
                                });
                              });
                            },
                            child: Container(
                              width: 313,
                              height: 157,
                              decoration: BoxDecoration(
                                color: SLColor.neutral.shade80,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 18,
                      );
                    },
                    shrinkWrap: true,
                    itemCount: thumbNailList.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedThumbNailIndex == index;
                      return GestureDetector(
                        onTap: () {
                          if (selectedThumbNailIndex == index) {
                            selectedThumbNailIndex = -1;
                          } else {
                            selectedThumbNailIndex = index;
                          }
                          setState(() {});
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 313,
                              height: 157,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Image.asset(thumbNailList[index]['url']),
                            ),
                            Container(
                              width: 313,
                              height: 157,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? SLColor.primary.shade80.withOpacity(0.2)
                                    : SLColor.neutral.shade80.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: isSelected
                                    ? Border.all(color: SLColor.primary)
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 16),
                  //   child: GestureDetector(
                  //     child: Container(
                  //       width: 313,
                  //       height: 157,
                  //       decoration: BoxDecoration(
                  //         color: SLColor.neutral.shade80,
                  //         borderRadius: const BorderRadius.all(
                  //           Radius.circular(10),
                  //         ),
                  //       ),
                  //       child: Image.asset('assets/images/log_thumbnail_3.png'),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   width: 313,
                  //   height: 157,
                  //   decoration: BoxDecoration(
                  //     color: SLColor.neutral.shade80,
                  //     borderRadius: const BorderRadius.all(
                  //       Radius.circular(10),
                  //     ),
                  //   ),
                  //   child: Image.asset('assets/images/log_thumbnail_4.png'),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
