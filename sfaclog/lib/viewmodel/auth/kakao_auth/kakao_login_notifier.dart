import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sfaclog/viewmodel/auth/kakao_auth/kakao_login_state.dart';

class KakaoLoginNotifier extends StateNotifier<KakaoAuthState> {
  KakaoLoginNotifier() : super(KakaoAuthState.init());

  void kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          state = state.copyWith(authStatus: SNSAuthStatus.error);
          return;
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          state = state.copyWith(authStatus: SNSAuthStatus.error);
          return;
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
      } catch (error) {
        state = state.copyWith(authStatus: SNSAuthStatus.error);
        return;
      }
    }
    // OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    // print(token);

    getUserInfoWKakao();
  }

  void getKakaoToken() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void kakaoLogout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
      rethrow;
    }
  }

  void kakaoUnlink() async {
    try {
      await UserApi.instance.unlink();
      print('연결 끊기 성공, SDK에서 토큰 삭제');
    } catch (error) {
      print('연결 끊기 실패 $error');
    }
  }

  Future getUserInfoWKakao() async {
    try {
      User user = await UserApi.instance.me();
      print('\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}');

      state = state.copyWith(
        userInfo: user,
        authStatus: SNSAuthStatus.success,
      );
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
      state = state.copyWith(authStatus: SNSAuthStatus.error);
    }
  }
}

final kakaoLoginProvider =
    StateNotifierProvider<KakaoLoginNotifier, KakaoAuthState>(
  (ref) {
    final kakaoLoginNotifier = KakaoLoginNotifier();
    ref.onDispose(() {
      kakaoLoginNotifier.dispose();
    });
    return kakaoLoginNotifier;
  },
);

// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
// import 'package:sfaclog/data/datasource/pocketbase_auth.dart';
// import 'package:sfaclog/viewmodel/auth/kakao_auth/kakao_login_state.dart';

// class KakaoLoginNotifier extends StateNotifier<KakaoAuthState> {
//   final PocketbaseAuth pocketbaseAuthProvider;

//   KakaoLoginNotifier(this.pocketbaseAuthProvider)
//       : super(KakaoAuthState.init());

//   void kakaoLogin() async {
//     if (await isKakaoTalkInstalled()) {
//       try {
//         await UserApi.instance.loginWithKakaoTalk();
//       } catch (error) {
//         if (error is PlatformException && error.code == 'CANCELED') {
//           state = state.copyWith(authStatus: SNSAuthStatus.error);
//           rethrow;
//         }
//         try {
//           await UserApi.instance.loginWithKakaoAccount();
//         } catch (error) {
//           state = state.copyWith(authStatus: SNSAuthStatus.error);
//           rethrow;
//         }
//       }
//     } else {
//       try {
//         await UserApi.instance.loginWithKakaoAccount();
//       } catch (error) {
//         state = state.copyWith(authStatus: SNSAuthStatus.error);
//         rethrow;
//       }
//     }
//     getUserInfoWKakao();
//   }

//   Future getUserInfoWKakao() async {
//     try {
//       User user = await UserApi.instance.me();

//       state = state.copyWith(
//         userInfo: user,
//         authStatus: SNSAuthStatus.success,
//       );
//     } catch (error) {
//       print('사용자 정보 요청 실패 $error');
//       state = state.copyWith(authStatus: SNSAuthStatus.error);
//       rethrow;
//     }
//   }
// }

// final kakaoLoginProvider =
//     StateNotifierProvider<KakaoLoginNotifier, KakaoAuthState>(
//   (ref) {
//     final kakaoLoginNotifier = KakaoLoginNotifier(PocketbaseAuth());
//     ref.onDispose(() {
//       kakaoLoginNotifier.dispose();
//     });
//     return kakaoLoginNotifier;
//   },
// );
