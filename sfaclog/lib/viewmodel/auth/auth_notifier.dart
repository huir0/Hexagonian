import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/model/sl_error_exception.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier()
      : _pocketbaseAuth = PocketbaseAuth(),
        super(AuthState.init());

  final PocketbaseAuth _pocketbaseAuth;

  Future<RecordModel> updateUser({
    required String password,
    required String passwordConfirm,
    required String name,
    required String userId,
  }) async {
    try {
      RecordModel result = await _pocketbaseAuth.updateUser(
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

  Future<bool> subscribeVerifiedEmail() async {
    try {
      bool result = await _pocketbaseAuth.subscribeVerifiedEmail();
      state = state.copyWith(verified: result);

      return result;
    } on SLErrorException catch (_) {
      state = state.copyWith(verified: false);
      print('error');
      rethrow;
    }
  }

  Future<RecordModel> signupForVerification({
    required String username,
    required String email,
  }) async {
    try {
      // 임시로 가입
      RecordModel result = await _pocketbaseAuth.createTempUser(
        name: username,
        email: email,
      );
      // 메일 전송
      _pocketbaseAuth.requestVerification(email: email);
      // 로그인
      RecordAuth? tempRecord = await _pocketbaseAuth.loginWithPassword(
        email: email,
        password: '1234qwer!',
      );

      if (tempRecord != null) {
        state = state.copyWith(
          authStatus: AuthStatus.authenticated,
          token: tempRecord.token,
          verified: tempRecord.record!.data['verified'],
        );
        print('temp verity: ${tempRecord.record!.data['verified']}');
      }

      return result;
    } on SLErrorException catch (_) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      print('error');
      rethrow;
    }
  }

  Future<void> setUserInfoById(String tagId) async {
    var data = await _pocketbaseAuth.findUser(tagId);
    dynamic userInfo = jsonDecode(data.toString())['items'][0];
    state = state.copyWith(userInfo: userInfo);
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      String id = '';
      RecordAuth? result = await _pocketbaseAuth.loginWithPassword(
        email: email,
        password: password,
      );

      if (result != null) {
        state = state.copyWith(
          authStatus: AuthStatus.authenticated,
          token: result.token,
          verified: result.record!.data['verified'],
        );

        print('login verify: ${result.record!.data['verified']}'); //true

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

      RecordModel result = await _pocketbaseAuth.setUserData(
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
