// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String? id;
  final String? username;
  final String? email;
  final String? name;
  final DateTime? created;
  final DateTime? updated;
  const UserInfo({
    this.id,
    this.username,
    this.email,
    this.name,
    this.created,
    this.updated,
  });

  UserInfo copyWith({
    String? id,
    String? username,
    String? email,
    String? name,
    DateTime? created,
    DateTime? updated,
  }) {
    return UserInfo(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'created': created?.millisecondsSinceEpoch,
      'updated': updated?.millisecondsSinceEpoch,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id'] != null ? map['id'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      created: map['created'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created'] as int)
          : null,
      updated: map['updated'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      name,
      created,
      updated,
    ];
  }
}
