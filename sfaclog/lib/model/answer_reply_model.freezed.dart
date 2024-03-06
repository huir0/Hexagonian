// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnswerReplyModel _$AnswerReplyModelFromJson(Map<String, dynamic> json) {
  return _AnswerReplyModel.fromJson(json);
}

/// @nodoc
mixin _$AnswerReplyModel {
  String? get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get answerId => throw _privateConstructorUsedError;
  int get like => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get created => throw _privateConstructorUsedError;
  String get updated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerReplyModelCopyWith<AnswerReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerReplyModelCopyWith<$Res> {
  factory $AnswerReplyModelCopyWith(
          AnswerReplyModel value, $Res Function(AnswerReplyModel) then) =
      _$AnswerReplyModelCopyWithImpl<$Res, AnswerReplyModel>;
  @useResult
  $Res call(
      {String? id,
      String content,
      String answerId,
      int like,
      String author,
      String created,
      String updated});
}

/// @nodoc
class _$AnswerReplyModelCopyWithImpl<$Res, $Val extends AnswerReplyModel>
    implements $AnswerReplyModelCopyWith<$Res> {
  _$AnswerReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? answerId = null,
    Object? like = null,
    Object? author = null,
    Object? created = null,
    Object? updated = null,
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
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerReplyModelImplCopyWith<$Res>
    implements $AnswerReplyModelCopyWith<$Res> {
  factory _$$AnswerReplyModelImplCopyWith(_$AnswerReplyModelImpl value,
          $Res Function(_$AnswerReplyModelImpl) then) =
      __$$AnswerReplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String content,
      String answerId,
      int like,
      String author,
      String created,
      String updated});
}

/// @nodoc
class __$$AnswerReplyModelImplCopyWithImpl<$Res>
    extends _$AnswerReplyModelCopyWithImpl<$Res, _$AnswerReplyModelImpl>
    implements _$$AnswerReplyModelImplCopyWith<$Res> {
  __$$AnswerReplyModelImplCopyWithImpl(_$AnswerReplyModelImpl _value,
      $Res Function(_$AnswerReplyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? content = null,
    Object? answerId = null,
    Object? like = null,
    Object? author = null,
    Object? created = null,
    Object? updated = null,
  }) {
    return _then(_$AnswerReplyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerReplyModelImpl implements _AnswerReplyModel {
  _$AnswerReplyModelImpl(
      {this.id,
      required this.content,
      required this.answerId,
      required this.like,
      required this.author,
      required this.created,
      required this.updated});

  factory _$AnswerReplyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerReplyModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String content;
  @override
  final String answerId;
  @override
  final int like;
  @override
  final String author;
  @override
  final String created;
  @override
  final String updated;

  @override
  String toString() {
    return 'AnswerReplyModel(id: $id, content: $content, answerId: $answerId, like: $like, author: $author, created: $created, updated: $updated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerReplyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, answerId, like, author, created, updated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerReplyModelImplCopyWith<_$AnswerReplyModelImpl> get copyWith =>
      __$$AnswerReplyModelImplCopyWithImpl<_$AnswerReplyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerReplyModelImplToJson(
      this,
    );
  }
}

abstract class _AnswerReplyModel implements AnswerReplyModel {
  factory _AnswerReplyModel(
      {final String? id,
      required final String content,
      required final String answerId,
      required final int like,
      required final String author,
      required final String created,
      required final String updated}) = _$AnswerReplyModelImpl;

  factory _AnswerReplyModel.fromJson(Map<String, dynamic> json) =
      _$AnswerReplyModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get content;
  @override
  String get answerId;
  @override
  int get like;
  @override
  String get author;
  @override
  String get created;
  @override
  String get updated;
  @override
  @JsonKey(ignore: true)
  _$$AnswerReplyModelImplCopyWith<_$AnswerReplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
