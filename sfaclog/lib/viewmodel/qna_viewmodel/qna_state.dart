// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:sfaclog/model/sfac_qna_model.dart';

enum QnaStatus {
  init,
  success,
  error,
}

class QnaState extends Equatable {
  final QnaStatus qnaStatus;
  final List<SFACQnaModel> allQnaList;

  const QnaState({
    required this.qnaStatus,
    required this.allQnaList,
  });

  factory QnaState.init({
    List<SFACQnaModel>? allQnaList,
  }) {
    return const QnaState(
      qnaStatus: QnaStatus.init,
      allQnaList: [],
    );
  }

  @override
  List<Object> get props => [qnaStatus, allQnaList];

  QnaState copyWith({
    QnaStatus? qnaStatus,
    List<SFACQnaModel>? allQnaList,
  }) {
    return QnaState(
      qnaStatus: qnaStatus ?? this.qnaStatus,
      allQnaList: allQnaList ?? this.allQnaList,
    );
  }
}
