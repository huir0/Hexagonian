import 'package:equatable/equatable.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String? token;
  final bool verified;
  final dynamic userInfo;
  const AuthState({
    required this.authStatus,
    required this.token,
    required this.verified,
    this.userInfo,
  });

  factory AuthState.init({
    AuthStatus? authStatus,
    String? token,
    bool? verified,
    dynamic userInfo,
  }) {
    return const AuthState(
        authStatus: AuthStatus.unauthenticated,
        token: null,
        verified: false,
        userInfo: null);
  }

  AuthState copyWith(
      {AuthStatus? authStatus,
      String? token,
      bool? verified,
      dynamic userInfo}) {
    return AuthState(
        authStatus: authStatus ?? this.authStatus,
        token: token ?? this.token,
        verified: verified ?? this.verified,
        userInfo: userInfo ?? this.userInfo);
  }

  @override
  List<Object> get props => [authStatus, token ?? '', verified, userInfo];
}
