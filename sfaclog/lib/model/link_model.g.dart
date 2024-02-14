// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkModelImpl _$$LinkModelImplFromJson(Map<String, dynamic> json) =>
    _$LinkModelImpl(
      id: json['id'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      link: json['link'] as String,
      user: json['user'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$LinkModelImplToJson(_$LinkModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'link': instance.link,
      'user': instance.user,
      'name': instance.name,
    };
