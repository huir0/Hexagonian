import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' hide ClientException;
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/model/sl_error_exception.dart';
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

  Future<bool> subscribeVerifiedEmail() async {
    await pb.collection('users').subscribe(pb.authStore.model.id, (e) {
      pb.collection('users').authRefresh();
    });
    return pb.authStore.model.data['verified'];
  }

  Future<RecordModel> updateUser({
    required String password,
    required String passwordConfirm,
    String? name,
    String? oldPassword,
  }) async {
    try {
      final record =
          await pb.collection('users').update(pb.authStore.model.id, body: {
        "emailVisibility": false,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "oldPassword": oldPassword ?? "1234qwer!",
        "name": name ?? pb.authStore.model.data['name'],
      });

      return record;
    } catch (_) {
      rethrow;
    }
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
        "email": email,
        "emailVisibility": true,
        "password": "1234qwer!",
        "passwordConfirm": "1234qwer!",
        "name": name,
      });

      print('temp user info!!!!!: $record');
      return record;
    } catch (e) {
      print('cant create temp user: $e');
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
      'email': email,
      'emailVisibility': true,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'name': name,
    });
    return result;
  }

  Future<RecordAuth?> loginWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authData = await pb.collection('users').authWithPassword(
            email,
            password,
          );

      return authData;
    } on ClientException catch (e) {
      throw SLErrorException(
        code: e.statusCode.toString(),
        message: e.response['message'],
      );
    } catch (e) {
      SLErrorException(
        code: 'Exception',
        message: e.toString(),
      );
    }
    return null;
  }

  Future<dynamic> findUser(String tagId) async {
    var data = await pb.collection('user').getList(filter: 'profile="$tagId"');
    return data;
  }

  Future<RecordModel> getUserInfoById(String id) async {
    final result = await pb.collection('user').getOne(
          id,
          expand: 'profile, skill',
        );
    print('pb auth: $result');
    return result;
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
