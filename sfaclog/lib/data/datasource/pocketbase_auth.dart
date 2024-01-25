import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:url_launcher/url_launcher.dart';

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
