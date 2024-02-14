import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/remote_datasource.dart';

class ToggleState extends StateNotifier<bool> {
  ToggleState() : super(false);

  final RemoteDataSource _remoteDataSource = RemoteDataSource();

  void updateValue(bool value, String userId) {
    state = value;
    final body = <String, dynamic>{
      'propose_state': value ? 'all_offer' : 'no_offer',
    };
    _remoteDataSource.updateTableData('user', userId, body);
  }
}

final toggleProvider =
    StateNotifierProvider<ToggleState, bool>((ref) => ToggleState());
