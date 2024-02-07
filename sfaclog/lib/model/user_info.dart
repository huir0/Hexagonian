import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/model/user_model.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    String? id,
    String? nickname,
    String? proposeState,
    List<String>? agreementState,
    String? picture,
    List<SkillModel>? skill,
    UserModel? user,
    String? introduction,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
