// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';

enum CreateQnaStatus {
  init,
  success,
  error,
}

class CreateQnaState extends Equatable {
  final CreateQnaStatus qnaStatus;
  final SFACQnaModel? question;
  final String? title;
  final String? content;
  final List<dynamic> tag;

  const CreateQnaState({
    required this.qnaStatus,
    required this.question,
    required this.title,
    required this.content,
    required this.tag,
  });

  factory CreateQnaState.init({
    SFACQnaModel? question,
    String? content,
    List<dynamic>? tag,
    String? title,
  }) {
    return CreateQnaState(
      qnaStatus: CreateQnaStatus.init,
      question: null,
      content: content ?? '',
      tag: tag ?? [],
      title: title ?? '',
    );
  }

  @override
  List<Object?> get props {
    return [
      qnaStatus,
      question,
      title,
      content,
      tag,
    ];
  }

  CreateQnaState copyWith({
    CreateQnaStatus? qnaStatus,
    SFACQnaModel? question,
    String? title,
    String? content,
    List<dynamic>? tag,
  }) {
    return CreateQnaState(
      qnaStatus: qnaStatus ?? this.qnaStatus,
      question: question ?? this.question,
      title: title ?? this.title,
      content: content ?? this.content,
      tag: tag ?? this.tag,
    );
  }
}
