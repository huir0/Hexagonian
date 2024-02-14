import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/profile_model.dart';

class MyPageProfileState extends Equatable {
  final List<dynamic>? experiences;
  final List<dynamic>? educations;
  final List<dynamic>? links;
  final List<dynamic>? followers;
  final List<dynamic>? followings;
  final ProfileInfo? userInfo;

  const MyPageProfileState({
    this.experiences,
    this.educations,
    this.links,
    this.followers,
    this.followings,
    this.userInfo,
  });

  @override
  List<Object?> get props => [
        experiences,
        educations,
        links,
        followers,
        followings,
        userInfo,
      ];

  MyPageProfileState copyWith({
    List<dynamic>? experiences,
    List<dynamic>? educations,
    List<dynamic>? links,
    List<dynamic>? followers,
    List<dynamic>? followings,
    ProfileInfo? userInfo,
  }) {
    return MyPageProfileState(
      experiences: experiences ?? this.experiences,
      educations: educations ?? this.educations,
      links: links ?? this.links,
      followers: followers ?? this.followers,
      followings: followings ?? this.followings,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
