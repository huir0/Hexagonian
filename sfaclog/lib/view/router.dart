import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/app_wrapper.dart';
import 'package:sfaclog/view/pages/alarm_page/alarm_page.dart';
import 'package:sfaclog/view/pages/community_page/com_side_read_page.dart';
import 'package:sfaclog/view/pages/my_page/my_category_page.dart';
import 'package:sfaclog/view/pages/my_page/my_education_add_page.dart';
import 'package:sfaclog/view/pages/my_page/my_education_edit_page.dart';
import 'package:sfaclog/view/pages/my_page/my_experience_edit_page.dart';
import 'package:sfaclog/view/pages/my_page/my_link_page.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_page.dart';
import 'package:sfaclog/view/pages/my_page/my_profile_setting_page.dart';
import 'package:sfaclog/view/pages/walkthrough_page/walkthrough_page.dart';
import 'package:sfaclog/view/pages/join_page/join_complete_page.dart';
import 'package:sfaclog/view/pages/community_page/community_write_page.dart';
import 'package:sfaclog/view/pages/log_page/log_category_add_page.dart';
import 'package:sfaclog/view/pages/log_page/log_category_page.dart';
import 'package:sfaclog/view/pages/community_page/community_read.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/join_page/join_page.dart';
import 'package:sfaclog/view/pages/log_page/log_read_page.dart';
import 'package:sfaclog/view/pages/log_page/log_reply_page.dart';
import 'package:sfaclog/view/pages/log_page/log_setting_page.dart';
import 'package:sfaclog/view/pages/log_page/log_upload_done_page.dart';
import 'package:sfaclog/view/pages/login_page/login_page.dart';
import 'package:sfaclog/view/pages/log_page/log_search_page.dart';
import 'package:sfaclog/view/pages/log_page/log_write_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_account_page.dart';
import 'package:sfaclog/view/pages/my_page/my_follow_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/view/pages/my_page/my_notification_page.dart';
import 'package:sfaclog/view/pages/my_page/my_privacy_page.dart';
import 'package:sfaclog/view/pages/my_page/my_proposal_page.dart';
import 'package:sfaclog/view/pages/my_page/my_setting_page.dart';
import 'package:sfaclog/view/pages/my_page/my_withdrawal_page.dart';
import 'package:sfaclog/view/pages/onboarding_page/profile_edit_page.dart';
import 'package:sfaclog/view/pages/splash_page/splash_page.dart';

import 'pages/my_page/my_experience_add_page.dart';
import 'pages/my_page/my_terms_page.dart';

// final router = GoRouter(initialLocation: '/home', routes: [
final router = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
    path: '/splash',
    builder: (context, state) => const SplashPage(),
  ),
  GoRoute(
    path: '/walkthrough',
    builder: (context, state) => const WalkthroughPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const AppWrapper(),
  ),
  GoRoute(
    path: '/main',
    builder: (context, state) => const MainPage(),
  ),
  GoRoute(
    path: '/alert',
    builder: (context, state) => const AlarmPage(),
  ),
  GoRoute(path: '/log', builder: (context, state) => const LogPage(), routes: [
    GoRoute(
      path: 'reply/:tagId',
      builder: (context, state) {
        final tagId = state.pathParameters['tagId'];
        return LogReplyPage(tagId: tagId ?? '');
      },
    ),
    GoRoute(
      path: 'read/:tagId',
      builder: (context, state) {
        final tagId = state.pathParameters['tagId'];
        return LogReadPage(tagId: tagId ?? '');
      },
    ),
    GoRoute(
      path: 'write',
      builder: (context, state) => const LogWritePage(),
    ),
    GoRoute(
      path: 'read/:tagId',
      builder: (context, state) {
        final tagId = state.pathParameters['tagId'];
        return LogReadPage(tagId: tagId ?? '');
      },
    ),
    GoRoute(
        path: 'write',
        builder: (context, state) => const LogWritePage(),
        routes: [
          GoRoute(
            path: 'setting',
            builder: (context, state) => const LogSettingPage(),
          ),
          GoRoute(
              path: 'category',
              builder: (context, state) => const LogCategoryPage(),
              routes: [
                GoRoute(
                  path: 'add',
                  builder: (context, state) => const LogCategoryAddPage(),
                ),
              ]),
          GoRoute(
            path: 'upload/:tagId',
            builder: (context, state) {
              final tagId = state.pathParameters['tagId'];
              return LogUploadDonePage(tagId: tagId ?? '');
            },
          ),
        ]),
    GoRoute(
      path: 'search',
      builder: (context, state) => const LogSearchPage(),
    )
  ]),
  GoRoute(path: '/my', builder: (context, state) => const MyPage(), routes: [
    GoRoute(
      path: 'setting',
      builder: (context, state) => const MypageSetting(),
      routes: [
        GoRoute(
          path: 'account/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId'];
            return MypageAccount(userId: userId!);
          },
        ),
        GoRoute(
          path: 'proposestate/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId'];
            return MypageProposal(userId: userId!);
          },
        ),
        GoRoute(
          path: 'notification',
          builder: (context, state) => const MypageNotification(),
        ),
        GoRoute(
          path: 'withdrawal/:userId',
          builder: (context, state) {
            final userId = state.pathParameters['userId'];
            return MypageWithdrawal(userId: userId!);
          },
        ),
        GoRoute(
          path: 'terms',
          builder: (context, state) => const MypageTerms(),
        ),
        GoRoute(
          path: 'privacy',
          builder: (context, state) => const MypagePrivacy(),
        ),
      ],
    ),
    GoRoute(
      path: 'follow/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MyFollowPage(
          userId: userId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/setting/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MypageProfileSetting(
          userId: userId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/experience_edit/:experienceId',
      builder: (context, state) {
        final experiencId = state.pathParameters['experienceId'];
        return MypageEditExperience(
          experienceId: experiencId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/education_edit/:educationId',
      builder: (context, state) {
        final educationId = state.pathParameters['educationId'];
        return MypageEditEducation(
          educationId: educationId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/link_edit/:linkId',
      builder: (context, state) {
        final linkId = state.pathParameters['linkId'];
        return MypageEditLink(
          linkId: linkId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/experience_add/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MypageAddExperience(
          userId: userId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/education_add/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MypageAddEducation(
          userId: userId!,
        );
      },
    ),
    GoRoute(
      path: 'profile/link_add/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MypageAddLink(
          userId: userId!,
        );
      },
    ),
    GoRoute(
      path: 'log/category/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId'];
        return MypageCategory(
          userId: userId!,
        );
      },
    )
  ]),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const JoinPage(),
  ),
  GoRoute(
    path: '/profile',
    builder: (context, state) => const ProfileEditPage(),
  ),
  GoRoute(
    path: '/welcome',
    builder: (context, state) => const JoinCompletePage(),
  ),

  GoRoute(
    path: '/readqa',
    builder: (context, state) => const ComReadPage(),
  ),
  GoRoute(
    path: '/writecom',
    builder: (context, state) => const ComWritePage(),
  ),
  GoRoute(
    path: '/comsideread',
    builder: (context, state) => const ComSideReadPage(),
  ),

  // GoRoute(
  //   path: '/mypage',
  //   builder: (context, state) => MyPage(),
  //   routes: [
  //     GoRoute(
  //       path: 'edit',
  //       builder: (context, state) => const MyInfoEditPage(),
  //     ),
  //     GoRoute(
  //       path: 'deleteaccount',
  //       builder: (context, state) => const MyInfoDeleteAccountPage(),
  //     ),
  //     GoRoute(
  //       path: 'interestdetail',
  //       builder: (context, state) => const MyInterestPortfolioDetailPage(),
  //     ),
  //   ],
  // ),
  // GoRoute(
  //   path: '/community',
  //   builder: (context, state) => const CommunityPage(),
  //   routes: [
  //     GoRoute(
  //       path: 'club/:type/:clubId',
  //       builder: (context, state) {
  //         return ClubDetailPage(
  //           type: state.pathParameters['type'] ?? '',
  //           clubId: state.pathParameters['clubId'] ?? '',
  //         );
  //       },
  //       routes: [
  //         GoRoute(
  //           path: 'keyword/:dialogId',
  //           builder: (context, state) => KeywordCardDetailPage(
  //             dialogId: state.pathParameters['dialogId'] ?? '',
  //           ),
  //         ),
  //         GoRoute(
  //           path: 'keyword/all/:keywordId',
  //           builder: (context, state) => KeywordListPage(
  //             keywordId: state.pathParameters['keywordId'] ?? '',
  //           ),
  //         ),
  //       ],
  //     ),
  //     GoRoute(
  //       path: 'recruit/filter',
  //       builder: (context, state) => const RecruitFilterPage(),
  //     ),
  //     GoRoute(
  //       path: 'recruit/:recruitId',
  //       builder: (context, state) {
  //         return RecruitDetailPage(
  //           recruitId: state.pathParameters['recruitId'] ?? '',
  //         );
  //       },
  //     ),
  //     GoRoute(
  //       path: 'apply/:recruitId',
  //       builder: (context, state) => ApplyPage(
  //         recruitId: state.pathParameters['recruitId'] ?? '',
  //       ),
  //     ),
  //   ],
  // ),
]);
