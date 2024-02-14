import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sfaclog/model/resume_experience_model.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_appbar_widget.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';

import '../../../common.dart';
import '../../../data/datasource/remote_datasource.dart';

class MypageEditExperience extends ConsumerStatefulWidget {
  const MypageEditExperience({
    super.key,
    required this.experienceId,
  });
  final String experienceId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MypageEditExperienceState();
}

class _MypageEditExperienceState extends ConsumerState<MypageEditExperience> {
  final RemoteDataSource _remoteDataSource = RemoteDataSource();
  final company = TextEditingController();
  final title = TextEditingController();
  final content = TextEditingController();
  final link = TextEditingController();
  bool working = false;
  DateTime? startDate;
  DateTime? endDate;
  late ExperienceModel experience;
  @override
  void initState() {
    super.initState();
    title.addListener(updateTextLength);
    content.addListener(updateTextLength);
    Future.microtask(() => _init());
  }

  @override
  void dispose() {
    title.removeListener(updateTextLength);
    title.dispose();
    content.removeListener(updateTextLength);
    content.dispose();
    super.dispose();
  }

  void updateTextLength() {
    setState(() {});
  }

  Future<void> _init() async {
    try {
      experience = await _remoteDataSource
          .getOneRecord('experience', widget.experienceId)
          .then((value) {
        experience = ExperienceModel.fromJson(value.toJson());
        return experience;
      });
      company.text = experience.company;
      title.text = experience.title;
      content.text = experience.content;
      startDate = DateTime.parse(experience.startDate);
      endDate = DateTime.parse(experience.endDate);
      working = experience.working;
    } catch (e) {
      print('experience edit $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        onPressed: (e) {},
        title: '경력 편집',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () async {
                final body = <String, dynamic>{
                  'company': company.text,
                  'title': title.text,
                  'startDate': startDate!.toIso8601String(),
                  'endDate': endDate!.toIso8601String(),
                  'working': working,
                  'user': experience.user,
                  'content': content.text,
                };
                await _remoteDataSource.updateTableData(
                    'experience', experience.id, body);
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 34,
              ),
              SizedBox(
                width: 308,
                height: 19,
                child: Row(
                  children: [
                    Text(
                      '회사',
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
                controller: company,
                height: 46,
                width: 312,
                border: Border.all(color: SLColor.neutral[70]!),
                hintText: '회사명을 입력해주세요.',
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
                      '직함',
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
                hintText: '직함을 입력해주세요 ex)  백앤드 개발자',
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
                      '재직 일자',
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
              Row(
                children: [
                  Container(
                    width: 146,
                    height: 46,
                    decoration: BoxDecoration(
                      color: SLColor.neutral[100],
                      border: Border.all(color: SLColor.neutral[70]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            startDate = pickedDate;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              startDate != null
                                  ? DateFormat('yy-MM-dd').format(startDate!)
                                  : '시작년월',
                              style: SLTextStyle.Text_M_Medium?.copyWith(
                                  color: SLColor.neutral[60]),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      '~',
                      style: SLTextStyle.Text_S_Medium?.copyWith(
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    width: 146,
                    height: 46,
                    decoration: BoxDecoration(
                      color: SLColor.neutral[100],
                      border: Border.all(color: SLColor.neutral[70]!),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () async {
                        if (!working) {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDatePickerMode: DatePickerMode.day,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              endDate = pickedDate;
                            });
                          }
                        }
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              endDate != null
                                  ? DateFormat('yy-MM-dd').format(endDate!)
                                  : '종료년월',
                              style: SLTextStyle.Text_M_Medium?.copyWith(
                                  color: SLColor.neutral[60]),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SLCheckbox(onChange: (e) {}, value: working),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '재직 중',
                    // FIXME: semibold
                    style: SLTextStyle.Text_M_Medium?.copyWith(
                        color: Colors.white, letterSpacing: -0.12),
                  )
                ],
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
                      '스킬',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 312,
                height: 46,
                decoration: BoxDecoration(
                  color: SLColor.neutral[100],
                  border: Border.all(color: SLColor.neutral[70]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          '사용한 스킬을 입력해주세요',
                          style: SLTextStyle.Text_M_Medium?.copyWith(
                              color: SLColor.neutral[60]),
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/icons/arrow_right.svg'),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                  ),
                ),
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
                      '경력 상세 내용',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${content.text.length}/100',
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
                controller: content,
                height: 104,
                width: 312,
                border: Border.all(color: SLColor.neutral[70]!),
                hintText: '''담당한 업무, 프로젝트 및 활동을 입력해주세요.
ex) 쇼핑라이브 프론트 지면 개발''',
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
                      '링크 연결',
                      style: SLTextStyle.Text_M_Bold?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 312,
                height: 46,
                decoration: BoxDecoration(
                  color: SLColor.neutral[100],
                  border: Border.all(color: SLColor.neutral[70]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          '관련웹사이트가 있다면 URL을 추가해주세요',
                          style: SLTextStyle.Text_M_Medium?.copyWith(
                              color: SLColor.neutral[60]),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _remoteDataSource.deleteRecord(
                      'experience', widget.experienceId);
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
                  child: const Text('경력 삭제'),
                ),
              ),
              SizedBox(
                height: 63,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
