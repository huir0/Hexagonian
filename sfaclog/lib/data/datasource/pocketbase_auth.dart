import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';

class PocketbaseAuth {
  PocketbaseAuth();

  final pb = PocketBase('http://43.202.59.218:8090');

  Future<void> authRefresh() async {
    try {
      await pb.collection('users').authRefresh();
    } catch (e) {
      print('authRefresh error: $e');
      rethrow;
    }
  }

  Future<String?> uploadProfileImage(
    String tableName,
    List<MultipartFile> files,
  ) async {
    try {
      final record = await pb.collection(tableName).create(
            files: files,
          );
      return record.id;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<RecordModel> createUserInfo({
    required String nickname,
    required List<String> agreement,
    required List<String> skill,
    required String user,
    String? picture,
    required String propose_state,
  }) async {
    RecordModel result = await pb.collection('user').create(body: {
      'profile': user,
      'agreement': agreement,
      'nickname': nickname,
      'picture': picture ?? '',
      'skill': skill,
      'propose_state': propose_state,
    });

    return result;
  }

  Future<RecordModel> updateUser({
    required String nickname,
    required String password,
    required String passwordConfirm,
    required String name,
    required String userId,
  }) async {
    final record = await pb.collection('users').update(userId, body: {
      "username": nickname,
      "emailVisibility": false,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "oldPassword": "1234qwer!",
      "name": name,
    });

    return record;
  }

  void deleteTempUser(String id) async {
    await pb.collection('users').delete(id);
  }

  Future<RecordModel> createTempUser({
    required String name,
    required String email,
  }) async {
    try {
      final record = await pb.collection('users').create(body: {
        "username": name,
        "email": email,
        "emailVisibility": true,
        "password": "1234qwer!",
        "passwordConfirm": "1234qwer!",
        "name": name,
      });

      print('temp user info!!!!!: $record');
      return record;
    } catch (e) {
      print('cant create tempuser: $e');
      rethrow;
    }
  }

  Future<RecordModel> setUserData({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
    required String nickname,
  }) async {
    RecordModel result = await pb.collection('users').create(body: {
      'username': nickname,
      'email': email,
      'emailVisibility': true,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'name': name,
    });
    return result;
  }

  Future<RecordAuth> loginWithPassword({
    required String email,
    required String password,
  }) async {
    final authData = await pb.collection('users').authWithPassword(
          email,
          password,
        );
    return authData;
  }

  Future<dynamic> findUser(String tagId) async {
    var data = await pb.collection('user').getList(filter: 'profile="$tagId"');
    return data;
  }

  void requestVerification({
    required String email,
  }) async {
    await pb.collection('users').requestVerification(email);
  }

  void confirmVerification({
    required String token,
  }) async {
    await pb.collection('users').confirmVerification(token);
    await pb.collection('users').authRefresh();
  }

  Future<RecordAuth> signinWithOAuth2(String provider) async {
    try {
      final authData = await pb.collection('users').authWithOAuth2(
        provider,
        (url) async {
          await launchUrl(url);
        },
      );
      return authData;
    } catch (e) {
      rethrow;
    }
  }

  void logout() {
    pb.authStore.clear();
  }
}

final pocketbaseAuthProvider = Provider<PocketbaseAuth>(
  (ref) => PocketbaseAuth(),
);
