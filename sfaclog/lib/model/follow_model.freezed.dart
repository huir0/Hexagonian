// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowModel _$FollowModelFromJson(Map<String, dynamic> json) {
  return _FollowModel.fromJson(json);
}

/// @nodoc
mixin _$FollowModel {
  String get id => throw _privateConstructorUsedError;
  String get collectionId => throw _privateConstructorUsedError;
  String get collectionName => throw _privateConstructorUsedError;
  Map<String, dynamic> get expand => throw _privateConstructorUsedError;
  String get follower => throw _privateConstructorUsedError;
  String get following => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowModelCopyWith<FollowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowModelCopyWith<$Res> {
  factory $FollowModelCopyWith(
          FollowModel value, $Res Function(FollowModel) then) =
      _$FollowModelCopyWithImpl<$Res, FollowModel>;
  @useResult
  $Res call(
      {String id,
      String collectionId,
      String collectionName,
      Map<String, dynamic> expand,
      String follower,
      String following});
}

/// @nodoc
class _$FollowModelCopyWithImpl<$Res, $Val extends FollowModel>
    implements $FollowModelCopyWith<$Res> {
  _$FollowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? collectionName = null,
    Object? expand = null,
    Object? follower = null,
    Object? following = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      expand: null == expand
          ? _value.expand
          : expand // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as String,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowModelImplCopyWith<$Res>
    implements $FollowModelCopyWith<$Res> {
  factory _$$FollowModelImplCopyWith(
          _$FollowModelImpl value, $Res Function(_$FollowModelImpl) then) =
      __$$FollowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String collectionId,
      String collectionName,
      Map<String, dynamic> expand,
      String follower,
      String following});
}

/// @nodoc
class __$$FollowModelImplCopyWithImpl<$Res>
    extends _$FollowModelCopyWithImpl<$Res, _$FollowModelImpl>
    implements _$$FollowModelImplCopyWith<$Res> {
  __$$FollowModelImplCopyWithImpl(
      _$FollowModelImpl _value, $Res Function(_$FollowModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? collectionId = null,
    Object? collectionName = null,
    Object? expand = null,
    Object? follower = null,
    Object? following = null,
  }) {
    return _then(_$FollowModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      collectionId: null == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as String,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
      expand: null == expand
          ? _value._expand
          : expand // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      follower: null == follower
          ? _value.follower
          : follower // ignore: cast_nullable_to_non_nullable
              as String,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowModelImpl implements _FollowModel {
  const _$FollowModelImpl(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required final Map<String, dynamic> expand,
      required this.follower,
      required this.following})
      : _expand = expand;

  factory _$FollowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowModelImplFromJson(json);

  @override
  final String id;
  @override
  final String collectionId;
  @override
  final String collectionName;
  final Map<String, dynamic> _expand;
  @override
  Map<String, dynamic> get expand {
    if (_expand is EqualUnmodifiableMapView) return _expand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_expand);
  }

  @override
  final String follower;
  @override
  final String following;

  @override
  String toString() {
    return 'FollowModel(id: $id, collectionId: $collectionId, collectionName: $collectionName, expand: $expand, follower: $follower, following: $following)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName) &&
            const DeepCollectionEquality().equals(other._expand, _expand) &&
            (identical(other.follower, follower) ||
                other.follower == follower) &&
            (identical(other.following, following) ||
                other.following == following));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, collectionId, collectionName,
      const DeepCollectionEquality().hash(_expand), follower, following);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowModelImplCopyWith<_$FollowModelImpl> get copyWith =>
      __$$FollowModelImplCopyWithImpl<_$FollowModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowModelImplToJson(
      this,
    );
  }
}

abstract class _FollowModel implements FollowModel {
  const factory _FollowModel(
      {required final String id,
      required final String collectionId,
      required final String collectionName,
      required final Map<String, dynamic> expand,
      required final String follower,
      required final String following}) = _$FollowModelImpl;

  factory _FollowModel.fromJson(Map<String, dynamic> json) =
      _$FollowModelImpl.fromJson;

  @override
  String get id;
  @override
  String get collectionId;
  @override
  String get collectionName;
  @override
  Map<String, dynamic> get expand;
  @override
  String get follower;
  @override
  String get following;
  @override
  @JsonKey(ignore: true)
  _$$FollowModelImplCopyWith<_$FollowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
