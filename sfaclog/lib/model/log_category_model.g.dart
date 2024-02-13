// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogCategoryModelImpl _$$LogCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LogCategoryModelImpl(
      name: json['name'] as String,
      log: json['log'] as String,
      user: json['user'] as String?,
      public: json['public'] as String,
      created: json['created'] as String?,
    );

Map<String, dynamic> _$$LogCategoryModelImplToJson(
        _$LogCategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'log': instance.log,
      'user': instance.user,
      'public': instance.public,
      'created': instance.created,
    };
