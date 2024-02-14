import 'package:equatable/equatable.dart';

class MyPageQnaState extends Equatable {
  final List<dynamic>? qnaList;
  final List<dynamic>? qnaAnswerList;

  const MyPageQnaState({
    required this.qnaList,
    required this.qnaAnswerList,
  });

  @override
  List<Object?> get props => [qnaAnswerList, qnaList];
}
