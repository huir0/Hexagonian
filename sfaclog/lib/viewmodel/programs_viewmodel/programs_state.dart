// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_program_model.dart';

enum ProgramsStatus {
  init,
  fetching,
  success,
  error,
}

class ProgramsState extends Equatable {
  final ProgramsStatus programStatus;
  final List<SfacProgramModel> programs;

  const ProgramsState({
    required this.programStatus,
    required this.programs,
  });

  factory ProgramsState.init({
    List<SfacProgramModel>? programs,
  }) {
    return const ProgramsState(
      programStatus: ProgramsStatus.init,
      programs: [],
    );
  }

  @override
  List<Object> get props => [programStatus, programs];

  ProgramsState copyWith({
    ProgramsStatus? programStatus,
    List<SfacProgramModel>? programs,
  }) {
    return ProgramsState(
      programStatus: programStatus ?? this.programStatus,
      programs: programs ?? this.programs,
    );
  }
}
