// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfac_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SFACLogModelImpl _$$SFACLogModelImplFromJson(Map<String, dynamic> json) =>
    _$SFACLogModelImpl(
      title: json['title'] as String,
      category: json['category'] as String,
      body: json['body'] as String,
      imgList: json['imgList'] as List<dynamic>,
      thumbNail: json['thumbNail'] as String,
      public: json['public'] as String,
      tag: (json['tag'] as List<dynamic>).map((e) => e as String).toList(),
      user: json['user'] as String,
      view: json['view'] as int,
      like: json['like'] as int,
    );

Map<String, dynamic> _$$SFACLogModelImplToJson(_$SFACLogModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'body': instance.body,
      'imgList': instance.imgList,
      'thumbNail': instance.thumbNail,
      'public': instance.public,
      'tag': instance.tag,
      'user': instance.user,
      'view': instance.view,
      'like': instance.like,
    };
