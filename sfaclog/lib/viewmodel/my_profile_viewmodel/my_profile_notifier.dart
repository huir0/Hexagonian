import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/resume_experience_model.dart';
import '../../data/datasource/remote_datasource.dart';
import '../../model/link_model.dart';
import '../../model/profile_model.dart';
import '../../model/resume_education_model.dart';
import 'my_profile_state.dart';

class MyPageProfileNotifier extends StateNotifier<MyPageProfileState> {
  MyPageProfileNotifier()
      : super(const MyPageProfileState(
            experiences: [], educations: [], links: []));
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

  void setExperiences(List<dynamic> experiences) {
    state = state.copyWith(experiences: [...experiences]);
  }

  void setEducations(List<dynamic> educations) {
    state = state.copyWith(educations: educations);
  }

  void setLinks(List<dynamic> links) {
    state = state.copyWith(links: links);
  }
}

final MyPageProfileProvider =
    StateNotifierProvider<MyPageProfileNotifier, MyPageProfileState>((ref) {
  return MyPageProfileNotifier();
});
