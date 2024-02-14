// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfac_qna_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SFACQnaModelImpl _$$SFACQnaModelImplFromJson(Map<String, dynamic> json) =>
    _$SFACQnaModelImpl(
      id: json['id'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      content: json['content'] as String,
      like: json['like'] as int,
      tag: json['tag'] as List<dynamic>,
      title: json['title'] as String,
      user: json['user'] as String,
      view: json['view'] as int,
    );

Map<String, dynamic> _$$SFACQnaModelImplToJson(_$SFACQnaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'content': instance.content,
      'like': instance.like,
      'tag': instance.tag,
      'title': instance.title,
      'user': instance.user,
      'view': instance.view,
    };
