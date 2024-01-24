import 'package:equatable/equatable.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

enum SNSAuthStatus {
  init,
  success,
  error,
}

class KakaoAuthState extends Equatable {
  final SNSAuthStatus authStatus;
  final User? userInfo;
  const KakaoAuthState({
    this.userInfo,
    required this.authStatus,
  });

  factory KakaoAuthState.init({
    User? userInfo,
    SNSAuthStatus? authStatus,
  }) {
    return KakaoAuthState(
      authStatus: SNSAuthStatus.init,
      userInfo: userInfo,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  KakaoAuthState copyWith({
    SNSAuthStatus? authStatus,
    User? userInfo,
  }) {
    return KakaoAuthState(
      authStatus: authStatus ?? this.authStatus,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}
