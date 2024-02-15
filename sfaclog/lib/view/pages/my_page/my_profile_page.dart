import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/dash_divider.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_toggle_widget.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/experience_card.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/link_card.dart';
import 'package:sfaclog/viewmodel/my_log_viewmodel/my_log_notifier.dart';
import 'package:sfaclog/viewmodel/my_profile_viewmodel/my_profile_notifier.dart';
import 'package:sfaclog/viewmodel/my_qna_viewmodel/my_qna_notifier.dart';
import 'package:sfaclog/viewmodel/mypage_state_viewmodel/toggle_notifier.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

import '../../../viewmodel/log_viewmodel/log_notifier.dart';
import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';
import '../../widgets/mypage_widgets/resume_widgets/education_card.dart';

const List<Map<String, dynamic>> reviews = [
  {
    'profile_image': 'assets/avatars/avatar_00',
    'reviewer': '김개발',
    'rating': 5,
    'updatedOn': 2023 - 12 - 31,
    'content': '너무 잘하십니다.',
  },
  {
    'profile_image': 'assets/avatars/avatar_08',
    'reviewer': '장개발',
    'rating': 3,
    'updatedOn': 2022 - 12 - 31,
    'content': '그냥 그래요.',
  },
  {
    'profile_image': 'assets/avatars/avatar_09',
    'reviewer': '이개발',
    'rating': 4.5,
    'updatedOn': 2023 - 11 - 30,
    'content': '너무 잘하십니다.',
  },
  {
    'profile_image': 'assets/avatars/avatar_01',
    'reviewer': '박개발',
    'rating': 1,
    'updatedOn': 2023 - 12 - 31,
    'content': '너무 못해요.',
  },
];

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({
    super.key,
    required this.userInfo,
    required this.userId,
  });
  final dynamic userInfo;
  final String userId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  late List<dynamic> skills = [];
  late List<dynamic> educations = [];
  late List<dynamic> links = [];
  late List<dynamic> likedPosts = [];
  late List<dynamic> qnaAnswers = [];
  String avatarUrl = '';
  int following = 0;
  int follower = 0;
  dynamic userInfo;
  @override
  void initState() {
    super.initState();
    userInfo = widget.userInfo;
    _init();
  }

  Future<void> _init() async {
    try {
      var newUserInfo = await ref
          .read(MyPageProfileProvider.notifier)
          .getUserInfo(widget.userId);
      skills = await ref
          .read(MyPageProfileProvider.notifier)
          .getTags('skills', userInfo['skill']);
      var newAvatarUrl =
          await ref.read(logProvider.notifier).getAvatarUrl(widget.userId);
      var newExperiences = await ref
          .read(MyPageProfileProvider.notifier)
          .getExperiences(widget.userId);
      var newEducations = await ref
          .read(MyPageProfileProvider.notifier)
          .getEducations(widget.userId);
      var newLinks = await ref
          .read(MyPageProfileProvider.notifier)
          .getLinks(widget.userId);
      likedPosts = await ref
          .read(myPageLogProvider.notifier)
          .getLikedPosts(widget.userId);
      qnaAnswers = await ref
          .read(myPageQnaProvider.notifier)
          .getUserQnaAnswers(widget.userId);
      var followerList = await ref
          .watch(MyPageProfileProvider.notifier)
          .getFollowers(widget.userId);
      var followingList = await ref
          .watch(MyPageProfileProvider.notifier)
          .getFollowings(widget.userId);
      ref.read(MyPageProfileProvider.notifier).setEducations(newEducations);
      ref.read(MyPageProfileProvider.notifier).setExperiences(newExperiences);
      ref.read(MyPageProfileProvider.notifier).setLinks(newLinks);
      ref.read(MyPageProfileProvider.notifier).setUserInfo(newUserInfo);

      setState(() {
        avatarUrl = newAvatarUrl;
        follower = followerList.length;
        following = followingList.length;
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
      return "$months달 전";
    }
  }

  @override
  Widget build(BuildContext context) {
    var experiences = ref.watch(MyPageProfileProvider).experiences;
    var educations = ref.watch(MyPageProfileProvider).educations;
    var links = ref.watch(MyPageProfileProvider).links!;
    var idUserInfo = ref.watch(MyPageProfileProvider).userInfo;
    DateTime latestUpdate = DateTime.now();
    double progressValue = ((experiences!.isNotEmpty ? 1 : 0) +
            (educations!.isNotEmpty ? 1 : 0) +
            (links.isNotEmpty ? 1 : 0)) /
        3;
    // 이력서 업데이트 날짜
    if (experiences.isNotEmpty) {
      latestUpdate = DateTime.parse(experiences[0].updated);
      for (var experience in experiences) {
        if (DateTime.parse(experience.updated).isAfter(latestUpdate)) {
          latestUpdate = DateTime.parse(experience.updated);
        }
      }
      for (var education in educations) {
        if (DateTime.parse(education.updated).isAfter(latestUpdate)) {
          latestUpdate = DateTime.parse(education.updated);
        }
      }
      for (var link in links) {
        if (DateTime.parse(link.updated).isAfter(latestUpdate)) {
          latestUpdate = DateTime.parse(link.updated);
        }
      }
    }

    return Material(
      child: Container(
        width: 360,
        height: 740 - 200,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 26,
              ),
              // 프로필 카드
              Container(
                height: 272,
                padding: const EdgeInsets.only(top: 16, left: 22, right: 22),
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: avatarUrl != ''
                              ? SvgPicture.network(
                                  avatarUrl,
                                )
                              : const SizedBox(),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // nickname
                            SizedBox(
                              height: 21,
                              child: Text(idUserInfo!.nickname),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      context
                                          .push('/my/follow/${widget.userId}');
                                      ref
                                          .read(myFollowPageProvider.notifier)
                                          .tabChanged(0);
                                    },
                                    child: Row(
                                      children: [
                                        const Text('팔로잉'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(following.toString()),
                                      ],
                                    )),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    context.push('/my/follow/${widget.userId}');
                                    ref
                                        .read(myFollowPageProvider.notifier)
                                        .tabChanged(1);
                                  },
                                  child: Row(
                                    children: [
                                      const Text('팔로워'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(follower.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      child: Text(idUserInfo.introduction!),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: 270,
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: skills.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final skill = skills[index];
                          return SFACSkillChip(
                            height: 32,
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            text: Text(
                              skill ?? '로딩중',
                              style: SLTextStyle.Text_S_Bold?.copyWith(
                                  fontFamily: 'Pretendard'),
                            ),
                            borderColor: const Color(0xff0059FF),
                            backgroundColor: const Color(0xff333333),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
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
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {
                                context.push(
                                    '/my/profile/setting/${widget.userId}');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 9.7,
                                      height: 9.7,
                                      child: SvgPicture.asset(
                                          'assets/icons/pencil.svg')),
                                  const SizedBox(
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
                          const SizedBox(
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
                                  padding: const EdgeInsets.all(0)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 9.7,
                                      height: 9.7,
                                      child: SvgPicture.asset(
                                          'assets/icons/share.svg')),
                                  const SizedBox(
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
              const SizedBox(
                height: 16,
              ),
              // 이력서
              // 이력서 공개
              Container(
                width: 312,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: SLColor.neutral[80]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      '이력서 비공개',
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: Colors.white),
                    ),
                    const Spacer(),
                    MypageToggle(
                      userId: widget.userId,
                      profileProvider: toggleProvider,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
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
                    const SizedBox(
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
                                color: const Color(0xffd6d6d6),
                              ),
                            ),
                            child: Text(
                              '업데이트 ${formatDateDifference(DateTime.now().toUtc().difference(latestUpdate))}',
                              style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffd6d6d6),
                                  letterSpacing: -0.08),
                            ),
                          )
                        : Container(),
                    const Spacer(),
                    Text(
                      '${(progressValue * 100).roundToDouble().toStringAsFixed(0)}%',
                      // FIXME: semibold
                      style: SLTextStyle.Text_M_Medium?.copyWith(
                          color: const Color(0xFF397EFF)),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // progress indicator
              SizedBox(
                height: 6,
                child: LinearProgressIndicator(
                  value: progressValue,
                  color: SLColor.primary[100],
                  borderRadius: BorderRadius.circular(2.5),
                  backgroundColor: SLColor.neutral[60],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    SFACResumeButton(
                      onPressed: () {
                        context.push(
                            '/my/profile/experience_add/${widget.userId}');
                      },
                      title: '경력',
                      // FIXME: 경력 계산해서 집어넣기
                      subText: '5개월',
                    ),
                    // 경력 데이터
                    // FIXME: experience나 resume에서 데이터 뽑아오기
                    experiences.isNotEmpty
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
                                      size: const Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '경력 사항을 추가해주세요.',
                              // FIXME: semibold
                              style: SLTextStyle.Text_XS_Medium?.copyWith(
                                  color: SLColor.neutral[40]),
                            ),
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    SFACResumeButton(
                        onPressed: () {
                          context.push(
                              '/my/profile/education_add/${widget.userId}');
                        },
                        title: '학력/교육'),
                    // 교육 데이터
                    // FIXME: resumes => education이나 resume에서 데이터 뽑아오기
                    educations.isNotEmpty
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < educations.length; i++) ...[
                                  ResumeEducationCard(education: educations[i]),
                                  if (i < educations.length - 1)
                                    CustomPaint(
                                      painter: DashedLinePainter(),
                                      size: const Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '학력/교육 사항을 추가해주세요.',
                              // FIXME: semibold
                              style: SLTextStyle.Text_XS_Medium?.copyWith(
                                  color: SLColor.neutral[40]),
                            ),
                          ),

                    const SizedBox(
                      height: 4,
                    ),
                    SFACResumeButton(
                        onPressed: () {
                          context.push('/my/profile/link_add/${widget.userId}');
                        },
                        title: '링크'),
                    links.isNotEmpty
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < links.length; i++) ...[
                                  ResumeLinkCard(link: links[i]),
                                  if (i < links.length - 1)
                                    CustomPaint(
                                      painter: DashedLinePainter(),
                                      size: const Size(280, 1),
                                    ),
                                ]
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
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
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Row(
                  children: [
                    Container(),
                    const Text('🌱 활동 내역'),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SFACExpandableButton(
                text: 'QnA 답변',
                count: qnaAnswers.length.toString(),
                posts: PostCard(posts: qnaAnswers),
              ),
              const SizedBox(
                height: 16,
              ),
              SFACExpandableButton(
                text: '좋아요',
                count: likedPosts.length.toString(),
                posts: PostCard(posts: likedPosts),
              ),
              const SizedBox(
                height: 16,
              ),
              SFACExpandableButton(
                text: '협업후기',
                count: reviews.length.toString(),
                posts: const ReviewCard(reviews: reviews),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
