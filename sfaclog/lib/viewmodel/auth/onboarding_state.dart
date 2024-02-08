import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/model/user_model.dart';
import 'package:sfaclog/util/join_sections.dart';
import 'package:sfaclog/util/onboarding_sections.dart';

enum OnboardingStatus {
  section1, // name + email
  section2, // pw + terms
  section3, // profile + nickname
  section4, // skill
  section5, // propose
  init,
  success,
  error,
}

extension OnboardingStatusExtension on OnboardingStatus {
  int get index {
    switch (this) {
      case OnboardingStatus.section1:
        return 0;
      case OnboardingStatus.section2:
        return 1;
      case OnboardingStatus.section3:
        return 2;
      case OnboardingStatus.section4:
        return 3;
      case OnboardingStatus.section5:
        return 4;
      default:
        return 0;
    }
  }
}

class OnboardingState extends Equatable {
  final OnboardingStatus? onboardingStatus;
  final UserInfo? userInfo;
  final int currentPage;
  final int totalPage;
  final bool isButtonEnabled;
  final List<String>? agreementState;

  const OnboardingState({
    required this.onboardingStatus,
    required this.userInfo,
    required this.currentPage,
    required this.totalPage,
    required this.isButtonEnabled,
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
      totalPage: onboardingSections.length + joinSections.length,
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
      ),
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();

  OnboardingState copyWith({
    OnboardingStatus? onboardingStatus,
    UserInfo? userInfo,
    bool? isButtonEnabled,
    int? currentPage,
    int? totalPage,
    List<String>? agreementState,
  }) {
    return OnboardingState(
      onboardingStatus: onboardingStatus ?? this.onboardingStatus,
      currentPage: currentPage ?? this.currentPage,
      totalPage: totalPage ?? this.totalPage,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      userInfo: userInfo ?? this.userInfo,
      agreementState: agreementState ?? this.agreementState,
    );
  }
}
