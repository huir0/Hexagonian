// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qna_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QnaAnswerModelImpl _$$QnaAnswerModelImplFromJson(Map<String, dynamic> json) =>
    _$QnaAnswerModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      user: json['user'] as String,
      content: json['content'] as String,
      collectionName: json['collectionName'] as String,
      qna: json['qna'] as String,
      expand: json['expand'],
      qnaTitle: json['qnaTitle'] as String?,
    );

Map<String, dynamic> _$$QnaAnswerModelImplToJson(
        _$QnaAnswerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'content': instance.content,
      'collectionName': instance.collectionName,
      'qna': instance.qna,
      'expand': instance.expand,
      'qnaTitle': instance.qnaTitle,
    };
