import 'package:equatable/equatable.dart';

enum AnswerStatus {
  init,
  pending,
  success,
  error,
}

class AnswerState extends Equatable {
  final AnswerStatus answerStatus;
  final String answer;

  const AnswerState({
    required this.answerStatus,
    required this.answer,
  });

  factory AnswerState.init({
    AnswerStatus? answerStatus,
    String? answer,
  }) {
    return const AnswerState(
      answerStatus: AnswerStatus.init,
      answer: '',
    );
  }

  AnswerState copyWith({
    AnswerStatus? answerStatus,
    String? answer,
  }) {
    return AnswerState(
      answerStatus: answerStatus ?? this.answerStatus,
      answer: answer ?? this.answer,
    );
  }

  @override
  List<Object> get props => [
        answerStatus,
        answer,
      ];
}
