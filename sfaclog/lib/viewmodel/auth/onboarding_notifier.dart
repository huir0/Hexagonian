import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/model/skill_model.dart';
import 'package:sfaclog/model/user_info.dart';
import 'package:sfaclog/model/user_model.dart';
import 'package:sfaclog/viewmodel/auth/onboarding_state.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingState.init());

  void setButtonEnabled(bool isEnabled) {
    state = state.copyWith(
      isButtonEnabled: isEnabled,
    );
  }

  void moveNextSection() {
    if (state.currentPage + 1 == state.totalPage) {
      return;
    }
    print(state.currentPage);
    state = state.copyWith(
      currentPage: state.currentPage + 1,
    );
  }

  void setTotalPage(int length) {
    state = state.copyWith(
      totalPage: length,
    );
  }

  void uploadNameAndEmail({
    required String name,
    required String email,
  }) {
    try {
      UserModel newUserData = state.userInfo!.user!.copyWith(
        name: name,
        username: name,
        email: email,
      );
      state = state.copyWith(
        onboardingStatus: OnboardingStatus.section1,
        userInfo: state.userInfo!.copyWith(
          user: newUserData,
        ),
      );
      print(state.userInfo);
    } catch (e) {
      state = state.copyWith(onboardingStatus: OnboardingStatus.error);
      rethrow;
    }
    state = state.copyWith(onboardingStatus: OnboardingStatus.section2);
  }

  void uploadPasswordAndTerms({
    required String password,
    required String passwordConfirm,
    required terms,
  }) {
    try {
      state = state.copyWith(
        onboardingStatus: OnboardingStatus.section2,
        password: password,
        passwordConfirm: passwordConfirm,
        userInfo: state.userInfo!.copyWith(
          agreementState: terms,
        ),
      );
      print(state.userInfo);
    } catch (e) {
      state = state.copyWith(onboardingStatus: OnboardingStatus.error);
      rethrow;
    }
  }

  void uploadNicknameProfile({
    required String nickname,
    required String? profile,
  }) {
    try {
      state = state.copyWith(
        onboardingStatus: OnboardingStatus.section3,
        userInfo: state.userInfo!.copyWith(
          nickname: nickname,
          picture: profile,
        ),
      );
      print(state.userInfo);
    } catch (e) {
      state = state.copyWith(onboardingStatus: OnboardingStatus.error);
      rethrow;
    }
  }

  void uploadSkills({
    required List<SkillModel> skills,
  }) {
    try {
      state = state.copyWith(
        onboardingStatus: OnboardingStatus.section4,
        userInfo: state.userInfo!.copyWith(
          skill: skills,
        ),
      );
      print(state.userInfo);
    } catch (e) {
      state = state.copyWith(onboardingStatus: OnboardingStatus.error);
      rethrow;
    }
  }

  void uploadProposeState({
    required String proposeState,
  }) {
    try {
      state = state.copyWith(
        onboardingStatus: OnboardingStatus.section5,
        userInfo: state.userInfo!.copyWith(
          proposeState: proposeState,
        ),
      );
      print(state.userInfo);
    } catch (e) {
      state = state.copyWith(onboardingStatus: OnboardingStatus.error);
      rethrow;
    }
  }

  void setOnboardingState(UserInfo? userInfo) {
    state = state.copyWith(
      userInfo: userInfo,
      onboardingStatus: OnboardingStatus.success,
    );
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingState>(
  (ref) {
    return OnboardingNotifier();
  },
);
