import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/model/profile_model.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/dash_divider.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_toggle_widget.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/experience_card.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/link_card.dart';
import 'package:sfaclog/viewmodel/auth/user_info_notifier.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_notifier.dart';
import 'package:sfaclog/viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import 'package:sfaclog/viewmodel/my_qna_viewmodel/my_qna_notifier.dart';
import 'package:sfaclog/viewmodel/mypage_state_viewmodel/mypage_states.dart';
import 'package:sfaclog_widgets/chips/sl_chip.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';
import '../../widgets/mypage_widgets/resume_widgets/education_card.dart';

const List<Map<String, dynamic>> reviews = [
  {
    'profile_image': 'dfdfd.jpg',
    'reviewer': '김개발',
    'rating': 5,
    'updatedOn': 2023 - 12 - 31,
    'content': '너무 잘하십니다.',
  },
  {
    'profile_image': 'dfdfd.jpg',
    'reviewer': '장개발',
    'rating': 3,
    'updatedOn': 2022 - 12 - 31,
    'content': '그냥 그래요.',
  },
  {
    'profile_image': 'dfdfd.jpg',
    'reviewer': '이개발',
    'rating': 4.5,
    'updatedOn': 2023 - 11 - 30,
    'content': '너무 잘하십니다.',
  },
  {
    'profile_image': 'dfdfd.jpg',
    'reviewer': '박개발',
    'rating': 1,
    'updatedOn': 2023 - 12 - 31,
    'content': '너무 못해요.',
  },
];

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  List<String> skills = ['javascript', 'css', 'html'];
  late List<dynamic> experiences = [];
  late List<dynamic> educations = [];
  late List<dynamic> links = [];
  late List<dynamic> likedPosts = [];
  late List<dynamic> qnaAnswers = [];
  bool resumePublic = false;
  double progressValue = 0;
  String userId = '7n5leq73rgpoutw';
  ProfileInfo userInfo = ProfileInfo(
      recentSearch: '',
      nickname: '',
      agreement: [],
      profile: '',
      proposeState: '',
      collectionId: '',
      collectionName: '',
      updated: '',
      created: '',
      skill: []);
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    try {
      experiences =
          await ref.read(MyPageProfileProvider.notifier).getExperiences(userId);
      educations =
          await ref.read(MyPageProfileProvider.notifier).getEducations(userId);
      links = await ref.read(MyPageProfileProvider.notifier).getLinks(userId);
      userInfo =
          await ref.read(MyPageProfileProvider.notifier).getUserInfo(userId);
      likedPosts =
          await ref.read(myPageLogProvider.notifier).getLikedPosts(userId);
      qnaAnswers =
          await ref.read(myPageQnaProvider.notifier).getUserQnaAnswers(userId);
      setState(() {
        progressValue = ((experiences.isNotEmpty ? 1 : 0) +
                (educations.isNotEmpty ? 1 : 0) +
                (links.isNotEmpty ? 1 : 0)) /
            3;
      });
    } catch (e) {
      print("Error loading profile data: $e");
    }
  }

  String formatDateDifference(Duration difference) {
    if (difference.inDays < 30) {
      return "${difference.inDays}일 전";
    } else {
      var months = difference.inDays ~/ 30;
      return "${months}달 전";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 360,
        height: 740 - 200,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              // 프로필 카드
              Container(
                height: 272,
                padding: EdgeInsets.only(top: 16, left: 22, right: 22),
                decoration: BoxDecoration(
                  color: SLColor.neutral[80],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      // profile picture
                      children: [
                        Container(
                          height: 92,
                          width: 92,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // nickname
                            Container(
                              height: 21,
                              child: Text(userInfo.nickname ?? '로딩중'),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      context.push('/my/follow/$userId');
                                      ref
                                          .read(myFollowPageProvider.notifier)
                                          .tabChanged(0);
                                    },
                                    child: Row(
                                      children: [
                                        Text('팔로잉'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('1'),
                                      ],
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.push('/my/follow/$userId');
                                    ref
                                        .read(myFollowPageProvider.notifier)
                                        .tabChanged(1);
                                  },
                                  child: Row(
                                    children: [
                                      Text('팔로워'),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('10'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 50,
                      child: Text(userInfo.introduction ?? '로딩중'),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 270,
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: skills.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final skill = userInfo.skill?[index];
                          return SFACSkillChip(
                            height: 32,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            text: Text(
                              skill ?? '로딩중',
                              style: SLTextStyle.Text_S_Bold?.copyWith(
                                  fontFamily: 'Pretendard'),
                            ),
                            borderColor: Color(0xff0059FF),
                            backgroundColor: Color(0xff333333),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 130,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  backgroundColor: SLColor.neutral[90],
                                  padding: EdgeInsets.all(0)),
                              onPressed: () {
                                context.push('/my/profile/setting/$userId');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 9.7,
                                      height: 9.7,
                                      child: SvgPicture.asset(
                                          'assets/icons/pencil.svg')),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '편집',
                                          style:
                                              SLTextStyle.Text_S_Bold?.copyWith(
                                                  color: SLColor.neutral[10]),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 130,
                            height: 30,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  backgroundColor: SLColor.neutral[90],
                                  padding: EdgeInsets.all(0)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 9.7,
                                      height: 9.7,
                                      child: SvgPicture.asset(
                                          'assets/icons/share.svg')),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '프로필 공유',
                                          style:
                                              SLTextStyle.Text_S_Bold?.copyWith(
                                                  color: SLColor.neutral[10]),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // 이력서 공개
              Container(
                width: 312,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: SLColor.neutral[80]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '이력서 비공개',
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white),
                    ),
                    Spacer(),
                    MypageToggle(toggleProvider: resumePublicProvider),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                height: 17,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '👑 이력서 완성도',
                      // FIXME: semibold
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    // TODO: 레코드 중에 가장 최신인 걸로 뽑아서 now에서 시간 빼기
                    experiences.isNotEmpty
                        ? Container(
                            alignment: Alignment.center,
                            width: 64,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xffd6d6d6),
                              ),
                            ),
                            child: Text(
                              '업데이트 ${formatDateDifference(DateTime.now().toUtc().difference(DateTime.parse(experiences[0].updated)))}',
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffd6d6d6),
                                  letterSpacing: -0.08),
                            ),
                          )
                        : Container(),
                    Spacer(),
                    Text(
                      '${(progressValue * 100).roundToDouble().toStringAsFixed(0)}%',
                      // FIXME: semibold
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Color(0xFF397EFF)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // progress indicator
              Container(
                height: 6,
                child: LinearProgressIndicator(
                  // TODO: 채워진 만큼 밸류 바꿔주기
                  value: progressValue,
                  color: SLColor.primary[100],
                  borderRadius: BorderRadius.circular(2.5),
                  backgroundColor: SLColor.neutral[60],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    SFACResumeButton(
                      onPressed: () {
                        context.push('/my/profile/experience_add/$userId');
                      },
                      title: '경력',
                      // FIXME: 경력 계산해서 집어넣기
                      subText: '5개월',
                    ),
                    // 경력 데이터
                    // FIXME: experience나 resume에서 데이터 뽑아오기
                    experiences.length > 0
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0;
                                    i < experiences.length;
                                    i++) ...[
                                  ResumeExperienceCard(
                                      experience: experiences[i]),
                                  if (i < experiences.length - 1)
                                    CustomPaint(
                                      painter: DashedLinePainter(),
                                      size: Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '경력 사항을 추가해주세요.',
                              // FIXME: semibold
                              style: SLTextStyle.Text_XS_Medium?.copyWith(
                                  color: SLColor.neutral[40]),
                            ),
                          ),
                    SizedBox(
                      height: 4,
                    ),
                    SFACResumeButton(
                        onPressed: () {
                          context.push('/my/profile/education_add/$userId');
                        },
                        title: '학력/교육'),
                    // 교육 데이터
                    // FIXME: resumes => education이나 resume에서 데이터 뽑아오기
                    educations.length > 0
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < educations.length; i++) ...[
                                  ResumeEducationCard(education: educations[i]),
                                  if (i < educations.length - 1)
                                    CustomPaint(
                                      painter: DashedLinePainter(),
                                      size: Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '학력/교육 사항을 추가해주세요.',
                              // FIXME: semibold
                              style: SLTextStyle.Text_XS_Medium?.copyWith(
                                  color: SLColor.neutral[40]),
                            ),
                          ),

                    SizedBox(
                      height: 4,
                    ),
                    SFACResumeButton(
                        onPressed: () {
                          context.push('/my/profile/link_add/$userId');
                        },
                        title: '링크'),
                    links.length > 0
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < links.length; i++) ...[
                                  ResumeLinkCard(link: links[i]),
                                  if (i < links.length - 1)
                                    CustomPaint(
                                      painter: DashedLinePainter(),
                                      size: Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '블로그, SNS등 다양한 링크로 나를 표현해주세요',
                              // FIXME: semibold
                              style: SLTextStyle.Text_XS_Medium?.copyWith(
                                  color: SLColor.neutral[40]),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Row(
                  children: [
                    Container(),
                    Text('🌱 활동 내역'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SFACExpandableButton(
                text: 'QnA 답변',
                count: qnaAnswers.length.toString(),
                posts: PostCard(posts: qnaAnswers),
              ),
              SizedBox(
                height: 16,
              ),
              SFACExpandableButton(
                text: '좋아요',
                count: likedPosts.length.toString(),
                posts: PostCard(posts: likedPosts),
              ),
              SizedBox(
                height: 16,
              ),
              SFACExpandableButton(
                text: '협업후기',
                count: reviews.length.toString(),
                posts: ReviewCard(reviews: reviews),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
