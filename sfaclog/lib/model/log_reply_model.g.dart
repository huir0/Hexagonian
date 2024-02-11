// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogReplyModelImpl _$$LogReplyModelImplFromJson(Map<String, dynamic> json) =>
    _$LogReplyModelImpl(
      id: json['id'] as String?,
      content: json['content'] as String,
      log: json['log'] as String,
      parentReplyId: json['parentReplyId'] as String,
      like: json['like'] as int,
      user: json['user'] as String,
      nestedReplies: (json['nestedReplies'] as List<dynamic>?)
          ?.map((e) => LogReplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$LogReplyModelImplToJson(_$LogReplyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'log': instance.log,
      'parentReplyId': instance.parentReplyId,
      'like': instance.like,
      'user': instance.user,
      'nestedReplies': instance.nestedReplies,
      'created': instance.created,
    };
