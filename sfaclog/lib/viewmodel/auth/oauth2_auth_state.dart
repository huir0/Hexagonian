import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

enum OAuth2Status {
  init,
  success,
  error,
}

class OAuth2State extends Equatable {
  final OAuth2Status authStatus;
  final RecordAuth? recordAuth;
  const OAuth2State({
    required this.recordAuth,
    required this.authStatus,
  });

  factory OAuth2State.init({
    RecordAuth? recordAuth,
    OAuth2Status? authStatus,
  }) {
    return const OAuth2State(
      authStatus: OAuth2Status.init,
      recordAuth: null,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  OAuth2State copyWith({
    OAuth2Status? authStatus,
    RecordAuth? recordAuth,
  }) {
    return OAuth2State(
      authStatus: authStatus ?? this.authStatus,
      recordAuth: recordAuth ?? this.recordAuth,
    );
  }
}
