import 'package:equatable/equatable.dart';


class MyPageLogState extends Equatable {
  final List<dynamic> userLogs;
  final List<dynamic> likedPosts;
  final List<dynamic> bookmarkedLogs;
  final int replies;

  const MyPageLogState({
    required this.userLogs,
    required this.likedPosts,
    required this.bookmarkedLogs,
    required this.replies,
  });

  @override
  List<Object?> get props => [
        userLogs,
        likedPosts,
        bookmarkedLogs,
        replies,
      ];

  MyPageLogState copyWith({
    List<dynamic>? userLogs,
    List<dynamic>? likedPosts,
    List<dynamic>? bookmarkedLogs,
    int? replies,
  }) {
    return MyPageLogState(
      userLogs: userLogs ?? this.userLogs,
      likedPosts: likedPosts ?? this.likedPosts,
      bookmarkedLogs: bookmarkedLogs ?? this.bookmarkedLogs,
      replies: replies ?? this.replies,
    );
  }
}
