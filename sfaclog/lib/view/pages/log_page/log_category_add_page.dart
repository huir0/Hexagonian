import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/common.dart';
import 'package:sfaclog/data/datasource/remote_datasource.dart';
import 'package:sfaclog/view/widgets/common_widget.dart';
import 'package:sfaclog/viewmodel/log_write_viewmodel/log_write_notifier.dart';

class LogCategoryAddPage extends ConsumerStatefulWidget {
  const LogCategoryAddPage({super.key});

  @override
  ConsumerState<LogCategoryAddPage> createState() => _LogCategoryAddPageState();
}

class _LogCategoryAddPageState extends ConsumerState<LogCategoryAddPage> {
  List publicOptionList = [
    {'id': 0, 'value': true, 'option': '전체 공개', 'tableValue': 'public'},
    {'id': 1, 'value': false, 'option': '비공개', 'tableValue': 'private'},
  ];
  int selectedPublicIndex = 0;
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final TextEditingController _texteditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          '카테고리 추가',
          style: SLTextStyle(style: SLStyle.Heading_S_Bold).textStyle,
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async {
                await _remoteDataSource.createTableData('category', {
                  "name": _texteditingController.value.text,
                  "log": "",
                  "users": "",
                  "public": publicOptionList[selectedPublicIndex]['tableValue']
                }).then((value) {
                  ref
                      .read(logwriteProvider.notifier)
                      .addCategory(_texteditingController.value.text);
                  context.pop();
                });
              },
              child: Text(
                '확인',
                style: SLTextStyle(
                        style: SLStyle.Text_L_Regular, color: Colors.white)
                    .textStyle,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '카테고리 이름',
                    style: SLTextStyle(
                      style: SLStyle.Text_M_Medium,
                    ).textStyle,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.end,
                      controller: _texteditingController,
                      cursorColor: SLColor.primary,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: '입력해 주세요',
                          hintStyle: SLTextStyle.Text_S_Regular,
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          )),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  '공개 설정',
                  style: SLTextStyle(
                    style: SLStyle.Text_M_Medium,
                  ).textStyle,
                ),
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
                          for (int i = 0; i < publicOptionList.length; i++) {
                            publicOptionList[i]['value'] = i == index;
                          }
                          selectedPublicIndex = value == true ? index : -1;
                        });
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
        ),
      ),
    );
  }
}
