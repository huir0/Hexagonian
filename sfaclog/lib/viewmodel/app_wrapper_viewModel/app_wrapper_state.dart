import 'package:equatable/equatable.dart';

class AppWrapperState extends Equatable {
  final int page;
  const AppWrapperState({this.page = 0});

  AppWrapperState copyWith({
    int? page,
  }) {
    return AppWrapperState(page: page ?? this.page);
  }

  @override
  List<Object> get props => [page];
}
