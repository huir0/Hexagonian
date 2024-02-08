import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sfaclog/viewmodel/auth/oauth2_auth_state.dart';

class OAuth2Notifier extends StateNotifier<OAuth2State> {
  OAuth2Notifier() : super(OAuth2State.init());

  void setOAuthData(RecordAuth authData) {
    try {
      state = state.copyWith(
        recordAuth: authData,
        authStatus: OAuth2Status.success,
      );
    } catch (error) {
      state = state.copyWith(authStatus: OAuth2Status.error);
      return;
    }
  }
}

final oAuth2Provider = StateNotifierProvider<OAuth2Notifier, OAuth2State>(
  (ref) {
    final oauth2Notifier = OAuth2Notifier();
    ref.onDispose(() {
      oauth2Notifier.dispose();
    });
    return oauth2Notifier;
  },
);
