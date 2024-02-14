import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/log_category_model.dart';

class MyPageLogState extends Equatable {
  final List<dynamic> userLogs;
  final List<dynamic> likedPosts;
  final List<dynamic> bookmarkedLogs;
  final int replies;
  final List<LogCategoryModel> categoryList;
  final String category;
  final int categoryIndex;

  const MyPageLogState({
    required this.userLogs,
    required this.likedPosts,
    required this.bookmarkedLogs,
    required this.replies,
    required this.categoryList,
    required this.category,
    required this.categoryIndex,
  });

  @override
  List<Object?> get props => [
        userLogs,
        likedPosts,
        bookmarkedLogs,
        replies,
        categoryList,
        category,
        categoryIndex
      ];

  MyPageLogState copyWith({
    List<dynamic>? userLogs,
    List<dynamic>? likedPosts,
    List<dynamic>? bookmarkedLogs,
    int? replies,
    List<LogCategoryModel>? categoryList,
    String? category,
    int? categoryIndex,
  }) {
    return MyPageLogState(
      userLogs: userLogs ?? this.userLogs,
      likedPosts: likedPosts ?? this.likedPosts,
      bookmarkedLogs: bookmarkedLogs ?? this.bookmarkedLogs,
      replies: replies ?? this.replies,
      categoryList: categoryList ?? this.categoryList,
      category: category ?? this.category,
      categoryIndex: categoryIndex ?? this.categoryIndex,
    );
  }
}
