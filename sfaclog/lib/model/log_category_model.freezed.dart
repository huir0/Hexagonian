// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogCategoryModel _$LogCategoryModelFromJson(Map<String, dynamic> json) {
  return _LogCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$LogCategoryModel {
  String get name => throw _privateConstructorUsedError;
  String get log => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String get public => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogCategoryModelCopyWith<LogCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogCategoryModelCopyWith<$Res> {
  factory $LogCategoryModelCopyWith(
          LogCategoryModel value, $Res Function(LogCategoryModel) then) =
      _$LogCategoryModelCopyWithImpl<$Res, LogCategoryModel>;
  @useResult
  $Res call(
      {String name, String log, String? user, String public, String? created});
}

/// @nodoc
class _$LogCategoryModelCopyWithImpl<$Res, $Val extends LogCategoryModel>
    implements $LogCategoryModelCopyWith<$Res> {
  _$LogCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? log = null,
    Object? user = freezed,
    Object? public = null,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogCategoryModelImplCopyWith<$Res>
    implements $LogCategoryModelCopyWith<$Res> {
  factory _$$LogCategoryModelImplCopyWith(_$LogCategoryModelImpl value,
          $Res Function(_$LogCategoryModelImpl) then) =
      __$$LogCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String log, String? user, String public, String? created});
}

/// @nodoc
class __$$LogCategoryModelImplCopyWithImpl<$Res>
    extends _$LogCategoryModelCopyWithImpl<$Res, _$LogCategoryModelImpl>
    implements _$$LogCategoryModelImplCopyWith<$Res> {
  __$$LogCategoryModelImplCopyWithImpl(_$LogCategoryModelImpl _value,
      $Res Function(_$LogCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? log = null,
    Object? user = freezed,
    Object? public = null,
    Object? created = freezed,
  }) {
    return _then(_$LogCategoryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as String,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogCategoryModelImpl implements _LogCategoryModel {
  _$LogCategoryModelImpl(
      {required this.name,
      required this.log,
      required this.user,
      required this.public,
      this.created});

  factory _$LogCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogCategoryModelImplFromJson(json);

  @override
  final String name;
  @override
  final String log;
  @override
  final String? user;
  @override
  final String public;
  @override
  final String? created;

  @override
  String toString() {
    return 'LogCategoryModel(name: $name, log: $log, user: $user, public: $public, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogCategoryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.log, log) || other.log == log) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, log, user, public, created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogCategoryModelImplCopyWith<_$LogCategoryModelImpl> get copyWith =>
      __$$LogCategoryModelImplCopyWithImpl<_$LogCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _LogCategoryModel implements LogCategoryModel {
  factory _LogCategoryModel(
      {required final String name,
      required final String log,
      required final String? user,
      required final String public,
      final String? created}) = _$LogCategoryModelImpl;

  factory _LogCategoryModel.fromJson(Map<String, dynamic> json) =
      _$LogCategoryModelImpl.fromJson;

  @override
  String get name;
  @override
  String get log;
  @override
  String? get user;
  @override
  String get public;
  @override
  String? get created;
  @override
  @JsonKey(ignore: true)
  _$$LogCategoryModelImplCopyWith<_$LogCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
