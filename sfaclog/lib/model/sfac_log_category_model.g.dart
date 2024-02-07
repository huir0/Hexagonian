// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sfac_log_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SFACLogCategoryModelImpl _$$SFACLogCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SFACLogCategoryModelImpl(
      name: json['name'] as String,
      log: json['log'] as List<dynamic>,
      users: json['users'] as String,
      public: json['public'] as String,
    );

Map<String, dynamic> _$$SFACLogCategoryModelImplToJson(
        _$SFACLogCategoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'log': instance.log,
      'users': instance.users,
      'public': instance.public,
    };
