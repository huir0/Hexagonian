// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  String? get id => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get proposeState => throw _privateConstructorUsedError;
  List<String>? get agreementState => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  List<SkillModel>? get skill => throw _privateConstructorUsedError;
  UserModel? get profile => throw _privateConstructorUsedError;
  String? get introduction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {String? id,
      String? nickname,
      String? proposeState,
      List<String>? agreementState,
      String? picture,
      List<SkillModel>? skill,
      UserModel? profile,
      String? introduction});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nickname = freezed,
    Object? proposeState = freezed,
    Object? agreementState = freezed,
    Object? picture = freezed,
    Object? skill = freezed,
    Object? profile = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      proposeState: freezed == proposeState
          ? _value.proposeState
          : proposeState // ignore: cast_nullable_to_non_nullable
              as String?,
      agreementState: freezed == agreementState
          ? _value.agreementState
          : agreementState // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as List<SkillModel>?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? nickname,
      String? proposeState,
      List<String>? agreementState,
      String? picture,
      List<SkillModel>? skill,
      UserModel? profile,
      String? introduction});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nickname = freezed,
    Object? proposeState = freezed,
    Object? agreementState = freezed,
    Object? picture = freezed,
    Object? skill = freezed,
    Object? profile = freezed,
    Object? introduction = freezed,
  }) {
    return _then(_$UserInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      proposeState: freezed == proposeState
          ? _value.proposeState
          : proposeState // ignore: cast_nullable_to_non_nullable
              as String?,
      agreementState: freezed == agreementState
          ? _value._agreementState
          : agreementState // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      skill: freezed == skill
          ? _value._skill
          : skill // ignore: cast_nullable_to_non_nullable
              as List<SkillModel>?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      introduction: freezed == introduction
          ? _value.introduction
          : introduction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl with DiagnosticableTreeMixin implements _UserInfo {
  const _$UserInfoImpl(
      {this.id,
      this.nickname,
      this.proposeState,
      final List<String>? agreementState,
      this.picture,
      final List<SkillModel>? skill,
      this.profile,
      this.introduction})
      : _agreementState = agreementState,
        _skill = skill;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final String? id;
  @override
  final String? nickname;
  @override
  final String? proposeState;
  final List<String>? _agreementState;
  @override
  List<String>? get agreementState {
    final value = _agreementState;
    if (value == null) return null;
    if (_agreementState is EqualUnmodifiableListView) return _agreementState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? picture;
  final List<SkillModel>? _skill;
  @override
  List<SkillModel>? get skill {
    final value = _skill;
    if (value == null) return null;
    if (_skill is EqualUnmodifiableListView) return _skill;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel? profile;
  @override
  final String? introduction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfo(id: $id, nickname: $nickname, proposeState: $proposeState, agreementState: $agreementState, picture: $picture, skill: $skill, profile: $profile, introduction: $introduction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('proposeState', proposeState))
      ..add(DiagnosticsProperty('agreementState', agreementState))
      ..add(DiagnosticsProperty('picture', picture))
      ..add(DiagnosticsProperty('skill', skill))
      ..add(DiagnosticsProperty('profile', profile))
      ..add(DiagnosticsProperty('introduction', introduction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.proposeState, proposeState) ||
                other.proposeState == proposeState) &&
            const DeepCollectionEquality()
                .equals(other._agreementState, _agreementState) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            const DeepCollectionEquality().equals(other._skill, _skill) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.introduction, introduction) ||
                other.introduction == introduction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      proposeState,
      const DeepCollectionEquality().hash(_agreementState),
      picture,
      const DeepCollectionEquality().hash(_skill),
      profile,
      introduction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {final String? id,
      final String? nickname,
      final String? proposeState,
      final List<String>? agreementState,
      final String? picture,
      final List<SkillModel>? skill,
      final UserModel? profile,
      final String? introduction}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  String? get id;
  @override
  String? get nickname;
  @override
  String? get proposeState;
  @override
  List<String>? get agreementState;
  @override
  String? get picture;
  @override
  List<SkillModel>? get skill;
  @override
  UserModel? get profile;
  @override
  String? get introduction;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
