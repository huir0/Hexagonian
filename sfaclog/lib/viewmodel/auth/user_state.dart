import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/user_info.dart';

enum UserStatus {
  init,
  fetching,
  success,
  error,
}

class UserState extends Equatable {
  final UserInfo? userInfo;
  final UserStatus userStatus;
  const UserState({
    required this.userInfo,
    required this.userStatus,
  });

  factory UserState.init({
    UserInfo? userInfo,
    UserStatus? userStatus,
  }) {
    return const UserState(
      userInfo: UserInfo(),
      userStatus: UserStatus.init,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  UserState copyWith({
    UserInfo? userInfo,
    UserStatus? userStatus,
  }) {
    return UserState(
      userInfo: userInfo ?? this.userInfo,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}
