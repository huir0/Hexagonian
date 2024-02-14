import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.init());

  Future<RecordModel> updateUser({
    required String nickname,
    required String password,
    required String passwordConfirm,
    required String name,
    required String userId,
  }) async {
    try {
      RecordModel result = await PocketbaseAuth().updateUser(
        userId: userId,
        nickname: nickname,
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
      RecordAuth tempRecord = await pb.loginWithPassword(
        email: email,
        password: '1234qwer!',
      );

      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        token: tempRecord.token,
        verified: tempRecord.record!.data['verified'],
      );

      print(state);

      return result;
    } catch (e) {
      print('verified error: $e');
      rethrow;
    }
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      RecordAuth result = await PocketbaseAuth().loginWithPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        token: result.token,
        verified: result.record!.data['verified'],
      );

      return result.record!.id;
    } catch (e) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
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
