// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:sfaclog/model/skill_model.dart';

class LogSearchState extends Equatable {
  final List<SkillModel>? skillModel;
  const LogSearchState({
    this.skillModel,
  });

  LogSearchState copyWith({
    List<SkillModel>? skillModel,
  }) {
    return LogSearchState(
      skillModel: skillModel ?? this.skillModel,
    );
  }

  @override
  List<Object> get props => [skillModel!];
}
