import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
import 'package:sfaclog/viewmodel/auth/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.init());

  Future<void> login({
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
      );
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
