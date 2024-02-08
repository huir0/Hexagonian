// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['id'] as String?,
      nickname: json['nickname'] as String?,
      proposeState: json['proposeState'] as String?,
      agreementState: (json['agreementState'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      picture: json['picture'] as String?,
      skill: (json['skill'] as List<dynamic>?)
          ?.map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as String),
      introduction: json['introduction'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'proposeState': instance.proposeState,
      'agreementState': instance.agreementState,
      'picture': instance.picture,
      'skill': instance.skill,
      'user': instance.user,
      'introduction': instance.introduction,
    };
