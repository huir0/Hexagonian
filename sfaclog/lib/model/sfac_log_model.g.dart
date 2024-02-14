// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfac_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SFACLogModelImpl _$$SFACLogModelImplFromJson(Map<String, dynamic> json) =>
    _$SFACLogModelImpl(
      id: json['id'] as String,
      created: json['created'] as String,
      updated: json['updated'] as String,
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      expand: json['expand'],
      body: json['body'] as String,
      category: json['category'] as String,
      favorite: json['favorite'] as int,
      images: json['images'] as List<dynamic>,
      public: json['public'] as String,
      tag: json['tag'] as List<dynamic>,
      thumbnail: json['thumbnail'] as String,
      title: json['title'] as String,
      user: json['user'] as String,
      view: json['view'] as int,
      like: json['like'] as int,
      replyCnt: json['replyCnt'] as int?,
    );

Map<String, dynamic> _$$SFACLogModelImplToJson(_$SFACLogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'updated': instance.updated,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'expand': instance.expand,
      'body': instance.body,
      'category': instance.category,
      'favorite': instance.favorite,
      'images': instance.images,
      'public': instance.public,
      'tag': instance.tag,
      'thumbnail': instance.thumbnail,
      'title': instance.title,
      'user': instance.user,
      'view': instance.view,
      'like': instance.like,
      'replyCnt': instance.replyCnt,
    };
