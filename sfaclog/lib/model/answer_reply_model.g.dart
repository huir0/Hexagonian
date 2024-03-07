// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnswerReplyModelImpl _$$AnswerReplyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnswerReplyModelImpl(
      id: json['id'] as String?,
      content: json['content'] as String,
      answerId: json['answerId'] as String,
      like: json['like'] as int,
      author: json['author'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      expand: json['expand'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$AnswerReplyModelImplToJson(
        _$AnswerReplyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'answerId': instance.answerId,
      'like': instance.like,
      'author': instance.author,
      'created': instance.created,
      'updated': instance.updated,
      'expand': instance.expand,
    };
