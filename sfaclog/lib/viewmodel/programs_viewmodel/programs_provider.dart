import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sfaclog/data/datasource/programs_repository.dart';
import 'package:sfaclog/model/sfac_program_model.dart';
import 'package:sfaclog/viewmodel/programs_viewmodel/programs_state.dart';

class ProgramsProvider extends StateNotifier<ProgramsState> {
  ProgramsProvider() : super(ProgramsState.init());

  //get programs
  Future<void> getPrograms({int? count}) async {
    try {
      state = state.copyWith(programStatus: ProgramsStatus.fetching);
      var programs = await ProgramsRepository().getPrograms(count);

      List<SfacProgramModel> result = programs.items.map((program) {
        return SfacProgramModel.fromMap(program.toJson());
      }).toList();

      state = state.copyWith(
        programs: result,
        programStatus: ProgramsStatus.success,
      );
    } catch (e) {
      state = state.copyWith(programStatus: ProgramsStatus.error);
      rethrow;
    }
  }
}

final programsProvider = StateNotifierProvider<ProgramsProvider, ProgramsState>(
  (ref) {
    return ProgramsProvider();
  },
);
