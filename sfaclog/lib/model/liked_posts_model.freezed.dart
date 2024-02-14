// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedPostModel {
  String get user => throw _privateConstructorUsedError;
  List<dynamic>? get logs => throw _privateConstructorUsedError;
  List<dynamic>? get qnas => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedPostModelCopyWith<LikedPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedPostModelCopyWith<$Res> {
  factory $LikedPostModelCopyWith(
          LikedPostModel value, $Res Function(LikedPostModel) then) =
      _$LikedPostModelCopyWithImpl<$Res, LikedPostModel>;
  @useResult
  $Res call({String user, List<dynamic>? logs, List<dynamic>? qnas});
}

/// @nodoc
class _$LikedPostModelCopyWithImpl<$Res, $Val extends LikedPostModel>
    implements $LikedPostModelCopyWith<$Res> {
  _$LikedPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? logs = freezed,
    Object? qnas = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      logs: freezed == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      qnas: freezed == qnas
          ? _value.qnas
          : qnas // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikedPostModelImplCopyWith<$Res>
    implements $LikedPostModelCopyWith<$Res> {
  factory _$$LikedPostModelImplCopyWith(_$LikedPostModelImpl value,
          $Res Function(_$LikedPostModelImpl) then) =
      __$$LikedPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String user, List<dynamic>? logs, List<dynamic>? qnas});
}

/// @nodoc
class __$$LikedPostModelImplCopyWithImpl<$Res>
    extends _$LikedPostModelCopyWithImpl<$Res, _$LikedPostModelImpl>
    implements _$$LikedPostModelImplCopyWith<$Res> {
  __$$LikedPostModelImplCopyWithImpl(
      _$LikedPostModelImpl _value, $Res Function(_$LikedPostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? logs = freezed,
    Object? qnas = freezed,
  }) {
    return _then(_$LikedPostModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      logs: freezed == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      qnas: freezed == qnas
          ? _value._qnas
          : qnas // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

class _$LikedPostModelImpl implements _LikedPostModel {
  const _$LikedPostModelImpl(
      {required this.user,
      final List<dynamic>? logs,
      final List<dynamic>? qnas})
      : _logs = logs,
        _qnas = qnas;

  @override
  final String user;
  final List<dynamic>? _logs;
  @override
  List<dynamic>? get logs {
    final value = _logs;
    if (value == null) return null;
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _qnas;
  @override
  List<dynamic>? get qnas {
    final value = _qnas;
    if (value == null) return null;
    if (_qnas is EqualUnmodifiableListView) return _qnas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LikedPostModel(user: $user, logs: $logs, qnas: $qnas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikedPostModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._logs, _logs) &&
            const DeepCollectionEquality().equals(other._qnas, _qnas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_logs),
      const DeepCollectionEquality().hash(_qnas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikedPostModelImplCopyWith<_$LikedPostModelImpl> get copyWith =>
      __$$LikedPostModelImplCopyWithImpl<_$LikedPostModelImpl>(
          this, _$identity);
}

abstract class _LikedPostModel implements LikedPostModel {
  const factory _LikedPostModel(
      {required final String user,
      final List<dynamic>? logs,
      final List<dynamic>? qnas}) = _$LikedPostModelImpl;

  @override
  String get user;
  @override
  List<dynamic>? get logs;
  @override
  List<dynamic>? get qnas;
  @override
  @JsonKey(ignore: true)
  _$$LikedPostModelImplCopyWith<_$LikedPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
