import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/model/user_model.dart';
import 'package:sfaclog/util/join_sections.dart';

enum OnboardingStatus {
  init,
  section1,
  section2,
  section3,
  section4,
  section5,
  success,
  error,
}

class OnboardingState extends Equatable {
  final OnboardingStatus? onboardingStatus;
  final UserInfo? userInfo;
  final int currentPage;
  final int totalPage;
  final bool isButtonEnabled;
  final String password;
  final String passwordConfirm;
  final List<String>? agreementState;

  const OnboardingState({
    required this.onboardingStatus,
    required this.userInfo,
    required this.currentPage,
    required this.totalPage,
    required this.isButtonEnabled,
    required this.password,
    required this.passwordConfirm,
    this.agreementState,
  });

  factory OnboardingState.init({
    OnboardingStatus? onboardingStatus,
    int? currentPage,
    int? totalPage,
    bool? isButtonEnabled,
  }) {
    return OnboardingState(
        onboardingStatus: OnboardingStatus.init,
        isButtonEnabled: false,
        currentPage: 0,
        totalPage: joinSections.length,
        password: '',
        passwordConfirm: '',
        userInfo: const UserInfo(
          user: UserModel(
            name: '',
            email: '',
          ),
          nickname: '',
          picture: '',
          skill: [],
          proposeState: 'no_offer',
          agreementState: [],
        ));
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  OnboardingState copyWith({
    OnboardingStatus? onboardingStatus,
    UserInfo? userInfo,
    bool? isButtonEnabled,
    int? currentPage,
    int? totalPage,
    String? password,
    String? passwordConfirm,
    List<String>? agreementState,
  }) {
    return OnboardingState(
      onboardingStatus: onboardingStatus ?? this.onboardingStatus,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      userInfo: userInfo ?? this.userInfo,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      agreementState: agreementState ?? this.agreementState,
    );
  }
}
