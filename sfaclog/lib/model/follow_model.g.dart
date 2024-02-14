// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowModelImpl _$$FollowModelImplFromJson(Map<String, dynamic> json) =>
    _$FollowModelImpl(
      id: json['id'] as String,
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      expand: json['expand'] as Map<String, dynamic>,
      follower: json['follower'] as String,
      following: json['following'] as String,
    );

Map<String, dynamic> _$$FollowModelImplToJson(_$FollowModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'expand': instance.expand,
      'follower': instance.follower,
      'following': instance.following,
    };
