import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/pages/my_page/my_education_add_page.dart';
import 'package:sfaclog/view/pages/my_page/my_experience_add_page.dart';
import 'package:sfaclog/view/pages/my_page/my_link_page.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_setting_page.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/dash_divider.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/my_toggle_widget.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/experience_card.dart';
import 'package:sfaclog/view/widgets/mypage_widgets/resume_widgets/link_card.dart';
import 'package:sfaclog/viewmodel/mypage_state_viewmodel/mypage_states.dart';
import 'package:sfaclog_widgets/chips/sl_chip.dart';
import 'package:sfaclog_widgets/sfaclog_widgets.dart';
import 'package:sfaclog_widgets/util/common.dart';

import '../../../viewmodel/mypage_tab_viewmodel/mypage_tab_notifier.dart';
import '../../router.dart';
import '../../widgets/mypage_widgets/resume_widgets/education_card.dart';

const List<Map<String, String>> qna = [
  {
    'collection': 'Q',
    'first_title': '스프링 데이터 몽고디비를 사용할 때 템플릿과 리포지토리 방법의 장단점에 대해서 알려주세요',
    'second_title': '강의나 블로그에 있는 예제를 보면 예제를 보면 리포지토리를 사용...',
    'content': '''안녕하세요 !

질문주신 내용이 Spring Data Mongodb 에서 제공해주는 Repository Interface 와 Mongo Templete 사용에 대한 질문으로 이해하였습니다.@RestController 어노테이션은 @Controller 어노테이션에 @ResponseBody 가 추가된 것으로 객체 데이터를 반환하여 전달하는것을 목적으로 합니다.
주로 RESTful API(혹은 일반적인 HTTP API) 를 구현할 때 많이 쓰입니다. 즉 @RestController 를 안쓰고 @Controller 를 통해 API 를 구현하고 싶으시다면, @Controller 를 정의하신 뒤에 @ResponseBody 어노테이션을 쓰시고, ResponseEntity 를 전달하는 형태로 구현하시면 @RestController 를 쓰는것과 동일하게 구현하실 수 있고 이때 말씀하신 html 작성은 필요하지 않습니다.

초기에는 @Controller 로 모든 상황을 구현하다가 이후 편의성과 가독성을 위해
@RestController 가 추가로 나오게 되었다고 이해해주시면 되겠습니다.

구글링 해보시면 @Controller 와 @RestController 차이가 잘 정리된 많은 글들을 접하실 수 있는데요,
그중에 잘 정리된 블로그를 추가로 첨부드립니다.

https://mangkyu.tistory.com/49

저의 짧은 지식이 조금이나마 도움이 되시길 바랍니다.'''
  },
  {
    'collection': 'Q',
    'first_title': '하나의 리액트 컴포넌트에 import 문 많은 경우 어떻게 처리해야하나요?',
    'second_title': '코드 가독성 측면에서 모듈 최상단에 import 문이 너무 많은 경...',
    'content':
        '''import 같은 경우 IDE의 도움을 받아서 코드 가독성보다는 의존성이 높아지고 응집성이 낮아지는 결합도 문제를 겪는 경우가 많습니다!... import 같은 경우는 IDE의 도움을 받아서
코드 가독성보다는 의존성이 많아져서
응집성이 낮아지고 결합도가 높아지는 문제를 겪는 경우가 많습니다!

그럴 때는 기능 또는 역할 또는 책임을 기준으로 그룹을 만들어보시고
컴포넌트 파일로 분리하면 해결될 것으로 보여요.

리팩터링/클린 코드/클린 아키텍처와 같은 도서를 참고하시면 좋을 것 같아요 :)'''
  },
];

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

List<Map<String, dynamic>> resumes = [
  {
    'company': 'sniperfactory',
    'title': 'mobile developer',
    'period_start': DateTime.now(),
    'period_end': DateTime.now(),
    'content': '스나이퍼 앱 개발(Flutter)',
    'institute': 'university',
    'major': 'architecture',
  },
  {
    'company': '스나이퍼 팩토리',
    'title': 'mobile developer2',
    'period_start': DateTime.now(),
    'period_end': null,
    'content': '스나이퍼 앱 개발(Flutter)',
    'institute': '대학교',
    'major': '건축',
  },
];
List<Map<String, dynamic>> links = [
  {
    'url': 'https://github.com/huir0',
    'title': '깃허브',
  },
  {
    'url': 'https://github.com/huir0/Hexagonian',
    'title': '육각형인재 프로젝트',
  },
];

class MyProfilePage extends ConsumerStatefulWidget {
  const MyProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends ConsumerState<MyProfilePage> {
  List<String> skills = ['javascript', 'css', 'html'];
  List<String> experiences = [];
  bool resumePublic = false;
  double progressValue = 1 / 3;

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
                              child: Text('김개발'),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      router.go('/my/follow');
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
                                    router.go('/my/follow');
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
                      child: Text('스나이퍼팩토리 x 웅진씽크빅 교육 수료완료'),
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
                          final skill = skills[index];
                          return SFACSkillChip(
                            height: 32,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            text: Text(
                              skill,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const MypageProfileSetting(),
                                  ),
                                );
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
                    Container(
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
                        '업데이트 5달전',
                        style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffd6d6d6),
                            letterSpacing: -0.08),
                      ),
                    ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const MypageAddExperience(),
                          ),
                        );
                      },
                      title: '경력',
                      // FIXME: 경력 계산해서 집어넣기
                      subText: '5개월',
                    ),
                    // 경력 데이터
                    // FIXME: experience나 resume에서 데이터 뽑아오기
                    resumes.length > 0
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < resumes.length; i++) ...[
                                  ResumeExperienceCard(resume: resumes[i]),
                                  if (i < resumes.length - 1)
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MypageAddEducation(),
                            ),
                          );
                        },
                        title: '학력/교육'),
                    // 교육 데이터
                    // FIXME: resumes => education이나 resume에서 데이터 뽑아오기
                    resumes.length > 0
                        ? Container(
                            child: Column(
                              children: [
                                for (var i = 0; i < resumes.length; i++) ...[
                                  ResumeEducationCard(resume: resumes[i]),
                                  if (i < resumes.length - 1)
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MypageAddLink(),
                            ),
                          );
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
                count: qna.length.toString(),
                posts: PostCard(posts: qna),
              ),
              SizedBox(
                height: 16,
              ),
              SFACExpandableButton(
                text: '좋아요',
                count: qna.length.toString(),
                posts: PostCard(posts: qna),
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
