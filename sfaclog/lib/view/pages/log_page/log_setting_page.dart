import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/model/sfac_log_model.dart';
import 'package:sfaclog/view/widgets/common_widget.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:shimmer/shimmer.dart';

class LogSettingPage extends ConsumerStatefulWidget {
  const LogSettingPage({super.key});

  @override
  ConsumerState<LogSettingPage> createState() => _LogSettingPageState();
}

class _LogSettingPageState extends ConsumerState<LogSettingPage> {
  List publicOptionList = [
    {'id': 0, 'value': true, 'option': '전체 공개', 'tableValue': 'public'},
    {'id': 1, 'value': false, 'option': '비공개', 'tableValue': 'private'},
  ];
  List thumbNailList = [
    {'id': 0, 'url': 'assets/images/log_default_thumbnail.png'},
    {'id': 1, 'url': 'assets/images/log_thumbnail_3.png'},
    {'id': 2, 'url': 'assets/images/log_thumbnail_4.png'}
  ];
  int selectedPublicIndex = -1;
  Image? thumbNailImg;
  String imgPath = '';
  Map<int, bool> selectedThumbNailIndices = {};
  Map<int, bool> selectedImageIndices = {};

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
  void initState() {
    super.initState();
    // 페이지가 로드될 때 첫 번째 썸네일을 기본적으로 선택된 상태로 설정합니다.
    selectedThumbNailIndices[0] = true;
    imgPath = thumbNailList[0]['url'];
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(logwriteProvider);

    final RemoteDataSource remoteDataSource = RemoteDataSource();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
        ),
        title: Text(
          '로그 설정',
          style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                List<String> imgUrlList = [];

                /// 썸네일을 미리 저장하는 이유
                /// 이미지 저장시 URL 을 Return 받기 위해
                /// URL을 Body 다시 넣음으로써 Read시 호출 할 수 있음
                var tagId = await remoteDataSource.uploadThumbNail(
                  'log',
                  imgPath,
                  state.logModel!.title,
                );
                if (state.logModel!.images.isNotEmpty) {
                  //이미지를 Upload한 후 이를 RestAPI로 호출 할 수 있도록 URL 리스트 생성
                  imgUrlList = await remoteDataSource.uploadFile(
                      'log', state.logModel!, tagId);
                  // logModel의 body를 파싱하여 List<dynamic>으로 변환합니다.
                  List<dynamic> body = jsonDecode(state.logModel!.body);
                  int imgUrlIndex = 0;
                  for (var item in body) {
                    //기존 localPath로 되어있던 것들을 URL로 변경
                    if (item['insert'] is Map<String, dynamic> &&
                        item['insert']['_type'] == 'image') {
                      // _type이 image인 항목의 source를 새로운 값으로 업데이트합니다.
                      if (imgUrlIndex < imgUrlList.length) {
                        item['insert']['source'] = imgUrlList[imgUrlIndex++];
                      }
                    }
                  }
                  var convertedBody = jsonEncode(body);
                  var newLogData =
                      state.logModel!.copyWith(body: convertedBody);
                  ref.read(logwriteProvider.notifier).setLog(newLogData);

                  await remoteDataSource
                      .uploadLog('log', newLogData, tagId)
                      .then((value) {
                    context.push('/log/write/upload/$tagId');
                  });
                  //이미지가 없다면
                } else {
                  await remoteDataSource
                      .uploadLog('log', state.logModel!, tagId)
                      .then((value) {
                    context.push('/log/write/upload/$tagId');
                  });
                }
              },
              child: Text(
                '게시',
                style: SLTextStyle(
                        style: SLStyle.Text_L_Regular, color: Colors.white)
                    .textStyle,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
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
                        return LogCheckbox(
                          isChecked: publicOptionList[index]['value'],
                          onChanged: (bool? value) {
                            setState(() {
                              for (int i = 0;
                                  i < publicOptionList.length;
                                  i++) {
                                publicOptionList[i]['value'] = i == index;
                              }
                              selectedPublicIndex = value == true ? index : -1;
                            });

                            SFACLogModel newState = state.logModel!.copyWith(
                                public: value == true
                                    ? publicOptionList[index]['tableValue']
                                    : '');
                            ref
                                .read(logwriteProvider.notifier)
                                .setLog(newState);
                          },
                          label: publicOptionList[index]['option'],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 34),
                      itemCount: publicOptionList.length,
                    ),
                  )
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 18,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: thumbNailList.length,
                      itemBuilder: (context, index) {
                        bool isSelected =
                            selectedThumbNailIndices[index] ?? false;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedThumbNailIndices.forEach((key, value) {
                                selectedThumbNailIndices[key] = false;
                              });
                              if (state.logModel!.images.isNotEmpty) {
                                selectedImageIndices.forEach((key, value) {
                                  selectedImageIndices[key] = false;
                                });
                              }
                              selectedThumbNailIndices[index] = !isSelected;
                              imgPath = thumbNailList[index]['url'];
                            });
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
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: isSelected
                                      ? Border.all(color: SLColor.primary)
                                      : null,
                                ),
                              ),
                              isSelected
                                  ? const Positioned(
                                      top: 12,
                                      left: 14,
                                      child: SFACTag(
                                        text: Text(' 대표 '),
                                        backgroundColor: SLColor.primary,
                                      ))
                                  : const SizedBox()
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  state.logModel!.images.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.logModel!.images.length,
                          itemBuilder: (context, index) {
                            bool isSelected =
                                selectedImageIndices[index] ?? false;
                            return FutureBuilder<Widget>(
                              future: thumbNailImages(
                                  state.logModel!.images[index]['insert']
                                      ['source']), // 비동기 함수 호출
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 18),
                                      child: GestureDetector(
                                        onTap: () {
                                          // Map을 업데이트하여 선택 상태를 토글
                                          setState(() {
                                            // 모든 아이템의 선택 상태를 false로 설정
                                            selectedImageIndices
                                                .forEach((key, value) {
                                              selectedImageIndices[key] = false;
                                            });
                                            selectedThumbNailIndices
                                                .forEach((key, value) {
                                              selectedThumbNailIndices[key] =
                                                  false;
                                            });
                                            // 현재 탭된 아이템의 상태를 true로 설정
                                            selectedImageIndices[index] =
                                                !isSelected;
                                            imgPath =
                                                state.logModel!.images[index]
                                                    ['insert']['source'];
                                          });
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 313,
                                              height: 157,
                                              decoration: BoxDecoration(
                                                color: SLColor.neutral.shade80,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: snapshot
                                                  .data!, // 비동기 작업의 결과로 받은 위젯
                                            ),
                                            Container(
                                              width: 313,
                                              height: 157,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                border: isSelected
                                                    ? Border.all(
                                                        color: SLColor.primary)
                                                    : null,
                                              ),
                                            ),
                                            isSelected
                                                ? const Positioned(
                                                    top: 12,
                                                    left: 14,
                                                    child: SFACTag(
                                                      text: Text(' 대표 '),
                                                      backgroundColor:
                                                          SLColor.primary,
                                                    ))
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }
                                }
                                // 로딩 중에는 로딩 인디케이터를 표시
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 200,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
