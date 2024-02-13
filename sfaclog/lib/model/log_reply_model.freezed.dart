// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LogReplyModel _$LogReplyModelFromJson(Map<String, dynamic> json) {
  return _LogReplyModel.fromJson(json);
}

/// @nodoc
mixin _$LogReplyModel {
  String? get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get log => throw _privateConstructorUsedError;
  String get parentReplyId => throw _privateConstructorUsedError;
  int get like => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  List<LogReplyModel>? get nestedReplies => throw _privateConstructorUsedError;
  String? get created => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogReplyModelCopyWith<LogReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogReplyModelCopyWith<$Res> {
  factory $LogReplyModelCopyWith(
          LogReplyModel value, $Res Function(LogReplyModel) then) =
      _$LogReplyModelCopyWithImpl<$Res, LogReplyModel>;
  @useResult
  $Res call(
      {String? id,
      String content,
      String log,
      String parentReplyId,
      int like,
      String user,
      List<LogReplyModel>? nestedReplies,
      String? created});
}

/// @nodoc
class _$LogReplyModelCopyWithImpl<$Res, $Val extends LogReplyModel>
    implements $LogReplyModelCopyWith<$Res> {
  _$LogReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? log = null,
    Object? parentReplyId = null,
    Object? like = null,
    Object? user = null,
    Object? nestedReplies = freezed,
    Object? created = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      parentReplyId: null == parentReplyId
          ? _value.parentReplyId
          : parentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      nestedReplies: freezed == nestedReplies
          ? _value.nestedReplies
          : nestedReplies // ignore: cast_nullable_to_non_nullable
              as List<LogReplyModel>?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogReplyModelImplCopyWith<$Res>
    implements $LogReplyModelCopyWith<$Res> {
  factory _$$LogReplyModelImplCopyWith(
          _$LogReplyModelImpl value, $Res Function(_$LogReplyModelImpl) then) =
      __$$LogReplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String content,
      String log,
      String parentReplyId,
      int like,
      String user,
      List<LogReplyModel>? nestedReplies,
      String? created});
}

/// @nodoc
class __$$LogReplyModelImplCopyWithImpl<$Res>
    extends _$LogReplyModelCopyWithImpl<$Res, _$LogReplyModelImpl>
    implements _$$LogReplyModelImplCopyWith<$Res> {
  __$$LogReplyModelImplCopyWithImpl(
      _$LogReplyModelImpl _value, $Res Function(_$LogReplyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? log = null,
    Object? parentReplyId = null,
    Object? like = null,
    Object? user = null,
    Object? nestedReplies = freezed,
    Object? created = freezed,
  }) {
    return _then(_$LogReplyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      log: null == log
          ? _value.log
          : log // ignore: cast_nullable_to_non_nullable
              as String,
      parentReplyId: null == parentReplyId
          ? _value.parentReplyId
          : parentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      nestedReplies: freezed == nestedReplies
          ? _value._nestedReplies
          : nestedReplies // ignore: cast_nullable_to_non_nullable
              as List<LogReplyModel>?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogReplyModelImpl implements _LogReplyModel {
  _$LogReplyModelImpl(
      {this.id,
      required this.content,
      required this.log,
      required this.parentReplyId,
      required this.like,
      required this.user,
      final List<LogReplyModel>? nestedReplies,
      this.created})
      : _nestedReplies = nestedReplies;

  factory _$LogReplyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogReplyModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String content;
  @override
  final String log;
  @override
  final String parentReplyId;
  @override
  final int like;
  @override
  final String user;
  final List<LogReplyModel>? _nestedReplies;
  @override
  List<LogReplyModel>? get nestedReplies {
    final value = _nestedReplies;
    if (value == null) return null;
    if (_nestedReplies is EqualUnmodifiableListView) return _nestedReplies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? created;

  @override
  String toString() {
    return 'LogReplyModel(id: $id, content: $content, log: $log, parentReplyId: $parentReplyId, like: $like, user: $user, nestedReplies: $nestedReplies, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogReplyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.log, log) || other.log == log) &&
            (identical(other.parentReplyId, parentReplyId) ||
                other.parentReplyId == parentReplyId) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._nestedReplies, _nestedReplies) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, log, parentReplyId,
      like, user, const DeepCollectionEquality().hash(_nestedReplies), created);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogReplyModelImplCopyWith<_$LogReplyModelImpl> get copyWith =>
      __$$LogReplyModelImplCopyWithImpl<_$LogReplyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogReplyModelImplToJson(
      this,
    );
  }
}

abstract class _LogReplyModel implements LogReplyModel {
  factory _LogReplyModel(
      {final String? id,
      required final String content,
      required final String log,
      required final String parentReplyId,
      required final int like,
      required final String user,
      final List<LogReplyModel>? nestedReplies,
      final String? created}) = _$LogReplyModelImpl;

  factory _LogReplyModel.fromJson(Map<String, dynamic> json) =
      _$LogReplyModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get content;
  @override
  String get log;
  @override
  String get parentReplyId;
  @override
  int get like;
  @override
  String get user;
  @override
  List<LogReplyModel>? get nestedReplies;
  @override
  String? get created;
  @override
  @JsonKey(ignore: true)
  _$$LogReplyModelImplCopyWith<_$LogReplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
