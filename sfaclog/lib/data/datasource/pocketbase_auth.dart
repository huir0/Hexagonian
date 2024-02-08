import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';

class PocketbaseAuth {
  PocketbaseAuth();

  final pb = PocketBase('http://43.202.59.218:8090');

  Future<RecordModel> createUserInfo({
    required String nickname,
    required List<String> agreement,
    required List<String> skill,
    required String user,
    String? picture,
    required String propose_state,
  }) async {
    RecordModel result = await pb.collection('user').create(body: {
      'user': user,
      'agreement': agreement,
      'nickname': nickname,
      'picture': picture ?? '',
      'skill': skill,
      'propose_state': propose_state,
    });

    return result;
  }

  void updateUser({
    required String nickname,
    required String password,
    required String passwordConfirm,
    required String name,
    required String recordId,
  }) async {
    final record = await pb.collection('users').update('RECORD_ID', body: {
      "username": nickname,
      "emailVisibility": false,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "oldPassword": "12345678",
      "name": name,
    });
  }

  void deleteTempUser(String id) async {
    await pb.collection('users').delete('RECORD_ID');
  }

  Future<RecordModel> createTempUser({
    required String name,
    required String email,
  }) async {
    final record = await pb.collection('users').create(body: {
      "username": name,
      "email": email,
      "emailVisibility": true,
      "password": "12345678",
      "passwordConfirm": "12345678",
      "name": name,
    });
    return record;
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
