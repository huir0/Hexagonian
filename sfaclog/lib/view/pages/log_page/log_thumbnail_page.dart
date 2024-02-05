import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';

class LogThumbNailPage extends ConsumerStatefulWidget {
  const LogThumbNailPage({super.key});

  @override
  ConsumerState<LogThumbNailPage> createState() => _LogThumbNailPageState();
}

class _LogThumbNailPageState extends ConsumerState<LogThumbNailPage> {
  int selectedThumbNailIndex = -1;
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
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('썸네일 선택'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                context.pop(state.logModel!.images[selectedThumbNailIndex]
                    ['insert']['source']);
              },
              child: const Text('확인'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: GestureDetector(
            onTap: () {},
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.logModel!.images.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedThumbNailIndex == index;
                return FutureBuilder<Widget>(
                  future: thumbNailImages(state.logModel!.images[index]
                      ['insert']['source']), // 비동기 함수 호출
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: GestureDetector(
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
                                  decoration: BoxDecoration(
                                    color: SLColor.neutral.shade80,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: snapshot.data!, // 비동기 작업의 결과로 받은 위젯
                                ),
                                Container(
                                  width: 313,
                                  height: 157,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? SLColor.primary.shade80
                                            .withOpacity(0.2)
                                        : SLColor.neutral.shade80
                                            .withOpacity(0.2),
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
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                    }
                    // 로딩 중에는 로딩 인디케이터를 표시
                    return const SizedBox(
                      height: 200,
                      width: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
