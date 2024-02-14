import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/model/link_model.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../../data/datasource/remote_datasource.dart';
import '../../widgets/mypage_widgets/my_appbar_widget.dart';

class MypageAddLink extends StatefulWidget {
  const MypageAddLink({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  State<MypageAddLink> createState() => _MypageAddLinkState();
}

class _MypageAddLinkState extends State<MypageAddLink> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final link = TextEditingController();
  final title = TextEditingController();
  @override
  void initState() {
    super.initState();
    title.addListener(updateTextLength);
  }

  @override
  void dispose() {
    title.removeListener(updateTextLength);
    title.dispose();
    super.dispose();
  }

  void updateTextLength() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '링크 추가',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () async {
                if (title.text.isNotEmpty && link.text.isNotEmpty) {
                  final body = <String, dynamic>{
                    "name": title.text,
                    "user": widget.userId,
                    'link': link.text
                  };
                  await _remoteDataSource.createTableData('link', body);
                }
                context.push('/home');
              },
              child: Text(
                '확인',
                style: SLTextStyle.Text_L_Regular?.copyWith(
                    color: SLColor.neutral[20]),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '링크 연결',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              controller: link,
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'https://',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '제목',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                  const Spacer(),
                  Text(
                    '${title.text.length}/50',
                    style: SLTextStyle.Text_S_Medium?.copyWith(
                      color: SLColor.neutral[50],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              controller: title,
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'ex) 김개발의 포트폴리오',
              hintTextColor: SLColor.neutral[60]!,
            ),
          ],
        ),
      ),
    );
  }
}

class MypageEditLink extends StatefulWidget {
  const MypageEditLink({
    super.key,
    required this.linkId,
  });
  final String linkId;

  @override
  State<MypageEditLink> createState() => _MypageEditLinkState();
}

class _MypageEditLinkState extends State<MypageEditLink> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final link = TextEditingController();
  final title = TextEditingController();
  late LinkModel linkRecord;
  @override
  void initState() {
    super.initState();
    title.addListener(updateTextLength);
    Future.microtask(() => _init());
  }

  @override
  void dispose() {
    title.removeListener(updateTextLength);
    title.dispose();
    super.dispose();
  }

  void updateTextLength() {
    setState(() {});
  }

  Future<void> _init() async {
    try {
      linkRecord = await _remoteDataSource
          .getOneRecord('link', widget.linkId)
          .then((value) {
        linkRecord = LinkModel.fromJson(value.toJson());
        return linkRecord;
      });

      title.text = linkRecord.name;
      link.text = linkRecord.link;
    } catch (e) {
      print('experience edit $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '링크 편집',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () async {
                final body = <String, dynamic>{
                  "name": title.text,
                  'link': link.text
                };
                await _remoteDataSource.updateTableData(
                    'link', linkRecord.id, body);
                context.push('/home');
              },
              child: Text(
                '확인',
                style: SLTextStyle.Text_L_Regular?.copyWith(
                    color: SLColor.neutral[20]),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: 360,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '링크 연결',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              controller: link,
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'https://',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const SizedBox(
              height: 28,
            ),
            SizedBox(
              width: 308,
              height: 19,
              child: Row(
                children: [
                  Text(
                    '제목',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '*',
                    style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: const Color(0xffD3265C)),
                  ),
                  const Spacer(),
                  Text(
                    '${title.text.length}/50',
                    style: SLTextStyle.Text_S_Medium?.copyWith(
                      color: SLColor.neutral[50],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SFACTextField(
              controller: title,
              height: 46,
              width: 312,
              border: Border.all(color: SLColor.neutral[70]!),
              hintText: 'ex) 김개발의 포트폴리오',
              hintTextColor: SLColor.neutral[60]!,
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _remoteDataSource.deleteRecord('link', widget.linkId);
                context.push('/home');
              },
              child: Container(
                width: 63,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: SLColor.neutral[30]!,
                    ),
                  ),
                ),
                child: const Text('링크 삭제'),
              ),
            ),
            const SizedBox(height: 63),
          ],
        ),
      ),
    );
  }
}
