import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/model/user_model.dart';
import 'package:sfaclog/viewmodel/auth/user_state.dart';

class UserInfoNotifier extends StateNotifier<UserState> {
  UserInfoNotifier() : super(UserState.init());

  // 1. users collection에서 id 등 필요한 값 가져오기
  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String nickname,
  }) async {
    try {
      state = state.copyWith(userStatus: UserStatus.fetching);

      var result = await PocketbaseAuth().setUserData(
        name: name,
        email: email,
        password: password,
        nickname: nickname,
        passwordConfirm: passwordConfirm,
      );

      String id = result.id; //@todo: id가 null로 들어오는 에러 발생. 다른 값은 제대로 잘 들어온다.
      print(id);
      UserModel user = UserModel.fromMap(result.data);

      state = state.copyWith(
        userInfo: state.userInfo!.copyWith(
          user: user,
        ), // userInfo의 user만 세팅,
        userStatus: UserStatus.success,
      );

      print('userInfo: ${state.userInfo}');
    } catch (e) {
      state = state.copyWith(userStatus: UserStatus.error);
      rethrow;
    }
  }

  // 2. 나머지 값 세팅하기
  Future<void> createUserInfo({
    String? nickname,
    required List<String> agreement,
    List<SkillModel>? skill,
    required String userModelId,
    // required UserModel userModel,
    String? picture,
    String? propose_state,
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
        // user: userModel,
      );

      UserInfo user = UserInfo.fromJson(result.toJson());

      state = state.copyWith(
        userInfo: user,
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
