import 'package:equatable/equatable.dart';

class MyPageState extends Equatable {
  final int tab;
  const MyPageState({this.tab = 0});

  MyPageState copyWith({
    int? tab,
  }) {
    return MyPageState(tab: tab ?? this.tab);
  }

  @override
  List<Object> get props => [tab];
}

class MyFollowPageState extends Equatable {
  final int tab;
  const MyFollowPageState({this.tab = 0});

  MyFollowPageState copyWith({
    int? tab,
  }) {
    return MyFollowPageState(tab: tab ?? this.tab);
  }

  @override
  List<Object> get props => [tab];
}
