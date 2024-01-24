import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketbaseAuth {
  PocketbaseAuth();

  final pb = PocketBase('http://43.202.59.218:8090');

  void setUserData({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  }) async {
    await pb.collection('users').create(body: {
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'name': name,
    });
  }

  void setUserDataPbFromKakao(
    User userData,
  ) async {
    final authData = await pb.collection('users').authWithOAuth2(
      'kakao',
      (url) async {
        print('redirect url: $url');
      },
      createData: {
        'username': userData.kakaoAccount?.profile?.nickname,
        'email': userData.kakaoAccount?.email,
        'name': userData.kakaoAccount?.profile?.nickname,
        'created': DateTime.now(),
        'updated': DateTime.now(),
      },
    );
  }

  void logout() {
    pb.authStore.clear();
  }
}

final pocketbaseAuthProvider = Provider<PocketbaseAuth>(
  (ref) => PocketbaseAuth(),
);
