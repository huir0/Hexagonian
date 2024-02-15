import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/model/sl_error_exception.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.init());

  Future<RecordModel> updateUser({
    required String password,
    required String passwordConfirm,
    required String name,
    required String userId,
  }) async {
    try {
      RecordModel result = await PocketbaseAuth().updateUser(
        userId: userId,
        password: password,
        passwordConfirm: passwordConfirm,
        name: name,
      );

      return result;
    } catch (e) {
      print('update error: $e');
      rethrow;
    }
  }

  Future<RecordModel> signupForVerification({
    required String username,
    required String email,
  }) async {
    try {
      PocketbaseAuth pb = PocketbaseAuth();
      // 임시로 가입
      RecordModel result = await pb.createTempUser(
        name: username,
        email: email,
      );
      // 메일 전송
      pb.requestVerification(email: email);
      // 로그인
      RecordAuth? tempRecord = await pb.loginWithPassword(
        email: email,
        password: '1234qwer!',
      );

      if (tempRecord != null) {
        state = state.copyWith(
          authStatus: AuthStatus.authenticated,
          token: tempRecord.token,
          verified: tempRecord.record!.data['verified'],
        );
      }

      return result;
    } on SLErrorException catch (_) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      rethrow;
    }
  }

  Future<void> setUserInfoById(String tagId) async {
    PocketbaseAuth pb = PocketbaseAuth();
    var data = await pb.findUser(tagId);
    dynamic userInfo = jsonDecode(data.toString())['items'][0];
    state = state.copyWith(userInfo: userInfo);
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      String id = '';
      RecordAuth? result = await PocketbaseAuth().loginWithPassword(
        email: email,
        password: password,
      );

      if (result != null) {
        state = state.copyWith(
          authStatus: AuthStatus.authenticated,
          token: result.token,
          verified: result.record!.data['verified'],
        );

        id = result.record!.id;
        return id;
      }
      return id;
    } on SLErrorException catch (e) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      print('Error Exception in login: $e');
      rethrow;
    }
  }

  Future<RecordModel> signup({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    required String nickname,
  }) async {
    try {
      state = state.copyWith(authStatus: AuthStatus.authenticated);

      RecordModel result = await PocketbaseAuth().setUserData(
        name: name,
        email: email,
        password: password,
        nickname: nickname,
        passwordConfirm: passwordConfirm,
      );

      return result;
    } catch (e) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      rethrow;
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier();
  },
);
