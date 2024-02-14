// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) {
  return _LinkModel.fromJson(json);
}

/// @nodoc
mixin _$LinkModel {
  String get id => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;
  String get collectionId => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkModelCopyWith<LinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkModelCopyWith<$Res> {
  factory $LinkModelCopyWith(LinkModel value, $Res Function(LinkModel) then) =
      _$LinkModelCopyWithImpl<$Res, LinkModel>;
  @useResult
  $Res call(
      {String id,
      String created,
      String updated,
      String collectionId,
      String collectionName,
      String link,
      String user,
      String name});
}

/// @nodoc
class _$LinkModelCopyWithImpl<$Res, $Val extends LinkModel>
    implements $LinkModelCopyWith<$Res> {
  _$LinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? collectionId = null,
    Object? collectionName = null,
    Object? link = null,
    Object? user = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkModelImplCopyWith<$Res>
    implements $LinkModelCopyWith<$Res> {
  factory _$$LinkModelImplCopyWith(
          _$LinkModelImpl value, $Res Function(_$LinkModelImpl) then) =
      __$$LinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String created,
      String updated,
      String collectionId,
      String collectionName,
      String link,
      String user,
      String name});
}

/// @nodoc
class __$$LinkModelImplCopyWithImpl<$Res>
    extends _$LinkModelCopyWithImpl<$Res, _$LinkModelImpl>
    implements _$$LinkModelImplCopyWith<$Res> {
  __$$LinkModelImplCopyWithImpl(
      _$LinkModelImpl _value, $Res Function(_$LinkModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? updated = null,
    Object? collectionId = null,
    Object? collectionName = null,
    Object? link = null,
    Object? user = null,
    Object? name = null,
  }) {
    return _then(_$LinkModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkModelImpl implements _LinkModel {
  _$LinkModelImpl(
      {required this.id,
      required this.created,
      required this.updated,
      required this.collectionId,
      required this.collectionName,
      required this.link,
      required this.user,
      required this.name});

  factory _$LinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkModelImplFromJson(json);

  @override
  final String id;
  @override
  final String created;
  @override
  final String updated;
  @override
  final String collectionId;
  @override
  final String collectionName;
  @override
  final String link;
  @override
  final String user;
  @override
  final String name;

  @override
  String toString() {
    return 'LinkModel(id: $id, created: $created, updated: $updated, collectionId: $collectionId, collectionName: $collectionName, link: $link, user: $user, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, created, updated,
      collectionId, collectionName, link, user, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      __$$LinkModelImplCopyWithImpl<_$LinkModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkModelImplToJson(
      this,
    );
  }
}

abstract class _LinkModel implements LinkModel {
  factory _LinkModel(
      {required final String id,
      required final String created,
      required final String updated,
      required final String collectionId,
      required final String collectionName,
      required final String link,
      required final String user,
      required final String name}) = _$LinkModelImpl;

  factory _LinkModel.fromJson(Map<String, dynamic> json) =
      _$LinkModelImpl.fromJson;

  @override
  String get id;
  @override
  String get created;
  @override
  String get updated;
  @override
  String get collectionId;
  @override
  String get collectionName;
  @override
  String get link;
  @override
  String get user;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$LinkModelImplCopyWith<_$LinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
