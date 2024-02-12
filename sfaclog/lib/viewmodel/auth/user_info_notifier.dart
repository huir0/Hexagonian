
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/model/user_model.dart';
import 'package:sfaclog/viewmodel/auth/user_state.dart';

class UserInfoNotifier extends StateNotifier<UserState> {
  UserInfoNotifier() : super(UserState.init());

  // 1. users collection에서 id 등 필요한 값 가져오기
  Future<void> setBasicUserInfo(RecordModel res) async {
    try {
      state = state.copyWith(userStatus: UserStatus.fetching);

      UserModel user = UserModel.fromMap({
        ...res.toJson(),
        // 'id': res.id,
      });

      state = state.copyWith(
        userInfo: state.userInfo!.copyWith(
          user: user,
        ), // userInfo의 user만 세팅,
        userStatus: UserStatus.success,
      );
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error);
      rethrow;
    }
  }

  // 2. 나머지 값 서버에 세팅
  Future<RecordModel> createUserInfo({
    required String nickname,
    required List<String> agreement,
    required List<String> skill,
    required String userModelId,
    String? picture,
    required String propose_state,
  }) async {
    try {
      state = state.copyWith(userStatus: UserStatus.fetching);

      var result = await PocketbaseAuth().createUserInfo(
        agreement: agreement,
        nickname: nickname,
        picture: picture,
        skill: skill,
        propose_state: propose_state,
        user: userModelId,
      );

      return result;
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error);
      rethrow;
    }
  }

  Future<void> setUserInfo(
    RecordModel userInfo, {
    required List<SkillModel> skills,
    required UserModel user,
  }) async {
    try {
      state = state.copyWith(userStatus: UserStatus.setting);

      UserInfo newUserInfo = UserInfo.fromJson({
        ...userInfo.data,
        'id': userInfo.id,
        'skill': skills.map((skill) => skill.toJson()).toList(),
        'user': user.toJson(),
      });

      state = state.copyWith(
        userInfo: newUserInfo,
        userStatus: UserStatus.success,
      );
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error);
      rethrow;
    }
  }
}

final userInfoProvider = StateNotifierProvider<UserInfoNotifier, UserState>(
  (ref) {
    return UserInfoNotifier();
  },
);
