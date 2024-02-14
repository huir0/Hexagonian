import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
// part 'profile_model.g.dart';

@freezed
class ProfileInfo with _$ProfileInfo {
  const factory ProfileInfo({
    required String nickname,
    required List<String> agreement,
    String? picture,
    required String profile,
    String? introduction,
    List<String>? skill,
    required String recentSearch,
    required String proposeState,
    required String collectionId,
    required String collectionName,
    required String updated,
    required String created,
  }) = _ProfileInfo;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) {
    return ProfileInfo(
      nickname: json['nickname'] as String? ?? '',
      agreement: (json['agreement'] as List<dynamic>?)?.map((item) => item as String).toList() ?? [],
      picture: json['picture'] as String?,
      profile: json['profile'] as String? ?? '',
      introduction: json['introduction'] as String?,
      skill: (json['skill'] as List<dynamic>?)?.map((item) => item as String).toList(),
      recentSearch: json['recentSearch'] as String? ?? '',
      proposeState: json['proposeState'] as String? ?? '',
      collectionId: json['collectionId'] as String? ?? '',
      collectionName: json['collectionName'] as String? ?? '',
      updated: json['updated'] as String? ?? '',
      created: json['created'] as String? ?? '',
    );
  }
}
