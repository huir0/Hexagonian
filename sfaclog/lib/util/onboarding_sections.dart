import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/onboarding_page_widgets/profile_section.dart';
import 'package:sfaclog/view/widgets/onboarding_page_widgets/propose_section.dart';
import 'package:sfaclog/view/widgets/onboarding_page_widgets/skill_section.dart';

List<Widget> onboardingSections = [
  const ProfileSection(),
  const SkillSection(),
  const ProposeSection(),
];
