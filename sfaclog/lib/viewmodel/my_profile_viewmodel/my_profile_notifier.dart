import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/follow_model.dart';
import 'package:sfaclog/model/resume_experience_model.dart';
import '../../data/datasource/remote_datasource.dart';
import '../../model/link_model.dart';
import '../../model/profile_model.dart';
import '../../model/resume_education_model.dart';
import '../../model/users_model.dart';
import 'my_profile_state.dart';

class MyPageProfileNotifier extends StateNotifier<MyPageProfileState> {
  MyPageProfileNotifier() : super(const MyPageProfileState());
  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  Future<List<dynamic>> getExperiences(String userId) async {
    try {
      List<dynamic> experiencesList = await _remoteDataSource.getTableData(
        tableName: 'experience',
        filter: 'user.id = "$userId"',
        orderBy: '-endDate',
      );

      List<dynamic> experiences = experiencesList
          .map((exp) => ExperienceModel.fromJson(jsonDecode(exp.toString())))
          .toList();
      return experiences;
    } catch (e) {
      print('getExperiences $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getEducations(String userId) async {
    try {
      List<dynamic> educationsList = await _remoteDataSource.getTableData(
        tableName: 'education',
        filter: 'user.id = "$userId"',
        orderBy: '-endDate',
      );

      List<dynamic> educations = educationsList
          .map((edu) => EducationModel.fromJson(jsonDecode(edu.toString())))
          .toList();
      return educations;
    } catch (e) {
      print('getEducations $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getLinks(String userId) async {
    try {
      List<dynamic> linksList = await _remoteDataSource.getTableData(
        tableName: 'link',
        filter: 'user.id = "$userId"',
      );
      List<dynamic> links = linksList
          .map((link) => LinkModel.fromJson(jsonDecode(link.toString())))
          .toList();
      return links;
    } catch (e) {
      print('getLinks $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getTags(String tableName, List<dynamic> tagList) async {
    try {
      List<dynamic> tags = await Future.wait(tagList.map((tagId) async {
        var tagRecord = await _remoteDataSource.getOneRecord(tableName, tagId);
        var tag = tagRecord.data['name'];
        return tag;
      }).toList());

      return tags;
    } catch (e) {
      print('getTags $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getFollowers(String userId) async {
    try {
      List<dynamic> followersList =
          await _remoteDataSource.getExpandedTableData(
              tableName: 'follow',
              filter: 'following.id = "$userId"',
              expand: 'follower');
      List<dynamic> followers = followersList
          .map((follower) =>
              FollowModel.fromJson(jsonDecode(follower.toString())))
          .toList();
      return followers;
    } catch (e) {
      print('getFollowers $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getFollowings(String userId) async {
    try {
      List<dynamic> followingsList =
          await _remoteDataSource.getExpandedTableData(
              tableName: 'follow',
              filter: 'follower.id = "$userId"',
              expand: 'following');
      List<dynamic> followings = followingsList
          .map((following) =>
              FollowModel.fromJson(jsonDecode(following.toString())))
          .toList();
      return followings;
    } catch (e) {
      print('getFollowers $e');
      rethrow;
    }
  }

  // User 정보 가져오기
  Future<ProfileInfo> getUserInfo(String userId) async {
    try {
      final record = await _remoteDataSource.getOneRecord('user', userId);
      ProfileInfo userInfo = ProfileInfo.fromJson(record.data);
      return userInfo;
    } catch (e) {
      print('getUserInfo $e');
      rethrow;
    }
  }

  Future<UsersModel> getUsersInfo(String userId) async {
    try {
      RecordModel userInfo = await _remoteDataSource.getFilteredRecord(
          'user', 'id = "$userId"', 'profile');

      List<RecordModel>? profileList = userInfo.expand['profile'];
      List<UsersModel> users = profileList!
          .map((item) => UsersModel.fromJson(jsonDecode(jsonEncode(item))))
          .toList();

      return users[0];
    } catch (e) {
      print('getUsersInfo $e');
      rethrow;
    }
  }

  void setExperiences(List<dynamic> experiences) {
    state = state.copyWith(experiences: experiences);
  }

  void setEducations(List<dynamic> educations) {
    state = state.copyWith(educations: educations);
  }

  void setLinks(List<dynamic> links) {
    state = state.copyWith(links: links);
  }

  void setFollowers(List<dynamic> followers) {
    state = state.copyWith(followers: followers);
  }

  void setFollowings(List<dynamic> followings) {
    state = state.copyWith(followings: followings);
  }

  void setUserInfo(ProfileInfo userInfo) {
    state = state.copyWith(userInfo: userInfo);
  }
}

final MyPageProfileProvider =
    StateNotifierProvider<MyPageProfileNotifier, MyPageProfileState>((ref) {
  return MyPageProfileNotifier();
});
