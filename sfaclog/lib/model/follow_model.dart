import 'package:freezed_annotation/freezed_annotation.dart';
part 'follow_model.freezed.dart';
part 'follow_model.g.dart';

@freezed
class FollowModel with _$FollowModel {
  const factory FollowModel({
    required String id,
    required String collectionId,
    required String collectionName,
    required Map<String, dynamic> expand,
    required String follower,
    required String following,
  }) = _FollowModel;

  factory FollowModel.fromJson(Map<String, dynamic> json) =>
      _$FollowModelFromJson(json);
}
