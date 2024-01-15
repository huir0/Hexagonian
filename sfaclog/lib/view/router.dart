import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: '/splash', routes: [
  // GoRoute(
  //   path: '/home',
  //   builder: (context, state) => const AppWrapper(),
  // ),
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
