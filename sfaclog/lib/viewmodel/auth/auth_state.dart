import 'package:equatable/equatable.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String? token;

  const AuthState({
    required this.authStatus,
    required this.token,
  });

  factory AuthState.init({
    AuthStatus? authStatus,
    String? token,
  }) {
    return const AuthState(
      authStatus: AuthStatus.unauthenticated,
      token: null,
    );
  }

  AuthState copyWith({
    AuthStatus? authStatus,
    String? token,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      token: token ?? this.token,
    );
  }

  @override
  List<Object> get props => [authStatus, token ?? ''];
}
