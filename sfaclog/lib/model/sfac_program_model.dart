// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SfacProgramModel extends Equatable {
  final String id;
  final String title;
  final String thumbnail;
  final String link;

  const SfacProgramModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.link,
  });

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title, thumbnail, link];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'link': link,
    };
  }

  factory SfacProgramModel.fromMap(Map<String, dynamic> map) {
    return SfacProgramModel(
      id: map['id'] as String,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      link: map['link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SfacProgramModel.fromJson(String source) =>
      SfacProgramModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
