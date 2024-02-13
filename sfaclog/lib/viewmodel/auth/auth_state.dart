import 'package:equatable/equatable.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String? token;
  final bool verified;

  const AuthState({
    required this.authStatus,
    required this.token,
    required this.verified,
  });

  factory AuthState.init({
    AuthStatus? authStatus,
    String? token,
    bool? verified,
  }) {
    return const AuthState(
      authStatus: AuthStatus.unauthenticated,
      token: null,
      verified: false,
    );
  }

  AuthState copyWith({
    AuthStatus? authStatus,
    String? token,
    bool? verified,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      token: token ?? this.token,
      verified: verified ?? this.verified,
    );
  }

  @override
  List<Object> get props => [authStatus, token ?? '', verified];
}
