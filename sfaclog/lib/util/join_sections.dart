import 'package:flutter/material.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/name_mail_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/profile_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/propose_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/pw_confirm_section.dart';
import 'package:sfaclog/view/widgets/join_page_widgets/skill_section.dart';

List<Widget> joinSections = [
  const NameMailSection(),
  const PwConfirmSection(),
  const ProfileSection(),
  const SkillSection(),
  const ProposeSection(),
];
