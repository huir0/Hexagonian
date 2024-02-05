import 'package:go_router/go_router.dart';
import 'package:sfaclog/view/app_wrapper.dart';
import 'package:sfaclog/view/pages/log_page/log_category_page.dart';
import 'package:sfaclog/view/pages/community_page/community_read.dart';
import 'package:sfaclog/view/pages/community_page/community_sideproject.dart';
import 'package:sfaclog/view/pages/log_page/log_page.dart';
import 'package:sfaclog/view/pages/join_page/join_page.dart';
import 'package:sfaclog/view/pages/log_page/log_read_page.dart';
import 'package:sfaclog/view/pages/log_page/log_reply_page.dart';
import 'package:sfaclog/view/pages/log_page/log_setting_page.dart';
import 'package:sfaclog/view/pages/log_page/log_thumbnail_page.dart';
import 'package:sfaclog/view/pages/login_page/login_page.dart';
import 'package:sfaclog/view/pages/log_page/log_search_page.dart';
import 'package:sfaclog/view/pages/log_page/log_write_page.dart';
import 'package:sfaclog/view/pages/main_page/main_page.dart';
import 'package:sfaclog/view/pages/my_page/my_page.dart';
import 'package:sfaclog/view/widgets/com_read_wiget/com_read_header_wiget.dart';

final router = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => const AppWrapper(),
  ),
  GoRoute(
    path: '/main',
    builder: (context, state) => const MainPage(),
  ),
  GoRoute(path: '/log', builder: (context, state) => const LogPage(), routes: [
    GoRoute(
      path: 'reply',
      builder: (context, state) => const LogReplyPage(),
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
            path: 'thumbnail',
            builder: (context, state) => const LogThumbNailPage(),
          ),
          GoRoute(
            path: 'category',
            builder: (context, state) => const LogCategoryPage(),
          ),
        ]),
    GoRoute(
      path: 'search',
      builder: (context, state) => const LogSearchPage(),
    )
  ]),
  GoRoute(
    path: '/my',
    builder: (context, state) => const MyPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const JoinPage(),
  ),

  GoRoute(
    path: '/sideproject',
    builder: (context, state) => ComSidePage(),
  ),
  GoRoute(
    path: '/readqa',
    builder: (context, state) => ComReadPage(),
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
