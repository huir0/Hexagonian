// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return _UsersModel.fromJson(json);
}

/// @nodoc
mixin _$UsersModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersModelCopyWith<UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) then) =
      _$UsersModelCopyWithImpl<$Res, UsersModel>;
  @useResult
  $Res call({String id, String email, String name});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res, $Val extends UsersModel>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersModelImplCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$$UsersModelImplCopyWith(
          _$UsersModelImpl value, $Res Function(_$UsersModelImpl) then) =
      __$$UsersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String email, String name});
}

/// @nodoc
class __$$UsersModelImplCopyWithImpl<$Res>
    extends _$UsersModelCopyWithImpl<$Res, _$UsersModelImpl>
    implements _$$UsersModelImplCopyWith<$Res> {
  __$$UsersModelImplCopyWithImpl(
      _$UsersModelImpl _value, $Res Function(_$UsersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
  }) {
    return _then(_$UsersModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$UsersModelImpl implements _UsersModel {
  const _$UsersModelImpl(
      {required this.id, required this.email, required this.name});

  factory _$UsersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;

  @override
  String toString() {
    return 'UsersModel(id: $id, email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      __$$UsersModelImplCopyWithImpl<_$UsersModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersModelImplToJson(
      this,
    );
  }
}

abstract class _UsersModel implements UsersModel {
  const factory _UsersModel(
      {required final String id,
      required final String email,
      required final String name}) = _$UsersModelImpl;

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$UsersModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UsersModelImplCopyWith<_$UsersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
