// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qna_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QnaAnswerModel _$QnaAnswerModelFromJson(Map<String, dynamic> json) {
  return _QnaAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$QnaAnswerModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  String get qna => throw _privateConstructorUsedError;
  String? get qnaTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QnaAnswerModelCopyWith<QnaAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QnaAnswerModelCopyWith<$Res> {
  factory $QnaAnswerModelCopyWith(
          QnaAnswerModel value, $Res Function(QnaAnswerModel) then) =
      _$QnaAnswerModelCopyWithImpl<$Res, QnaAnswerModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String user,
      String content,
      String collectionName,
      String qna,
      String? qnaTitle});
}

/// @nodoc
class _$QnaAnswerModelCopyWithImpl<$Res, $Val extends QnaAnswerModel>
    implements $QnaAnswerModelCopyWith<$Res> {
  _$QnaAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? user = null,
    Object? content = null,
    Object? collectionName = null,
    Object? qna = null,
    Object? qnaTitle = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      qna: null == qna
          ? _value.qna
          : qna // ignore: cast_nullable_to_non_nullable
              as String,
      qnaTitle: freezed == qnaTitle
          ? _value.qnaTitle
          : qnaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QnaAnswerModelImplCopyWith<$Res>
    implements $QnaAnswerModelCopyWith<$Res> {
  factory _$$QnaAnswerModelImplCopyWith(_$QnaAnswerModelImpl value,
          $Res Function(_$QnaAnswerModelImpl) then) =
      __$$QnaAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String user,
      String content,
      String collectionName,
      String qna,
      String? qnaTitle});
}

/// @nodoc
class __$$QnaAnswerModelImplCopyWithImpl<$Res>
    extends _$QnaAnswerModelCopyWithImpl<$Res, _$QnaAnswerModelImpl>
    implements _$$QnaAnswerModelImplCopyWith<$Res> {
  __$$QnaAnswerModelImplCopyWithImpl(
      _$QnaAnswerModelImpl _value, $Res Function(_$QnaAnswerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? user = null,
    Object? content = null,
    Object? collectionName = null,
    Object? qna = null,
    Object? qnaTitle = freezed,
  }) {
    return _then(_$QnaAnswerModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      qna: null == qna
          ? _value.qna
          : qna // ignore: cast_nullable_to_non_nullable
              as String,
      qnaTitle: freezed == qnaTitle
          ? _value.qnaTitle
          : qnaTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QnaAnswerModelImpl implements _QnaAnswerModel {
  const _$QnaAnswerModelImpl(
      {required this.id,
      required this.title,
      required this.user,
      required this.content,
      required this.collectionName,
      required this.qna,
      this.qnaTitle});

  factory _$QnaAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QnaAnswerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String user;
  @override
  final String content;
  @override
  final String collectionName;
  @override
  final String qna;
  @override
  final String? qnaTitle;

  @override
  String toString() {
    return 'QnaAnswerModel(id: $id, title: $title, user: $user, content: $content, collectionName: $collectionName, qna: $qna, qnaTitle: $qnaTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QnaAnswerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            (identical(other.qna, qna) || other.qna == qna) &&
            (identical(other.qnaTitle, qnaTitle) ||
                other.qnaTitle == qnaTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, user, content, collectionName, qna, qnaTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QnaAnswerModelImplCopyWith<_$QnaAnswerModelImpl> get copyWith =>
      __$$QnaAnswerModelImplCopyWithImpl<_$QnaAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QnaAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _QnaAnswerModel implements QnaAnswerModel {
  const factory _QnaAnswerModel(
      {required final String id,
      required final String title,
      required final String user,
      required final String content,
      required final String collectionName,
      required final String qna,
      final String? qnaTitle}) = _$QnaAnswerModelImpl;

  factory _QnaAnswerModel.fromJson(Map<String, dynamic> json) =
      _$QnaAnswerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get user;
  @override
  String get content;
  @override
  String get collectionName;
  @override
  String get qna;
  @override
  String? get qnaTitle;
  @override
  @JsonKey(ignore: true)
  _$$QnaAnswerModelImplCopyWith<_$QnaAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
