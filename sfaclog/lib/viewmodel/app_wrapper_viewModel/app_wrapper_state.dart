import 'package:equatable/equatable.dart';

class AppWrapperState extends Equatable {
  final int page;
  final bool fabVisible;
  const AppWrapperState({this.page = 0, this.fabVisible = false});

  AppWrapperState copyWith({
    int? page,
    bool? fabVisible,
  }) {
    return AppWrapperState(
        page: page ?? this.page, fabVisible: fabVisible ?? this.fabVisible);
  }

  @override
  List<Object> get props => [page, fabVisible];
}
