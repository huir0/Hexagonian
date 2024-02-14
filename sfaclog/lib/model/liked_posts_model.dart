import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_posts_model.freezed.dart';

@freezed
class LikedPostModel with _$LikedPostModel {
  const factory LikedPostModel({
    required String user,
    List<dynamic>? logs,
    List<dynamic>? qnas,
  }) = _LikedPostModel;

  factory LikedPostModel.fromJson(Map<String, dynamic> json) {
    return LikedPostModel(
      user: json['user'] as String? ?? '',
      logs: json['logs'] != null
          ? (json['logs'] as List<dynamic>)
              .map((item) => item.toString())
              .toList()
          : [],
      qnas: json['qnas'] != null
          ? (json['qnas'] as List<dynamic>)
              .map((item) => item.toString())
              .toList()
          : [],
    );
  }
}
